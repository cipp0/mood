/*
    reverbsc.c: reverbsc and reverbsc2 of Csound

    Copyright 1999, 2005 Sean Costello and Istvan Varga

    8 delay line FDN reverb, with feedback matrix based upon
    physical modeling scattering junction of 8 lossless waveguides
    of equal characteristic impedance. Based on Julius O. Smith III,
    "A New Approach to Digital Reverberation using Closed Waveguide
    Networks," Proceedings of the International Computer Music
    Conference 1985, p. 47-53 (also available as a seperate
    publication from CCRMA), as well as some more recent papers by
    Smith and others.

    Csound orchestra version coded by Sean Costello, October 1999

    C implementation (C) 2005 Istvan Varga

    This file is part of Csound.

    The Csound Library is free software; you can redistribute it
    and/or modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    Csound is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with Csound; if not, write to the Free Software
    Foundation, Inc., 31 Milk Street, #960789, Boston, MA, 02196, USA

    csoundport: the Csound code with the API removed, "csoundport:" marks changes.
*/

#include "reverbsc.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>

#define DEFAULT_SRATE   44100.0
#define MIN_SRATE       5000.0
#define MAX_SRATE       1000000.0
#define MAX_PITCHMOD    20.0
#define DELAYPOS_SHIFT  28
#define DELAYPOS_SCALE  0x10000000
#define DELAYPOS_MASK   0x0FFFFFFF
#define TWOPI           (2.0*M_PI)

static const double reverbParams[8][4] = {
    { (2473.0 / DEFAULT_SRATE), 0.0010, 3.100,  1966.0 },
    { (2767.0 / DEFAULT_SRATE), 0.0011, 3.500, 29491.0 },
    { (3217.0 / DEFAULT_SRATE), 0.0017, 1.110, 22937.0 },
    { (3557.0 / DEFAULT_SRATE), 0.0006, 3.973,  9830.0 },
    { (3907.0 / DEFAULT_SRATE), 0.0010, 2.341, 20643.0 },
    { (4127.0 / DEFAULT_SRATE), 0.0011, 1.897, 22937.0 },
    { (2143.0 / DEFAULT_SRATE), 0.0017, 0.891, 29491.0 },
    { (1933.0 / DEFAULT_SRATE), 0.0006, 3.221, 14417.0 }
};

static const double outputGain  = 0.35;
static const double jpScale     = 0.25;

static int32_t delay_line_max_samples(rsc_reverb *p, int32_t n)
{
    double  maxDel;

    maxDel = reverbParams[n][0];
    maxDel += (reverbParams[n][1] * p->pitchMod * 1.125);
    return (int32_t) (maxDel * p->sampleRate + 16.5);
}

static inline void next_random_lineseg(rsc_reverb *p, rsc_line *lp, int32_t n)
{
    double  prvDel, nxtDel, phs_incVal;

    /* update random seed */
    if (lp->seedVal < 0)
      lp->seedVal += 0x10000;
    lp->seedVal = (lp->seedVal * 15625 + 1) & 0xFFFF;
    if (lp->seedVal >= 0x8000)
      lp->seedVal -= 0x10000;
    /* length of next segment in samples */
    lp->randLine_cnt = (int32_t) ((p->sampleRate / reverbParams[n][2]) + 0.5);
    prvDel = (double) lp->writePos;
    prvDel -= ((double) lp->readPos
               + ((double) lp->readPosFrac / (double) DELAYPOS_SCALE));
    while (prvDel < 0.0)
      prvDel += (double) lp->bufferSize;
    prvDel = prvDel / p->sampleRate;    /* previous delay time in seconds */
    nxtDel = (double) lp->seedVal * reverbParams[n][1] / 32768.0;
    /* next delay time in seconds */
    nxtDel = reverbParams[n][0] + (nxtDel * p->pitchMod);
    /* calculate phase increment per sample */
    phs_incVal = (prvDel - nxtDel) / (double) lp->randLine_cnt;
    phs_incVal = phs_incVal * p->sampleRate + 1.0;
    lp->readPosFrac_inc = (int32_t) (phs_incVal * DELAYPOS_SCALE + 0.5);
}

static void init_delay_line(rsc_reverb *p, rsc_line *lp, int32_t n)
{
    double  readPos;

    /* calculate length of delay line */
    lp->bufferSize = delay_line_max_samples(p, n);
    lp->writePos = 0;
    /* set random seed */
    lp->seedVal = (int32_t) (reverbParams[n][3] + 0.5);
    /* set initial delay time */
    readPos = (double) lp->seedVal * reverbParams[n][1] / 32768;
    readPos = reverbParams[n][0] + (readPos * p->pitchMod);
    readPos = (double) lp->bufferSize - (readPos * p->sampleRate);
    lp->readPos = (int32_t) readPos;
    readPos = (readPos - (double) lp->readPos) * (double) DELAYPOS_SCALE;
    lp->readPosFrac = (int32_t) (readPos + 0.5);
    /* initialise first random line segment */
    next_random_lineseg(p, lp, n);
    /* clear delay line to zero */
    lp->filterState = 0.0;
    memset(lp->buf, 0, sizeof(double)*lp->bufferSize);
}

void rsc_free(rsc_reverb *p)
{
    free(p->mem);
    p->mem = NULL;
}

int32_t rsc_init(rsc_reverb *p, double sr, double pitchmod)
{
    int32_t i;
    size_t total = 0;

    memset(p, 0, sizeof(*p));
    p->sampleRate = sr;
    p->pitchMod = pitchmod;
    if (!(sr >= MIN_SRATE && sr <= MAX_SRATE) || !(pitchmod >= 0.0 && pitchmod <= MAX_PITCHMOD))
      return -1;
    for (i = 0; i < 8; i++)
      total += (size_t)delay_line_max_samples(p, i);
    p->mem = malloc(total*sizeof(double));
    if (!p->mem)
      return -1;
    total = 0;
    for (i = 0; i < 8; i++) {
      p->lines[i].buf = p->mem + total;
      total += (size_t)delay_line_max_samples(p, i);
    }
    rsc_clear(p);
    return 0;
}

void rsc_clear(rsc_reverb *p)
{
    if (!p->mem)
      return;
    for (int32_t i = 0; i < 8; i++)
      init_delay_line(p, &p->lines[i], i);
    p->dampFact = 1.0;
    p->prv_LPFreq = 0.0;
}

void rsc_perform(rsc_reverb *p, int32_t linear2, const double *inL, const double *inR,
                 double kFeedBack, double kLPFreq, double *outL, double *outR, uint32_t nsmps)
{
    double    ainL, ainR, aoutL, aoutR;
    double    vm1, v0, v1, v2, am1, a0, a1, a2, frac;
    rsc_line *lp;
    int32_t       readPos;
    uint32_t i, n;
    int32_t       bufferSize; /* Local copy */
    double    dampFact = p->dampFact;
    int32_t linear = p->pitchMod == 0 ? 0 : 1;

    if (!p->mem) {
      memset(outL, 0, nsmps*sizeof(double));
      memset(outR, 0, nsmps*sizeof(double));
      return;
    }
    /* calculate tone filter coefficient if frequency changed */
    if (kLPFreq != p->prv_LPFreq) {
      p->prv_LPFreq = kLPFreq;
      dampFact = 2.0 - cos(p->prv_LPFreq * TWOPI / p->sampleRate);
      dampFact = p->dampFact = dampFact - sqrt(dampFact * dampFact - 1.0);
    }
    /* update delay lines */
    for (i = 0; i < nsmps; i++) {
      /* calculate "resultant junction pressure" and mix to input signals */
      ainL = aoutL = aoutR = 0.0;
      for (n = 0; n < 8; n++)
        ainL += p->lines[n].filterState;
      ainL *= jpScale;
      ainR = ainL + inR[i];
      ainL = ainL + inL[i];
      /* loop through all delay lines */
      for (n = 0; n < 8; n++) {
        lp = &p->lines[n];
        bufferSize = lp->bufferSize;
        /* send input signal and feedback to delay line */
        lp->buf[lp->writePos] = ((n & 1 ? ainR : ainL)
                                         - lp->filterState);
        if (++lp->writePos >= bufferSize)
          lp->writePos -= bufferSize;
        /* read from delay line with cubic interpolation */
        if (lp->readPosFrac >= DELAYPOS_SCALE) {
          lp->readPos += (lp->readPosFrac >> DELAYPOS_SHIFT);
          lp->readPosFrac &= DELAYPOS_MASK;
        }
        if (lp->readPos >= bufferSize)
          lp->readPos -= bufferSize;
        if (linear2) {
          /* reverbsc2 */
          if (linear) {
            frac = (double) lp->readPosFrac * (1.0 / (double) DELAYPOS_SCALE);
            v0 = lp->buf[lp->readPos];
            v1 = lp->readPos != bufferSize - 1 ? lp->buf[lp->readPos + 1] : lp->buf[0];
            v0 = (v1 - v0) * frac + v0;
          } else v0 = lp->buf[lp->readPos];
        }
        else {
        readPos = lp->readPos;
        frac = (double) lp->readPosFrac * (1.0 / (double) DELAYPOS_SCALE);
        /* calculate interpolation coefficients */
        a2 = frac * frac; a2 -= 1.0; a2 *= (1.0 / 6.0);
        a1 = frac; a1 += 1.0; a1 *= 0.5; am1 = a1 - 1.0;
        a0 = 3.0 * a2; a1 -= a0; am1 -= a2; a0 -= frac;
        /* read four samples for interpolation */
        if (readPos > 0 && readPos < (bufferSize - 2)) {
          vm1 = (lp->buf[readPos - 1]);
          v0  = (lp->buf[readPos]);
          v1  = (lp->buf[readPos + 1]);
          v2  = (lp->buf[readPos + 2]);
        }
        else {
          /* at buffer wrap-around, need to check index */
          if (--readPos < 0) readPos += bufferSize;
          vm1 = lp->buf[readPos];
          if (++readPos >= bufferSize) readPos -= bufferSize;
          v0 = lp->buf[readPos];
          if (++readPos >= bufferSize) readPos -= bufferSize;
          v1 = lp->buf[readPos];
          if (++readPos >= bufferSize) readPos -= bufferSize;
          v2 = lp->buf[readPos];
        }
        v0 = (am1 * vm1 + a0 * v0 + a1 * v1 + a2 * v2) * frac + v0;
        }
        /* update buffer read position */
        lp->readPosFrac += lp->readPosFrac_inc;
        /* apply feedback gain and lowpass filter */
        v0 *= kFeedBack;
        v0 = (lp->filterState - v0) * dampFact + v0;
        lp->filterState = v0;
        /* mix to output */
        if (n & 1)
          aoutR += v0;
        else
          aoutL += v0;
        /* start next random line segment if current one has reached endpoint */
        if (--(lp->randLine_cnt) <= 0)
          next_random_lineseg(p, lp, n);
      }
      outL[i] = (aoutL * outputGain);
      outR[i] = (aoutR * outputGain);
    }
}
