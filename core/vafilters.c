/*
    vafilters.c: host-independent ports of Csound filter opcodes

    newfils.c   Copyright (c) Victor Lazzarini, 2004, Gleb Rogozinsky, 2020
                (mvclpf/mvchpf designs by Fons Adriaensen)
    biquad.c    tbvcf by Hans Mikelson, bqrez by Matt Gerassimoff, rezzy by
                Hans Mikelson, mode by Francois Blanc and Steven Yi,
                mvmfilter
    pitch.c     lpf18 by Josep Comajuncosas, coded in C by John ffitch
    lowpassr.c  Copyright (C) 1998 Gabriel Maldonado
    ugsc.c      svfilter, Copyright 1999 Sean M. Costello
    nlfilt.c    Copyright (C) 1996 John ffitch, Richard Dobson
    exciter.c   Copyright (C) 2014 by John ffitch, after Markus Schmidt
    gammatone.c Copyright (C) 2019 John ffitch

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

    csoundport: the Csound 7 audio rate versions (all controls are vectors),
    0dbfs = 1, sample rate passed to perform, istor/iskip replaced by the
    host's clear. Changes are marked "csoundport:".
*/

#include "vafilters.h"
#include <math.h>
#include <string.h>

#define TWOPI (2.0*M_PI)
#define TABSIZE 20000

/* csoundport: tangent based designs blow up at and above nyquist */
static inline double clampf(double f, double sr)
{
    return f > 0.0 ? (f < 0.49*sr ? f : 0.49*sr) : 0.0;
}

/* the shared ::TANH:: table of newfils.c */
static double tanh_tab[TABSIZE + 1];

static const double *tanh_table(void)
{
    static int done = 0;
    if (!done) {
        for (int i = 0; i <= TABSIZE; i++)
            tanh_tab[i] = tanh((double)i * (8.0 / TABSIZE) - 4.0);
        tanh_tab[TABSIZE] = tanh_tab[TABSIZE - 1];
        done = 1;
    }
    return tanh_tab;
}

/* ------------------------------------------------------------ spf */

typedef struct { double s[2], sl[2], sh[2], sb[2]; } SPF;

static void spf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(SPF));
}

static void spf_perf(void *st, double sr, const double *const *in,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    SPF *p = st;
    const double *xl = in[0], *xh = in[1], *xb = in[2], *f = in[3], *r = in[4];
    double *y = out[0];
    double al[2], ah[2], ab, b[2], x, w, w2, fac, R, piosr = M_PI/sr;
    double *sh = p->sh, *sl = p->sl, *sb = p->sb, *s = p->s;

    for (uint32_t i = 0; i < nsmps; i++) {
      w = tan(clampf(f[i], sr)*piosr);
      w2 = w*w;
      R = r[i] > 0 ? (r[i] <= 2. ? r[i] : 2.) : 0.;
      fac = 1./(1. + R*w + w2);
      al[0] = w2*fac;
      al[1] = 2*w2*fac;
      ah[0] = fac;
      ah[1] = -2*fac;
      ab = w*fac*R;
      b[0] = -2*(1 - w2)*fac;
      b[1] = (1. - R*w + w2)*fac;
      x = xh[i]*ah[0] + sh[0]*ah[1] + sh[1]*ah[0];
      sh[1] = sh[0];
      sh[0] = xh[i];
      x += xl[i]*al[0] + sl[0]*al[1] + sl[1]*al[0];
      sl[1] = sl[0];
      sl[0] = xl[i];
      x += (xb[i] - sb[1])*ab;
      sb[1] = sb[0];
      sb[0] = xb[i];
      y[i] = x - b[0]*s[0] - b[1]*s[1];
      s[1] = s[0];
      s[0] = y[i];
    }
}

/* ------------------------------------------------------------ skf */

typedef struct { double s[2]; } SKF;

static void skf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(SKF));
}

static void skf_perf(void *st, double sr, const double *const *in,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    SKF *p = st;
    const double *x = in[0], *f = in[1], *K = in[2];
    double *y = out[0], *s = p->s, a[2], b[2], yy, R, piosr = M_PI/sr;
    int hp = opt[0] != 0.0;

    for (uint32_t i = 0; i < nsmps; i++) {
      double w, w2, fac;
      R = 3 - (K[i] > 1 ? (K[i] <= 3. ? K[i] : 3.) : 1.);
      w = tan(clampf(f[i], sr)*piosr);
      w2 = w*w;
      fac = 1./(1. + R*w + w2);
      if (hp) {
        a[0] = fac;
        a[1] = -2*fac;
      } else {
        a[0] = w2*fac;
        a[1] = 2*w2*fac;
      }
      b[0] = -2*(1 - w2)*fac;
      b[1] = (1. - R*w + w2)*fac;
      yy = x[i] - b[0]*s[0] - b[1]*s[1];
      y[i] = a[0]*yy + a[1]*s[0] + a[0]*s[1];
      s[1] = s[0];
      s[0] = yy;
    }
}

/* ------------------------------------------------------------ svn */

typedef struct { double s[2]; } SVN;

/* Clamp the transfer-function coordinate before converting it to an index. */
#define SVN_NLF(result, table, value, scale, length) do {                  \
  double pos_ = ((value) * (scale) + 0.5) * (length);                    \
  if (!(pos_ > 0.0)) (result) = (table)[0];                              \
  else if (pos_ >= (length)) (result) = (table)[length];                 \
  else {                                                               \
    size_t index_;                                                      \
    index_ = (size_t)pos_;                                              \
    (result) = (table)[index_] + (pos_ - index_) *                       \
      ((table)[index_ + 1] - (table)[index_]);                           \
  }                                                                    \
} while (0)

static void svn_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(SVN));
    tanh_table();
}

/* csoundport: only the internal tanh map (ifn = inm = 0) */
static void svn_perf(void *st, double sr, const double *const *in,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    SVN *p = st;
    const double *x = in[0], *f = in[1], *q = in[2];
    double *yh = out[0], *yl = out[1], *yb = out[2], *yr = out[3];
    double u, w, fac, D, *s = p->s, kn = opt[0], gain, piosr = M_PI/sr;
    const double *tab = tanh_table();
    const double max = .125;
    const int32_t size = TABSIZE;

    if (kn > 0.) {
      kn /= max;
      gain = 1./kn;
      for (uint32_t i = 0; i < nsmps; i++) {
        D = 1./(q[i] >  0.5 ? q[i] : 0.5);
        w = tan(clampf(f[i], sr)*piosr);
        fac = 1./(1. + w*D + w*w);
        u = x[i];
        yh[i] = (u - (D + w) * s[0] - s[1])*fac;
        SVN_NLF(u, tab, yh[i]*kn, max, size);
        u *= w * gain;
        yb[i] = u + s[0];
        s[0] = yb[i] + u;
        SVN_NLF(u, tab, yb[i]*kn, max, size);
        u *= w * gain;
        yl[i] = u + s[1];
        s[1] =  yl[i] + u;
        yr[i] = yh[i] + yl[i];
      }
    } else {
      for (uint32_t i = 0; i < nsmps; i++) {
        D = 1./(q[i] >  0.5 ? q[i] : 0.5);
        w = tan(clampf(f[i], sr)*piosr);
        fac = 1./(1. + w*D + w*w);
        u = x[i];
        yh[i] = (u - (D + w) * s[0] - s[1])*fac;
        u = w * yh[i];
        yb[i] = u + s[0];
        s[0] = yb[i] + u;
        u = w * yb[i];
        yl[i] = u + s[1];
        s[1] =  yl[i] + u;
        yr[i] = yh[i] + yl[i];
      }
    }
}

/* ------------------------------------------------------------ vclpf */

typedef struct { double s[4]; } VCF;

static void vcf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(VCF));
}

static void vcf_perf(void *st, double sr, const double *const *in,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    VCF *p = st;
    const double *x = in[0], *f = in[1], *r = in[2];
    double *y = out[0], *s = p->s, G[4], A, ss, g, w, u, o, k;
    double piosr = M_PI/sr;
    uint32_t j;

    for (uint32_t i = 0; i < nsmps; i++) {
      k = r[i] <=  1 ? (r[i] >= 0 ? r[i]*4 : 0)  : 4;
      g = tan(clampf(f[i], sr)*piosr);
      G[0] = g/(1+g);
      A = (g-1)/(1+g);
      G[1] = G[0]*G[0];
      G[2] = G[0]*G[1];
      G[3] = G[0]*G[2];
      ss = s[3];
      for(j = 0; j < 3; j++) ss += s[j]*G[2-j];
      o = (G[3]*x[i] + ss)/(1 + k*G[3]);
      u = G[0]*(x[i] - k*o);
      for(j = 0; j < 3; j++) {
        w = u + s[j];
        s[j] = u - A*w;
        u = G[0]*w;
      }
      s[3] = u - A*o;
      y[i] = o;
    }
}

/* ------------------------------------------------------------ otafilter */

typedef struct { double s[4]; } VCFNL;

/* Saturate before converting the lookup position to an unsigned index. */
#define OTA_NLF(result, table, value, scale, length) do {                 \
  double pos_ = ((value) * (scale) + 0.5) * (length);                    \
  if (!(pos_ > 0.0)) (result) = (table)[0];                              \
  else if (pos_ >= (length)) (result) = (table)[(length)-1];             \
  else {                                                               \
    size_t index_ = (size_t)pos_;                                       \
    (result) = ((table)[index_] + (pos_ - index_) *                      \
      ((table)[index_ + 1] - (table)[index_]));                          \
  }                                                                    \
} while (0)

static void vcfnl_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(VCFNL));
    tanh_table();
}

static void vcfnl_perf(void *st, double sr, const double *const *in,
                       const double *opt, double *const *out, uint32_t nsmps)
{
    VCFNL *p = st;
    const double *x = in[0], *f = in[1], *r = in[2];
    double *y = out[0], *y1 = out[1], *s = p->s, G[4], A, ss, g, w, u, o, k;
    double piosr = M_PI/sr;
    double kn = (opt[0] > 0 ? opt[0] : 0) + 1.0, kno1 = 1.0/kn;
    const double *tab = tanh_table();
    const double max = .125;
    const size_t size = TABSIZE;
    uint32_t j;

    for (uint32_t i = 0; i < nsmps; i++) {
      g = tan(clampf(f[i], sr)*piosr);
      G[0] = g/(1+g);
      A = (g-1)/(1+g);
      G[1] = G[0]*G[0];
      G[2] = G[0]*G[1];
      G[3] = G[0]*G[2];
      k = r[i]*4.0;
      ss = s[3];
      for(j = 0; j < 3; j++) ss += s[j]*G[2-j];
      o = (G[3]*x[i] + ss)/(1. + k*G[3]);
      OTA_NLF(u, tab, (x[i] - k*o)*kn, max, size);
      u *= G[0]*kno1;
      for(j = 0; j < 3; j++) {
        w = u + s[j];
        s[j] = u - A*w;
        OTA_NLF(u, tab, w*kn, max, size);
        u *= G[0]*kno1;
        if(j == 1) y1[i] = s[1];
      }
      s[3] = u - A*o;
      y[i] = o;
    }
}

/* ------------------------------------------------------------ Adriaensen */

#define CBASE 261.62556416

typedef struct { double c1, c2, c3, c4, c5, x; } MVCF;

static void mvcf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(MVCF));
}

static inline double exp2ap_w(double freq, double oct)
{
    double t = log2(freq/CBASE) + oct;
    int32_t wi = (int32_t) (floor(t));
    t -= wi;
    return ldexp(1 + t * (0.6930 + t * (0.2416 + t * (0.0517 + t * 0.0137))), wi);
}

static void mvclpf1_perf(void *st, double sr, const double *const *in,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    MVCF *p = st;
    const double *x_ = in[0], *freq = in[1], *res = in[2];
    double *o = out[0];
    double c1 = p->c1+1e-6, c2 = p->c2, c3 = p->c3, c4 = p->c4, c5 = p->c5, w, x, t;

    for (uint32_t i = 0; i < nsmps; i++) {
      w = exp2ap_w(freq[i], 10.82)/sr;
      if (w < 0.8)
        w *= 1 - 0.4 * w - 0.125 * w * w;
      else {
        w *= 0.6;
        if (w > 0.92) w = 0.92;
      }
      x = -4.2*c5*res[i] + x_[i] + 1e-10;
      t = c1 / (1 + fabs (c1));
      c1 += w*(x - t);
      x = c1 / (1 + fabs (c1));
      c2 += w * (x  - c2);
      c3 += w * (c2 - c3);
      c4 += w * (c3 - c4);
      o[i]  = c4;
      c5 += 0.5 * (c4 - c5);
    }
    p->c1 = c1; p->c2 = c2; p->c3 = c3; p->c4 = c4; p->c5 = c5;
}

static void mvclpf2_perf(void *st, double sr, const double *const *in,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    MVCF *p = st;
    const double *x_ = in[0], *freq = in[1], *res = in[2];
    double *o = out[0];
    double c1 = p->c1+1e-6, c2 = p->c2, c3 = p->c3, c4 = p->c4, c5 = p->c5, w, x;

    for (uint32_t i = 0; i < nsmps; i++) {
      w = exp2ap_w(freq[i], 10.71)/sr;
      if (w < 0.8)
        w *= 1 - 0.4 * w - 0.125 * w * w;
      else {
        w *= 0.6;
        if (w > 0.92) w = 0.92;
      }
      x = -4.5*c5*res[i] + x_[i] + 1e-10;
      x /= sqrt (1 + x * x);
      c1 += w * (x  - c1) / (1 + c1 * c1);
      c2 += w * (c1 - c2) / (1 + c2 * c2);
      c3 += w * (c2 - c3) / (1 + c3 * c3);
      c4 += w * (c3 - c4) / (1 + c4 * c4);
      o[i]  = c4;
      c5 += 0.5 * (c4 - c5);
    }
    p->c1 = c1; p->c2 = c2; p->c3 = c3; p->c4 = c4; p->c5 = c5;
}

/* mvclpf3 and mvclpf4: two half steps per sample, 4 outputs for mvclpf4 */
static void mvclpf34_perf(void *st, double sr, const double *const *in,
                          const double *opt, double *const *out, uint32_t nsmps,
                          int four)
{
    MVCF *p = st;
    const double *x_ = in[0], *freq = in[1], *res = in[2];
    double c1 = p->c1+1e-6, c2 = p->c2, c3 = p->c3, c4 = p->c4, c5 = p->c5, w, x, d;

    for (uint32_t i = 0; i < nsmps; i++) {
      w = exp2ap_w(freq[i], 9.70)/sr;
      if (w < 0.75)
        w *= 1.005 - w * (0.624 - w * (0.65 - w * 0.54));
      else {
        w *= 0.6748;
        if (w > 0.82) w = 0.82;
      }
      if (!four) {
        /* mvclpf3: the first half step clamps the resonance to 0..1 */
        x = x_[i] - (4.3 - 0.2 * w) *
          (res[i] > 0.0 ? (res[i] < 1.0 ? res[i] : 1.0) : 0.0) * c5 + 1e-10;
      } else {
        x = x_[i] - (4.3 - 0.2 * w) * res[i]  * c5 + 1e-10;
      }
      x /= sqrt (1 + x * x);
      d = w * (x  - c1) / (1 + c1 * c1);
      x = c1 + 0.77 * d;
      c1 = x + 0.23 * d;
      d = w * (x  - c2) / (1 + c2 * c2);
      x = c2 + 0.77 * d;
      c2 = x + 0.23 * d;
      d = w * (x  - c3) / (1 + c3 * c3);
      x = c3 + 0.77 * d;
      c3 = x + 0.23 * d;
      d = w * (x  - c4);
      x = c4 + 0.77 * d;
      c4 = x + 0.23 * d;
      c5 += 0.85 * (c4 - c5);

      if (!four) {
        x = x_[i] - (4.3 - 0.2 * w) * res[i]  * c5 + 1e-10;
      } else {
        /* mvclpf4: the second half step clamps the resonance to 0..1 */
        x = x_[i] - (4.3 - 0.2 * w) *
          (res[i] > 0.0 ? (res[i] < 1.0 ? res[i] : 1.0) : 0.0) * c5 + 1e-10;
      }
      x /= sqrt (1 + x * x);
      d = w * (x  - c1) / (1 + c1 * c1);
      x = c1 + 0.77 * d;
      c1 = x + 0.23 * d;
      d = w * (x  - c2) / (1 + c2 * c2);
      x = c2 + 0.77 * d;
      c2 = x + 0.23 * d;
      d = w * (x  - c3) / (1 + c3 * c3);
      x = c3 + 0.77 * d;
      c3 = x + 0.23 * d;
      d = w * (x  - c4);
      x = c4 + 0.77 * d;
      c4 = x + 0.23 * d;
      c5 += 0.85 * (c4 - c5);
      if (four) {
        out[0][i] = c1;
        out[1][i] = c2;
        out[2][i] = c3;
        out[3][i] = c4;
      } else {
        out[0][i] = c4;
      }
    }
    p->c1 = c1; p->c2 = c2; p->c3 = c3; p->c4 = c4; p->c5 = c5;
}

static void mvclpf3_perf(void *st, double sr, const double *const *in,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    mvclpf34_perf(st, sr, in, opt, out, nsmps, 0);
}

static void mvclpf4_perf(void *st, double sr, const double *const *in,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    mvclpf34_perf(st, sr, in, opt, out, nsmps, 1);
}

#define PEAKHCF 1.4

static void mvchpf_perf(void *st, double sr, const double *const *in,
                        const double *opt, double *const *out, uint32_t nsmps)
{
    MVCF *p = st;
    const double *x_ = in[0], *freq = in[1];
    double *o = out[0];
    double c1 = p->c1+1e-6, c2 = p->c2, c3 = p->c3, c4 = p->c4, c5 = p->c5,
      w, x = p->x, t, d, y;

    for (uint32_t i = 0; i < nsmps; i++) {
      /* csoundport: Csound's audio rate version uses the lowpass tuning
       * 9.70, the control rate one (and Fons Adriaensen's filter) 9.2 */
      w = sr/exp2ap_w(freq[i], 9.2);
      if (w < 2.0) w = 2.0;

      x = y = x_[i]  - 0.3 * x;
      d = x - c1 + 1e-10;
      t = d * d;
      d *= (1 + t) / (w + t);
      c1 += d;
      x -= c1;
      c1 += d;
      d = x - c2 + 1e-10;
      t = d * d;
      d *= (1 + t) / (w + t);
      c2 += d;
      x -= c2;
      c2 += d;
      d = x - c3 + 1e-10;
      t = d * d;
      d *= (1 + t) / (w + t);
      c3 += d;
      x -= c3;
      c3 += d;
      d = x - c4 + 1e-10;
      t = d * d;
      d *= (1 + t) / (w + t);
      c4 += d;
      x -= c4;
      c4 += d;
      o[i] = x/PEAKHCF;
      x -= y;
    }
    p->c1 = c1; p->c2 = c2; p->c3 = c3; p->c4 = c4; p->c5 = c5; p->x = x;
}

/* ------------------------------------------------------------ moogladder */

typedef struct {
  double delay[6], tanhstg[3];
  double oldfreq, oldres, oldacr, oldtune;
} MOOGLADDER;

static double TanH(double x)
{
  /* use the fact that tanh(-x) = - tanh(x)
     and if x>~4 tanh is approx constant 1
     and for small x tanh(x) =~ x
     So giving a cheap approximation */
  int32_t sign = 1;
  if (x<0) sign=-1, x= -x;
  if (x>=4.0) {
    return sign;
  }
  if (x<0.5) return x*sign;
  {
    double x2 = x * x;
    double a = x * (135135.0 + x2 * (17325.0 + x2 * (378.0 + x2)));
    double b = 135135.0 + x2 * (62370.0 + x2 * (3150.0 + x2 * 28.0));
    return sign*(a / b);
  }
}

static void moogladder_init(void *st, const double *opt)
{
    MOOGLADDER *p = st;
    memset(p, 0, sizeof(MOOGLADDER));
    p->oldres = -1.0;     /* ensure calculation on first cycle */
}

/* one tuning computation, shared by both versions */
static inline void ml_tune(double freq, double sr, double vt, double *acr, double *tune)
{
    double f, fc, fc2, fc3, fcr;
    /* sr is half the actual filter sampling rate  */
    fc =  freq/sr;
    f  =  0.5*fc;
    fc2 = fc*fc;
    fc3 = fc2*fc;
    /* frequency & amplitude correction  */
    fcr = 1.8730*fc3 + 0.4955*fc2 - 0.6490*fc + 0.9988;
    *acr = -3.9364*fc2 + 1.8409*fc + 0.9968;
    *tune = (1.0 - exp(-(TWOPI*f*fcr))) / vt;   /* filter tuning  */
}

#define ML_STAGES(TANH) do {                                                   \
    for (j = 0; j < 2; j++) {                                                  \
      /* filter stages  */                                                     \
      input = in[i] - res4*delay[5];                                          \
      delay[0] = stg[0] = delay[0] + tune*(TANH(input*vt) - tanhstg[0]);       \
      input = stg[0];                                                          \
      stg[1] = delay[1] + tune*((tanhstg[0] = TANH(input*vt)) - tanhstg[1]);   \
      input = delay[1] = stg[1];                                               \
      stg[2] = delay[2] + tune*((tanhstg[1] = TANH(input*vt)) - tanhstg[2]);   \
      input = delay[2] = stg[2];                                               \
      stg[3] = delay[3] + tune*((tanhstg[2] =                                  \
                                 TANH(input*vt)) - TANH(delay[3]*vt));         \
      delay[3] = stg[3];                                                       \
      /* 1/2-sample delay for phase compensation  */                           \
      delay[5] = (stg[3] + delay[4])*0.5;                                      \
      delay[4] = stg[3];                                                       \
    }                                                                          \
    out[0][i] = delay[5];                                                      \
} while (0)

/* Legacy moogladder caches the block's first resonance even after it changes.
   Returning to that value can retain the previous feedback gain. Preserve
   this audible behavior for existing scores; fix it only in moogladder2.
   Its audio resonance also retains the historical lack of a negative clamp. */
static void moogladder_perf(void *st, double sr, const double *const *inv,
                            const double *opt, double *const *out, uint32_t nsmps)
{
    MOOGLADDER *p = st;
    const double *in = inv[0], *freq = inv[1], *res = inv[2];
    double cfreq = freq[0], cres = res[0], res4, stg[4], input, acr, tune;
    double *delay = p->delay, *tanhstg = p->tanhstg;
    const double vt = 1./1.22070315;
    int32_t j;

    if (p->oldfreq != cfreq || p->oldres != cres) {
      p->oldfreq = cfreq;
      ml_tune(cfreq, sr, vt, &acr, &tune);
      p->oldres = cres;
      p->oldacr = acr;
      p->oldtune = tune;
    }
    else {
      cres = p->oldres;
      acr = p->oldacr;
      tune = p->oldtune;
    }
    res4 = 4.0*cres*acr;

    for (uint32_t i = 0; i < nsmps; i++) {
      if (p->oldfreq != freq[i] || p->oldres != res[i]) {
        p->oldfreq = freq[i];
        ml_tune(freq[i], sr, vt, &acr, &tune);
        p->oldres = cres;
        p->oldacr = acr;
        p->oldtune = tune;
        res4 = 4.0*res[i]*acr;
      }
      ML_STAGES(tanh);
    }
}

static void moogladder2_perf(void *st, double sr, const double *const *inv,
                             const double *opt, double *const *out, uint32_t nsmps)
{
    MOOGLADDER *p = st;
    const double *in = inv[0], *freq = inv[1], *res = inv[2];
    double cfreq = freq[0], cres = res[0], res4, stg[4], input, acr, tune;
    double *delay = p->delay, *tanhstg = p->tanhstg;
    const double vt = 1./1.22070315;
    int32_t j;

    if (cres < 0) cres = 0;

    if (p->oldfreq != cfreq || p->oldres != cres) {
      p->oldfreq = cfreq;
      ml_tune(cfreq, sr, vt, &acr, &tune);
      p->oldres = cres;
      p->oldacr = acr;
      p->oldtune = tune;
    }
    else {
      cres = p->oldres;
      acr = p->oldacr;
      tune = p->oldtune;
    }
    res4 = 4.0*cres*acr;

    for (uint32_t i = 0; i < nsmps; i++) {
      double resonance = res[i];
      if (resonance < 0) resonance = 0;
      if (p->oldfreq != freq[i] || p->oldres != resonance) {
        p->oldfreq = freq[i];
        ml_tune(freq[i], sr, vt, &acr, &tune);
        p->oldres = resonance;
        p->oldacr = acr;
        p->oldtune = tune;
        res4 = 4.0*resonance*acr;
      }
      ML_STAGES(TanH);
    }
}

/* ------------------------------------------------------------ statevar */

typedef struct {
  double bpd, lpd, lp;
  int32_t ostimes;
  double oldfreq, oldres, oldq, oldf;
} STATEVAR;

static void statevar_init(void *st, const double *opt)
{
    STATEVAR *p = st;
    memset(p, 0, sizeof(STATEVAR));
    p->oldfreq = -1.0;
    p->oldres = -1.0;
    if (opt[0] <= 0.0) p->ostimes = 3;
    else if (opt[0] < 1.0) p->ostimes = 1;
    else p->ostimes = (int32_t)opt[0];
}

static void statevar_perf(void *st, double sr, const double *const *inv,
                          const double *opt, double *const *out, uint32_t nsmps)
{
    STATEVAR *p = st;
    const double *in = inv[0], *freq = inv[1], *res = inv[2];
    double *outhp = out[0], *outlp = out[1], *outbp = out[2], *outbr = out[3];
    double lpd = p->lpd, bpd = p->bpd, lp = p->lp, hp = 0.0, bp = 0.0, br = 0.0;
    double f = p->oldf, q = p->oldq, lim;
    int32_t ostimes = p->ostimes, j;

    for (uint32_t i = 0; i < nsmps; i++) {
      double fr = freq[i], rs = res[i];
      if (p->oldfreq != fr|| p->oldres != rs) {
        f = 2.0*sin(fr*(M_PI/sr)/ostimes);
        q = 1.0/rs;
        lim = ((2.0 - f) *0.05)/ostimes;
        if (q < lim) q = lim;
        p->oldq = q;
        p->oldf = f;
        p->oldfreq = fr;
        p->oldres = rs;
      }
      for (j=0; j<ostimes; j++) {
        hp = in[i] - q*bpd - lp;
        bp = hp*f + bpd;
        lp = bpd*f + lpd;
        br = lp + hp;
        bpd = bp;
        lpd = lp;
      }
      outhp[i] = hp;
      outlp[i] = lp;
      outbp[i] = bp;
      outbr[i] = br;
    }
    p->bpd = bpd;
    p->lpd = lpd;
    p->lp = lp;
}

/* ------------------------------------------------------------ fofilter */

typedef struct { double delay[4]; } FOFILTER;

static void fofilter_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(FOFILTER));
}

static void fofilter_perf(void *st, double sr, const double *const *inv,
                          const double *opt, double *const *out, uint32_t nsmps)
{
    FOFILTER *p = st;
    const double *in = inv[0], *freq = inv[1], *ris = inv[2], *dec = inv[3];
    double *delay = p->delay, ang = 0, fsc, rrad1 = 0, rrad2 = 0, w1, y1, w2, y2;
    double lfrq = -1.0, lrs = -1.0, ldc = -1.0;

    for (uint32_t i = 0; i < nsmps; i++) {
      double frq = freq[i], rs = ris[i], dc = dec[i];
      if (frq != lfrq || rs != lrs || dc != ldc) {
        lfrq = frq; lrs = rs; ldc = dc;
        ang = (TWOPI/sr)*frq;                   /* pole angle */
        fsc = sin(ang) - 3.0;                   /* freq scl   */
        rrad1 =  pow(10.0, fsc/(dc*sr));        /* filter radii */
        rrad2 =  pow(10.0, fsc/(rs*sr));
      }

      w1  = in[i] + 2.0*rrad1*cos(ang)*delay[0] - rrad1*rrad1*delay[1];
      y1 =  w1 - delay[1];
      delay[1] = delay[0];
      delay[0] = w1;

      w2  = in[i] + 2.0*rrad2*cos(ang)*delay[2] - rrad2*rrad2*delay[3];
      y2 =  w2 - delay[3];
      delay[3] = delay[2];
      delay[2] = w2;

      out[0][i] = y1 - y2;
    }
}

/* ------------------------------------------------------------ tbvcf */

typedef struct { double y, y1, y2; } TBVCF;

static void tbvcf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(TBVCF));
}

/* This opcode attempts to model some of the filter characteristics of
   a TB303.  Euler's method is used to approximate the system rather
   than traditional filter methods.  Cut-off frequency, Q and distortion
   are all coupled.  Empirical methods were used to try to unentwine them
   but frequency is only approximate. */
static void tbvcf_perf(void *st, double sr, const double *const *inv,
                       const double *opt, double *const *out, uint32_t nsmps)
{
    TBVCF *p = st;
    const double *in = inv[0], *fcoptr = inv[1], *resptr = inv[2];
    double dist = opt[0], asym = opt[1];
    double y = p->y, y1 = p->y1, y2 = p->y2, x;
    double ih = 0.001, fdbk, d, ad, fc, fco1, q, q1;

    for (uint32_t n = 0; n < nsmps; n++) {
      double fco = fcoptr[n], res = resptr[n];
      q1  = res/(1.0 + sqrt(dist));
      fco1 = pow(fco*260.0/(1.0+q1*0.5),0.58);
      q  = q1*fco1*fco1*0.0005;
      fc  = fco1*(1.0/sr)*(44100.0/8.0);
      x  = in[n];
      fdbk = q*y/(1.0 + exp(-3.0*y)*asym);
      y1  = y1 + ih*((x - y1)*fc - fdbk);
      d  = -0.1*y*20.0;
      ad  = (d*d*d + y2)*100.0*dist;
      y2  = y2 + ih*((y1 - y2)*fc + ad);
      y  = y + ih*((y2 - y)*fc);
      out[0][n] = y*fc/1000.0*(1.0 + q1)*3.2;
    }
    p->y = y; p->y1 = y1; p->y2 = y2;
}

/* ------------------------------------------------------------ rezzy, bqrez */

#define NEARONE (0.99999)

typedef struct { double xnm1, xnm2, ynm1, ynm2; } REZZY;

static void rezzy_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(REZZY));
}

/* the pole stabilisation of rezzy's lowpass */
static inline void rezzy_lp_poles(double *b1, double *b2)
{
    double p0, p1, pi, disc = (*b1)*(*b1)-(4*(*b2));
    if (disc<0.0) {
      pi = sqrt(-disc)/2.0;
      p0 = p1 = (-(*b1))/2.0;
      if (p0*p0+pi*pi>=1.0) {
        double theta = atan2(pi, p0);
        p0 = NEARONE * cos(theta);
        *b1 = -2*p0; *b2 = NEARONE*NEARONE;
      }
    }
    else {
      p0=(sqrt(disc)-(*b1))/2.0;
      p1=(-sqrt(disc)-(*b1))/2.0;
      if (p0*p0>=1.0 || p1*p1>=1) {
        if (p0*p0>=1) p0 = NEARONE*(p0>0.0?1:(-1));
        if (p1*p1>=1) p1 = NEARONE*(p1>0.0?1:(-1));
        *b1 = -(p0+p1); *b2 = p0*p1;
      }
    }
}

static void rezzy_perf(void *st, double sr, const double *const *inv,
                       const double *opt, double *const *out, uint32_t nsmps)
{
    REZZY *p = st;
    const double *in = inv[0], *fcoptr = inv[1], *rezptr = inv[2];
    double xnm1 = p->xnm1, xnm2 = p->xnm2, ynm1 = p->ynm1, ynm2 = p->ynm2;
    double fqcadj = 0.149659863*sr, xn, yn, csq, invb, b1, b2;

    for (uint32_t n = 0; n < nsmps; n++) {
      /* csoundport: Csound clamps only a control rate resonance to 1 and
       * divides by a zero cutoff */
      double fco = fcoptr[n] > 1.0 ? fcoptr[n] : 1.0;
      double rez = rezptr[n] > 1.0 ? rezptr[n] : 1.0;
      xn = in[n];
      if (opt[0] == 0.0) {    /* Low Pass */
        double c = fqcadj/fco;
        double rez2 = rez/(1.0 + exp(fco/11000.0));
        double a = c/rez2 - 1.0;
        double b;
        csq  = c*c;
        b    = 1.0 + a + csq;
        invb = 1.0/b;
        b1 = (-a-2.0*csq)*invb;
        b2 = csq*invb;
        rezzy_lp_poles(&b1, &b2);
        yn = invb/sqrt(1.0+rez)*xn - b1*ynm1 - b2*ynm2;
      }
      else {                  /* High Pass */
        double c = fqcadj/fco;
        double rez2 = rez/(1.0 + sqrt(sqrt(1.0/c)));
        double tval = 0.75/sqrt(1.0 + rez);
        double cdrez2 = c/rez2, b, p0, p1, pi, disc;
        csq    = c*c;
        b      = (cdrez2 + csq);
        invb   = 1.0/b;
        b1 = (1.0-cdrez2-2.0*csq)*invb;
        b2 = csq*invb;
        disc = b1*b1-(4*b2);
        if (disc<0.0) {
          pi = sqrt(-disc)/2.0;
          p0=p1=(-b1)/2.0;
          if (p0*p0+pi*pi >=1.0) {
            double theta = atan2(pi,p0);
            b1 = -p0*cos(theta); b2 = NEARONE*NEARONE;
          }
        }
        else {
          p0=(sqrt(disc)-b1)/2.0;
          p1=(-sqrt(disc)-b1)/2.0;
          if (p0*p0>=1.0 || p1*p1>=1) {
            if (p0*p0>=1.0) p0 = NEARONE*(p0>0?1:(-1));
            if (p1*p1>=1.0) p1 = NEARONE*(p1>0?1:(-1));
            b1 = -(p0+p1); b2 = p0*p1;
          }
        }
        yn = -b1*ynm1 - b2*ynm2
          + (( cdrez2 + csq)*tval*xn + (-cdrez2 - 2.0*csq)*tval*xnm1
             + csq*tval*xnm2)*invb;
      }
      xnm2 = xnm1;
      xnm1 = xn;
      ynm2 = ynm1;
      ynm1 = yn;
      out[0][n] = yn;
    }
    p->xnm1 = xnm1; p->xnm2 = xnm2; p->ynm1 = ynm1; p->ynm2 = ynm2;
}

/* bqrez by Matt Gerassimoff */
static void bqrez_perf(void *st, double sr, const double *const *inv,
                       const double *opt, double *const *out, uint32_t nsmps)
{
    REZZY *p = st;
    const double *in = inv[0], *fcoptr = inv[1], *rezptr = inv[2];
    double xnm1 = p->xnm1, xnm2 = p->xnm2, ynm1 = p->ynm1, ynm2 = p->ynm2;
    double sin2, cos2, beta, alpha, gamma, mu = 0, sigma = 0, chi = 0, xn, yn, theta;
    int32_t mode = (int32_t)lrint(opt[0]);

    if (mode < 0 || mode > 4) mode = 0;     /* csoundport: no silent output */
    if (mode == 0) { chi = -1.0; mu = 2.0; sigma = 1.0; }
    else if (mode == 1) { chi = 1.0; mu = -2.0; sigma = 1.0; }
    else if (mode == 2) { chi = 1.0; mu = 0.0; sigma = -1.0; }

    for (uint32_t n = 0; n < nsmps; n++) {
      double fco = fcoptr[n];
      double rez = rezptr[n] > 0.01 ? rezptr[n] : 0.01;  /* csoundport */
      theta = fco * (TWOPI/sr);
      sin2 = sin(theta) * 0.5;
      cos2 = cos(theta);
      beta = (rez - sin2) / (rez + sin2);
      gamma = (beta + 1.0) * cos2;
      xn = in[n];
      if (mode < 3) {
        /* Band-pass gain follows the low/high-pass center gain (2 * rez).
           The high-pass numerator gives an unwanted cot(theta/2) factor. */
        alpha = mode == 2 ? (beta + 1.0) * sin2
                          : (beta + 1.0 + chi*gamma) * 0.5;
        yn = alpha*(xn + mu*xnm1 + sigma*xnm2) + gamma*ynm1 - beta*ynm2;
      }
      else if (mode == 3) {   /* Band Stop */
        alpha = (beta + 1.0) * 0.5;
        mu = -2.0*cos2;
        yn = alpha*(xn + mu*xnm1 + xnm2) + gamma*ynm1 - beta*ynm2;
      }
      else {                  /* All Pass */
        chi = beta;
        mu = -gamma;
        yn = chi*xn + mu*xnm1 + xnm2 + gamma*ynm1 - beta*ynm2;
      }
      xnm2 = xnm1;
      xnm1 = xn;
      ynm2 = ynm1;
      ynm1 = yn;
      out[0][n] = yn;
    }
    p->xnm1 = xnm1; p->xnm2 = xnm2; p->ynm1 = ynm1; p->ynm2 = ynm2;
}

/* ------------------------------------------------------------ mode */

/* mode opcode - original UDO code by Francois Blanc, rewritten in C by
 * Steven Yi */
typedef struct {
  double xnm1, ynm1, ynm2, a0, a1, a2, d;
  double lfq, lq;
} MODE;

static void mode_init(void *st, const double *opt)
{
    MODE *p = st;
    memset(p, 0, sizeof(MODE));
    p->lfq = -1.0; p->lq = -1.0;
}

static void mode_perf(void *st, double sr, const double *const *inv,
                      const double *opt, double *const *out, uint32_t nsmps)
{
    MODE *p = st;
    double lfq = p->lfq, lq = p->lq;
    double a0 = p->a0, a1 = p->a1, a2 = p->a2, d = p->d;
    double xnm1 = p->xnm1, ynm1 = p->ynm1, ynm2 = p->ynm2, xn, yn;
    /* set a limit below theoretical sr/pi */
    double limit = sr*(1.0/M_PI - 1.0/100.0);

    for (uint32_t n = 0; n < nsmps; n++) {
      double kfq = inv[1][n], kq = inv[2][n];
      if (kfq > limit)
        kfq = limit;
      if (lfq != kfq || lq != kq) {
        lq = kq; lfq = kfq;
        if (kfq == 0.0 || kq == 0.0) {
          /* Zero frequency or Q silences the resonator. Clear feedback
             so a later positive value can start from finite state. */
          a0 = a1 = a2 = d = 0.0;
          ynm1 = ynm2 = 0.0;
        }
        else {
          double kfreq  = kfq*TWOPI;
          double kalpha = (sr/kfreq);
          double kbeta  = kalpha*kalpha;
          d      = 0.5*kalpha;
          a0     = 1.0/ (kbeta+d/kq);
          a1     = a0 * (1.0-2.0*kbeta);
          a2     = a0 * (kbeta-d/kq);
        }
      }
      xn = inv[0][n];
      yn = a0*xnm1 - a1*ynm1 - a2*ynm2;
      xnm1 = xn;
      ynm2 = ynm1;
      ynm1 = yn;
      out[0][n] = yn*d;
    }
    p->xnm1 = xnm1;  p->ynm1 = ynm1;  p->ynm2 = ynm2;
    p->lfq = lfq;    p->lq = lq;      p->d = d;
    p->a0 = a0;      p->a1 = a1;      p->a2 = a2;
}

/* ------------------------------------------------------------ mvmfilter */

typedef struct { double x, y; } MVMFILT;

static void mvmfilter_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(MVMFILT));
}

static void mvmfilter_perf(void *st, double sr, const double *const *inv,
                           const double *opt, double *const *out, uint32_t nsmps)
{
    MVMFILT *p = st;
    double x = p->x, y = p->y, limit = sr/2.0;

    for (uint32_t n = 0; n < nsmps; n++) {
      double tau = inv[2][n], f0val = inv[1][n], r1, theta, x1, y1, x_;
      r1 = tau > 0.0 ? exp(-1 / (tau*sr)) : 0;
      f0val = f0val > limit ? limit : f0val;
      theta  = (TWOPI * f0val) / sr;
      x1     = cos(theta) * r1;
      y1     = sin(theta) * r1;
      x_ = x;
      x  = (x1 * x)  - (y1 * y) + inv[0][n];
      y  = (y1 * x_) + (x1 * y);
      out[0][n] = x;
    }
    p->x = x;
    p->y = y;
}

/* ------------------------------------------------------------ lpf18 */

/* Josep Comajuncosas' 18dB/oct resonant 3-pole LPF with tanh dist,
   coded in C by John ffitch */
typedef struct { double ay1, ay2, aout, lastin; } LPF18;

static void lpf18_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(LPF18));
}

static void lpf18_perf(void *st, double sr, const double *const *inv,
                       const double *opt, double *const *out, uint32_t nsmps)
{
    LPF18 *p = st;
    double ay1 = p->ay1, ay2 = p->ay2, aout = p->aout, lastin = p->lastin;
    double value = 0.0, lds = 0.0;
    int32_t flag = 1;
    double lfc=0, lrs=0, kres=0, kfcn=0, kp=0, kp1=0,  kp1h=0;

    for (uint32_t n = 0; n < nsmps; n++) {
      double ax1  = lastin, ay11 = ay1, ay31 = ay2;
      double fco = inv[1][n], res = inv[2][n], dist = inv[3][n];
      if (fco != lfc || flag) {
        lfc = fco;
        kfcn = 2.0 * fco * (1.0/sr);
        kp   = ((-2.7528*kfcn + 3.0429)*kfcn + 1.718)*kfcn - 0.9984;
        kp1 = kp+1.0;
        kp1h = 0.5*kp1;
        flag = 1;
      }
      if (res != lrs || flag) {
        lrs = res;
        kres = res * (((-2.7079*kp1 + 10.963)*kp1 - 14.934)*kp1 + 8.4974);
        flag = 1;
      }
      if (dist != lds || flag) {
        lds = dist;
        value = 1.0+(dist*(1.5+2.0*kres*(1.0-kfcn)));
      }
      flag = 0;
      lastin     = inv[0][n] - tanh(kres*aout);
      ay1        = kp1h * (lastin + ax1) - kp*ay1;
      ay2        = kp1h * (ay1 + ay11) - kp*ay2;
      aout       = kp1h * (ay2 + ay31) - kp*aout;
      out[0][n] = tanh(aout*value);
    }
    p->ay1 = ay1; p->ay2 = ay2; p->aout = aout; p->lastin = lastin;
}

/* ------------------------------------------------------------ lowres, lowresx, vlowres */

typedef struct {
    double ynm1[10], ynm2[10];
    double coef1, coef2, okf, okr, k;
    int32_t loop;
} LOWPR;

static void lowres_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(LOWPR));
}

/* csoundport: Csound stops with a performance error at cutoff <= 0 */
static inline double lowres_fco(double fco)
{
    return fco > 0.001 ? fco : 0.001;
}

static void lowres_perf(void *st, double sr, const double *const *inv,
                        const double *opt, double *const *out, uint32_t nsmps)
{
    LOWPR *p = st;
    double b, k = p->k, yn, ynm1 = p->ynm1[0], ynm2 = p->ynm2[0];
    double okf = p->okf, okr = p->okr, coef1 = p->coef1, coef2 = p->coef2;

    for (uint32_t n = 0; n < nsmps; n++) {
      double fco = lowres_fco(inv[1][n]), res = inv[2][n];
      if (okf != fco || okr != res) { /* Only if changed */
        b = 10.0 / (res * sqrt(fco)) - 1.0;
        k = 1000.0 / fco;
        coef1 = (b+2.0 * k);
        coef2 = 1.0/(1.0 + b + k);
        okf = fco; okr = res;
      }
      out[0][n] = yn = (coef1 * ynm1 - k * ynm2 + inv[0][n]) * coef2;
      ynm2 = ynm1;
      ynm1 = yn;
    }
    p->ynm1[0] = ynm1; p->ynm2[0] = ynm2;
    p->k = k; p->coef1 = coef1; p->coef2 = coef2; p->okf = okf; p->okr = okr;
}

static int32_t lowres_order(double ord)
{
    int32_t loop = (int32_t)lrint(ord);
    /* csoundport: Csound refuses orders above 10 at init */
    return loop < 1 ? 4 : loop > 10 ? 10 : loop;
}

static void lowresx_init(void *st, const double *opt)
{
    LOWPR *p = st;
    memset(p, 0, sizeof(LOWPR));
    p->loop = lowres_order(opt[0]);
    p->k = p->okf = p->okr = -1.0;
}

static void lowresx_perf(void *st, double sr, const double *const *inv,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    LOWPR *p = st;
    double b, k = p->k, yn, coef1 = p->coef1, coef2 = p->coef2;
    double *ynm1 = p->ynm1, *ynm2 = p->ynm2;

    for (uint32_t n = 0; n < nsmps; n++) {
      double fco = lowres_fco(inv[1][n]), res = inv[2][n];
      if (p->okf != fco || p->okr != res) { /* Only if changed */
        b = 10.0 / (res * sqrt(fco)) - 1.0;
        k = 1000.0 / fco;
        coef1 = (b+2.0 * k);
        coef2 = 1.0/(1.0 + b + k);
        p->okf = fco; p->okr = res;
      }
      yn = inv[0][n];
      for (int32_t j = 0; j < p->loop; j++) {
        yn = (coef1 * ynm1[j] - k * ynm2[j] + yn) * coef2;
        ynm2[j] = ynm1[j];
        ynm1[j] = yn;
      }
      out[0][n] = yn;
    }
    p->k = k; p->coef1 = coef1; p->coef2 = coef2;
}

static void vlowres_init(void *st, const double *opt)
{
    LOWPR *p = st;
    memset(p, 0, sizeof(LOWPR));
    p->loop = lowres_order(opt[0]);
}

/* control rate cutoff and resonance: the first sample of each block */
static void vlowres_perf(void *st, double sr, const double *const *inv,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    LOWPR *p = st;
    double kfcobase = inv[1][0], kres = inv[2][0], sep = opt[1] / p->loop;
    const double *asig = inv[0];
    double *ar = out[0];

    for (int32_t j = 0; j < p->loop; j++) {
      double lynm1 = p->ynm1[j], lynm2 = p->ynm2[j], yn;
      double kfco = lowres_fco(kfcobase * (1.0 + (sep * j)));
      double b = 10.0 / (kres * sqrt(kfco)) - 1.0;
      double k = 1000.0 / kfco;
      double coef1 = (b+2.0 *k);
      double coef2 = 1.0/(1.0 + b + k);
      for (uint32_t n = 0; n < nsmps; n++) {
        ar[n] = yn = (coef1 * lynm1 - k * lynm2 + asig[n]) * coef2;
        lynm2 = lynm1;
        lynm1 = yn;
      }
      p->ynm1[j] = lynm1;
      p->ynm2[j] = lynm2;
      asig = ar;
    }
}

/* ------------------------------------------------------------ svfilter */

typedef struct { double ynm1, ynm2; } SVF;

static void svf_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(SVF));
}

/* equations derived from Hal Chamberlin, "Musical Applications
 * of Microprocessors. */
static void svf_perf(void *st, double sr, const double *const *inv,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    SVF *p = st;
    double f1 = 0.0, q1 = 1.0, scale = 1.0, lfco = -1.0, lq = -1.0;
    double low2, high2, band2, ynm1 = p->ynm1, ynm2 = p->ynm2;

    for (uint32_t n = 0; n < nsmps; n++) {
      double fco = inv[1][n], q = inv[2][n];
      if (fco != lfco || q != lq) {
        lfco = fco; lq = q;
        /* calculate frequency and Q coefficients */
        f1 = 2.0 * sin(fco * (M_PI/sr));
        /* Protect against division by zero */
        if (q < 0.000001) q = 1.0;
        q1 = 1.0 / q;
        /* if there is a non-zero value for iscl, set scale to be
         * equal to the Q coefficient. */
        if (opt[0] != 0.0) scale = q1;
      }
      double sample = inv[0][n];
      out[0][n] = low2 = ynm2 + f1 * ynm1;
      out[1][n] = high2 = scale * sample - low2 - q1 * ynm1;
      out[2][n] = band2 = f1 * high2 + ynm1;
      ynm1    = band2;
      ynm2    = low2;
    }
    p->ynm1 = ynm1;
    p->ynm2 = ynm2;
}

/* ------------------------------------------------------------ nlfilt, nlfilt2 */

#define MAX_DELAY (1024)

typedef struct { double delay[MAX_DELAY]; int32_t point; } NLFILT;

static void nlfilt_init(void *st, const double *opt)
{
    memset(st, 0, sizeof(NLFILT));
}

/* Y{n} = a Y{n-1} + b Y{n-2} + d Y^2{n-L} + X{n} - C
   Compatibility: retain nlfilt's historical two-sample feedback delay offset
   and output clipping; nlfilt2 implements the corrected recurrence.
   Y{n} = tanh(a Y{n-1} + b Y{n-2} + d Y^2{n-L} + X{n} - C) (Risto Holopainen) */
static void nlfilt_perf_common(void *st, const double *const *inv, const double *opt,
                               double *const *out, uint32_t nsmps, int v2)
{
    NLFILT *p = st;
    int32_t point = p->point, nm1 = point, nm2 = point - 1, nmL;
    double a = opt[0], b = opt[1], d = opt[2], C = opt[3], L = opt[4];
    double *fp = p->delay, ynm1, ynm2, ynmL;
    const double maxamp = 1.953125, dvmaxamp = 1.0/maxamp, maxampd2 = maxamp*0.5;

    if (!(L >= 1.0))
      L = 1.0;
    else if (L >= MAX_DELAY)
      L = MAX_DELAY;
    if (v2) {
      /* point holds Y[n-1], so Y[n-L] is L-1 places behind it. */
      nmL = point - (int32_t) (L) + 1;
      if (nmL < 0) nmL += MAX_DELAY;
    } else {
      nmL = (point - (int32_t) (L) + 2*MAX_DELAY - 1) % MAX_DELAY;
    }
    if (nm1 < 0) nm1 += MAX_DELAY;
    if (nm2 < 0) nm2 += MAX_DELAY;
    ynm1 = fp[nm1];
    ynm2 = fp[nm2];
    ynmL = fp[nmL];

    for (uint32_t n = 0; n < nsmps; n++) {
      double yn = a * ynm1 + b * ynm2 + d * ynmL * ynmL - C;
      yn += inv[0][n] * dvmaxamp;           /* Must work in small amplitudes  */
      if (v2) {
        yn = tanh(yn);
        out[0][n] = yn * maxampd2;        /* Output the same state we feed back. */
      } else {
        double o = yn * maxampd2;
        if (o > maxamp)
          o = maxampd2;
        else if (o < -maxamp)
          o = -maxampd2;
        out[0][n] = o;
      }
      if (++point == MAX_DELAY)
        point = 0;
      fp[point] = yn;
      if (++nmL == MAX_DELAY)
        nmL = 0;
      ynm2 = ynm1;
      ynm1 = yn;
      ynmL = fp[nmL];
    }
    p->point = point;
}

static void nlfilt_perf(void *st, double sr, const double *const *inv,
                        const double *opt, double *const *out, uint32_t nsmps)
{
    nlfilt_perf_common(st, inv, opt, out, nsmps, 0);
}

static void nlfilt2_perf(void *st, double sr, const double *const *inv,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    nlfilt_perf_common(st, inv, opt, out, nsmps, 1);
}

/* ------------------------------------------------------------ exciter */

/* EXCITER by Markus Schmidt, a reimplementation of the Calf exciter */
typedef struct {
  double freq_old, ceil_old, sr;
  double hp1[7], hp2[7], hp3[7], hp4[7];
  double lp1[7], lp2[7];
  double rs00[7], rs01[7], rs10[7], rs11[7];
  double rdrive, rbdr, kpa, kpb, kna, knb, ap, an, imr, kc, srct, sq, pwrq;
  int32_t over;
  double prev_med, prev_out;
  double blend_old, drive_old;
} EXCITER;

static inline double ex_process(double st[7], double in)
{
    double tmp = in - st[5] * st[3] - st[6] * st[4];
    double out = tmp * st[0] + st[5] * st[1] + st[6] * st[2];
    st[6] = st[5];
    st[5] = tmp;
    return out;
}

/** Highpass filter based on Robert Bristow-Johnson's equations */
static inline void set_hp_rbj(double hp[7], double fc, double q, double sr)
{
    double omega= (TWOPI*fc/sr);
    double sn=sin(omega);
    double cs=cos(omega);
    double alpha=(sn/(2.0*q));
    double inv=(1.0/(1.0+alpha));
    hp[2] = hp[0] =  (inv*(1.0 + cs)*0.5);
    hp[1] =  -2.0 * hp[0];
    hp[3] =  (-2.0*cs*inv);
    hp[4] =  ((1.0 - alpha)*inv);
}

static inline void set_lp_rbj(double lp[7], double fc, double q, double sr)
{
    double omega=(TWOPI*fc/sr);
    double sn=sin(omega);
    double cs=cos(omega);
    double alpha=(sn/(2*q));
    double inv=(1.0/(1.0+alpha));
    lp[2] = lp[0] =  inv*(1.0 - cs)*0.5;
    lp[1] =  lp[0]+lp[0];
    lp[3] =  (-2.0*cs*inv);
    lp[4] =  ((1.0 - alpha)*inv);
}

static void exciter_init(void *st, const double *opt)
{
    EXCITER *p = st;
    memset(p, 0, sizeof(EXCITER));
    /* Zero is a valid cutoff and must also rebuild coefficients on reinit. */
    p->freq_old = p->ceil_old = -1.0;
    p->blend_old = p->drive_old = -1.0;
}

static inline double ex_M(double x)
{
    return (fabs(x) > 0.00000001) ? x : 0.0;
}

static inline double ex_D(double x)
{
    x = fabs(x);
    return (x > 0.00000001) ? sqrt(x) : 0.0;
}

static inline double ex_distort(EXCITER *p, double in)
{
    double samples[2], tt;
    double ap = p->ap, an = p->an, kpa = p->kpa, kna = p->kna,
      kpb = p->kpb, knb = p->knb, pwrq = p->pwrq;

    /* upsample */
    tt = ex_process(p->rs00, in);
    samples[0] = ex_process(p->rs01, tt);
    tt = ex_process(p->rs00, 0.0);
    samples[1] = ex_process(p->rs01, tt);
    for (int32_t i = 0; i < p->over; i++) {
      double proc = samples[i];
      double med;
      if (proc >= 0.0) {
        med = (ex_D(ap + proc * (kpa - proc)) + kpb) * pwrq;
      } else {
        med = - (ex_D(an - proc * (kna + proc)) + knb) * pwrq;
      }
      proc = p->srct * (med - p->prev_med + p->prev_out);
      p->prev_med = ex_M(med);
      p->prev_out = ex_M(proc);
      samples[i] = proc;
    }
    /* downsample */
    samples[0] = ex_process(p->rs10, samples[0]);
    samples[0] = ex_process(p->rs11, samples[0]);
    samples[1] = ex_process(p->rs10, samples[1]);
    samples[1] = ex_process(p->rs11, samples[1]);
    return samples[0];
}

static void exciter_perf(void *st, double sr, const double *const *inv,
                         const double *opt, double *const *out, uint32_t nsmps)
{
    EXCITER *p = st;
    double freq = opt[0], ceil = opt[1], drive = opt[2], blend = opt[3];

    if (p->sr != sr) {
      /* csoundport: sample rate dependent setup of exciter_init */
      double ff = 25000.0;
      p->sr = sr;
      p->over = sr * 2 > 96000 ? 1 : 2;
      if (sr > 50000) ff = sr*0.5;
      set_lp_rbj(p->rs00, ff, 0.8, sr * 2);
      memcpy(p->rs01, p->rs00, 5*sizeof(double));
      memcpy(p->rs10, p->rs00, 5*sizeof(double));
      memcpy(p->rs11, p->rs00, 5*sizeof(double));
      p->freq_old = p->ceil_old = p->blend_old = p->drive_old = -1.0;
    }
    if (freq != p->freq_old) {
      set_hp_rbj(p->hp1, freq, 0.707, sr);
      memcpy(p->hp2, p->hp1, 5*sizeof(double));
      memcpy(p->hp3, p->hp1, 5*sizeof(double));
      memcpy(p->hp4, p->hp1, 5*sizeof(double));
      p->freq_old = freq;
    }
    if (ceil != p->ceil_old) {
      set_lp_rbj(p->lp1, ceil, 0.707, sr);
      memcpy(p->lp2, p->lp1, 5*sizeof(double));
      p->ceil_old = ceil;
    }
    if ((p->drive_old != drive) || (p->blend_old != blend)) {
      p->drive_old = drive;
      p->blend_old = blend;
      p->rdrive = 12.0 / p->drive_old;
      p->rbdr = p->rdrive / (10.5 - p->blend_old) * 780.0 / 33.0;
      p->kpa = ex_D(2.0 * (p->rdrive*p->rdrive) - 1.0) + 1.0;
      p->kpb = (2.0 - p->kpa) / 2.0;
      p->ap = ((p->rdrive*p->rdrive) - p->kpa + 1.0) / 2.0;
      p->kc = p->kpa / ex_D(2.0 * ex_D(2.0 * (p->rdrive*p->rdrive) - 1.0) -
                            2.0 * p->rdrive*p->rdrive);
      p->srct = (0.1 * sr) / (0.1 * sr + 1.0);
      p->sq = p->kc*p->kc + 1.0;
      p->knb = -1.0 * p->rbdr / ex_D(p->sq);
      p->kna = 2.0 * p->kc * p->rbdr / ex_D(p->sq);
      p->an = p->rbdr*p->rbdr / p->sq;
      p->imr = 2.0 * p->knb + ex_D(2.0 * p->kna + 4.0 * p->an - 1.0);
      p->pwrq = 2.0 / (p->imr + 1.0);
    }

    for (uint32_t n = 0; n < nsmps; n++) {
      double o, in = inv[0][n];
      o = ex_process(p->hp2, ex_process(p->hp1, in));
      o = ex_distort(p, o);      // saturate
      o = ex_process(p->hp4, ex_process(p->hp3, o));
      o = ex_process(p->lp1, ex_process(p->lp2, o));
      out[0][n] = o;
    }
}

/* ------------------------------------------------------------ gtf */

typedef struct {
    int32_t n;
    double expmbt, cosft, sinft, oldf, sr;
    double yr[10], yi[10];
} GAMMA;

static void gtf_init(void *st, const double *opt)
{
    GAMMA *p = st;
    memset(p, 0, sizeof(GAMMA));
    p->n = (int32_t)lrint(opt[2]);
    /* csoundport: Csound refuses orders outside 0..10 at init */
    if (p->n <= 0 || p->n > 10) p->n = 4;
    p->expmbt = exp(-2.0*M_PI*opt[1]);
    p->cosft = 1.0;
    p->sinft = 0.0;
}

static void gtf_perf(void *st, double sr, const double *const *inv,
                     const double *opt, double *const *out, uint32_t nsmps)
{
    GAMMA *p = st;
    double freq = p->oldf, cc, ss, yrm1, yim1;
    double xxr[256], xxi[256];

    if (opt[0] != freq || p->sr != sr) {
      freq = p->oldf = opt[0];
      p->sr = sr;
      p->cosft = cos(2.0*M_PI*freq/sr);
      p->sinft = sin(2.0*M_PI*freq/sr);
    }
    cc = p->cosft;
    ss = p->sinft;
    /* csoundport: stages run over chunks, the result does not depend on it */
    for (uint32_t start = 0; start < nsmps; start += 256) {
      uint32_t len = nsmps - start < 256 ? nsmps - start : 256;
      const double *x = inv[0] + start;
      double *ans = out[0] + start;

      yrm1 = p->yr[0];     yim1 = p->yi[0];
      for (uint32_t i = 0; i < len; i++) {
        double real = p->expmbt*(cc*yrm1 - ss*yim1) + (1.0-p->expmbt)*(x[i]);
        double imag = p->expmbt*(ss*yrm1 + cc*yim1);
        yrm1 = real; yim1 = imag;
        xxr[i] = real; xxi[i]= imag;
      }
      p->yr[0] = yrm1;  p->yi[0] = yim1;
      for (int32_t k = 1; k < p->n; k++) {
        yrm1 = p->yr[k];     yim1 = p->yi[k];
        for (uint32_t i = 0; i < len; i++) {
          double real = p->expmbt*(cc*yrm1 - ss*yim1 - xxr[i]) + xxr[i];
          double imag = p->expmbt*(ss*yrm1 + cc*yim1 - xxi[i]) + xxi[i];
          yrm1 = real;  yim1 = imag;
          xxr[i] = real; xxi[i] = imag;
        }
        p->yr[k] = yrm1;  p->yi[k] = yim1;
      }
      if (opt[3] == 0.0)
        for (uint32_t i = 0; i < len; i++)
          ans[i] = 2.0*xxr[i];
      else {
        double c = cos(opt[3]), s = sin(opt[3]);
        for (uint32_t i = 0; i < len; i++)
          ans[i] = 2.0*(xxr[i]*c - xxi[i]*s);
      }
    }
}

/* ------------------------------------------------------------ table */

#define CUT 1000.0

const va_desc va_filters[] = {
    {"spf", "spf", 5, 3, {"lowpass input", "highpass input", "bandpass input", "cutoff", "R"},
     {0, 0, 0, CUT, 1.414}, 0, {0}, {0}, 0, 1, {"output"},
     sizeof(SPF), spf_init, spf_perf},
    {"skf", "skf", 3, 1, {"input", "cutoff", "K"}, {0, CUT, 1.586},
     1, {"hp"}, {0}, 0, 1, {"output"}, sizeof(SKF), skf_init, skf_perf},
    {"svn", "svn", 3, 1, {"input", "cutoff", "Q"}, {0, CUT, 2},
     1, {"drive"}, {0}, 0, 4, {"highpass", "lowpass", "bandpass", "bandreject"},
     sizeof(SVN), svn_init, svn_perf},
    {"vclpf", "vclpf", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(VCF), vcf_init, vcf_perf},
    {"otafilter", "otafilter", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     1, {"drive"}, {0}, 0, 2, {"4 pole output", "2 pole output"},
     sizeof(VCFNL), vcfnl_init, vcfnl_perf},
    {"mvclpf1", "mvclpf1", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MVCF), mvcf_init, mvclpf1_perf},
    {"mvclpf2", "mvclpf2", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MVCF), mvcf_init, mvclpf2_perf},
    {"mvclpf3", "mvclpf3", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MVCF), mvcf_init, mvclpf3_perf},
    {"mvclpf4", "mvclpf4", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 4, {"6 dB/oct", "12 dB/oct", "18 dB/oct", "24 dB/oct"},
     sizeof(MVCF), mvcf_init, mvclpf4_perf},
    {"mvchpf", "mvchpf", 2, 1, {"input", "cutoff"}, {0, CUT},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MVCF), mvcf_init, mvchpf_perf},
    {"moogladder", "moogladder", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MOOGLADDER), moogladder_init, moogladder_perf},
    {"moogladder2", "moogladder2", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 0.5},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MOOGLADDER), moogladder_init, moogladder2_perf},
    {"statevar", "statevar", 3, 1, {"input", "cutoff", "Q"}, {0, CUT, 2},
     1, {"oversampling"}, {3}, 1, 4, {"highpass", "lowpass", "bandpass", "bandreject"},
     sizeof(STATEVAR), statevar_init, statevar_perf},
    {"fofilter", "fofilter", 4, 1, {"input", "frequency", "attack", "decay"}, {0, CUT, 0.007, 0.04},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(FOFILTER), fofilter_init, fofilter_perf},
    {"tbvcf", "tbvcf", 3, 1, {"input", "cutoff", "resonance"}, {0, 2000, 0.8},
     2, {"distortion", "asymmetry"}, {2, 0.5}, 0, 1, {"output"},
     sizeof(TBVCF), tbvcf_init, tbvcf_perf},
    {"mode", "mode", 3, 1, {"input", "frequency", "Q"}, {0, 440, 100},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MODE), mode_init, mode_perf},
    {"mvmfilter", "mvmfilter", 3, 1, {"input", "frequency", "decay time"}, {0, 440, 0.1},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(MVMFILT), mvmfilter_init, mvmfilter_perf},
    {"rezzy", "rezzy", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 10},
     1, {"highpass"}, {0}, 0, 1, {"output"}, sizeof(REZZY), rezzy_init, rezzy_perf},
    {"bqrez", "bqrez", 3, 1, {"input", "cutoff", "resonance"}, {0, CUT, 10},
     1, {"mode"}, {0}, 0, 1, {"output"}, sizeof(REZZY), rezzy_init, bqrez_perf},
    {"lpf18", "lpf18", 4, 1, {"input", "cutoff", "resonance", "distortion"}, {0, CUT, 0.5, 0.2},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(LPF18), lpf18_init, lpf18_perf},
    {"lowres", "lowres", 3, 1, {"input", "cutoff", "resonance"}, {0, 500, 3},
     0, {0}, {0}, 0, 1, {"output"}, sizeof(LOWPR), lowres_init, lowres_perf},
    {"lowresx", "lowresx", 3, 1, {"input", "cutoff", "resonance"}, {0, 500, 3},
     1, {"layers"}, {4}, 1, 1, {"output"}, sizeof(LOWPR), lowresx_init, lowresx_perf},
    {"vlowres", "vlowres", 3, 1, {"input", "cutoff", "resonance"}, {0, 100, 20},
     2, {"order", "separation"}, {2, 5}, 1, 1, {"output"},
     sizeof(LOWPR), vlowres_init, vlowres_perf},
    {"cs.svfilter", "svfilter", 3, 1, {"input", "cutoff", "Q"}, {0, CUT, 2},
     1, {"scale"}, {0}, 0, 3, {"lowpass", "highpass", "bandpass"},
     sizeof(SVF), svf_init, svf_perf},
    {"nlfilt", "nlfilt", 1, 1, {"input"}, {0},
     5, {"a", "b", "d", "C", "L"}, {0, 0, 0.8, 0.5, 20}, 0, 1, {"output"},
     sizeof(NLFILT), nlfilt_init, nlfilt_perf},
    {"nlfilt2", "nlfilt2", 1, 1, {"input"}, {0},
     5, {"a", "b", "d", "C", "L"}, {0, 0, 0.8, 0.5, 20}, 0, 1, {"output"},
     sizeof(NLFILT), nlfilt_init, nlfilt2_perf},
    {"exciter", "exciter", 1, 1, {"input"}, {0},
     4, {"freq", "ceil", "harmonics", "blend"}, {3000, 20000, 3, 0}, 0, 1, {"output"},
     sizeof(EXCITER), exciter_init, exciter_perf},
    {"gtf", "gtf", 1, 1, {"input"}, {0},
     4, {"freq", "decay", "order", "phase"}, {1000, 0.005, 4, 0}, 6, 1, {"output"},
     sizeof(GAMMA), gtf_init, gtf_perf},
};

const int32_t va_nfilters = sizeof(va_filters)/sizeof(*va_filters);

const va_desc *va_find(const char *name)
{
    for (int32_t i = 0; i < va_nfilters; i++)
        if (!strcmp(va_filters[i].name, name))
            return &va_filters[i];
    return NULL;
}

void va_process(const va_desc *d, void *st, double sr, const double *const *in,
                const double *opt, double *const *out, uint32_t n)
{
    double sum = 0;

    d->perform(st, sr, in, opt, out, n);
    for (int32_t o = 0; o < d->nout; o++)
        for (uint32_t i = 0; i < n; i++)
            sum += out[o][i];
    if (!isfinite(sum)) {
        d->init(st, opt);
        for (int32_t o = 0; o < d->nout; o++)
            memset(out[o], 0, n*sizeof(double));
    }
}
