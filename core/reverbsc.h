/*
    reverbsc.h: Csound's reverbsc and reverbsc2 (Opcodes/reverbsc.c), Sean
    Costello's 8 delay line feedback delay network. csoundport, LGPL 2.1.
*/

#pragma once

#include <stdint.h>

typedef struct {
    int32_t writePos, bufferSize, readPos, readPosFrac, readPosFrac_inc;
    int32_t seedVal, randLine_cnt;
    double filterState;
    double *buf;
} rsc_line;

typedef struct {
    double sampleRate, pitchMod, dampFact, prv_LPFreq;
    rsc_line lines[8];
    double *mem;
} rsc_reverb;

/* sr: the rate the delay times are computed for (the host rate, or Csound's
 * isr); pitchmod 0..20 (1 default). 0, or -1 on bad values / no memory */
int32_t rsc_init(rsc_reverb *p, double sr, double pitchmod);
void rsc_clear(rsc_reverb *p);   /* silence, delays back to their start */
void rsc_free(rsc_reverb *p);
/* feedback 0..1 (0.85 typical), lpfreq Hz; linear: reverbsc2 (linear
 * interpolation, none when pitchmod is 0) */
void rsc_perform(rsc_reverb *p, int32_t linear, const double *inL, const double *inR,
                 double feedback, double lpfreq, double *outL, double *outR, uint32_t n);
