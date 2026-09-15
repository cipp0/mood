/*
reverbsc~, reverbsc2~ - Pd externals wrapping the Csound reverbsc and reverbsc2 opcodes
Copyright 1999, 2005 Sean Costello and Istvan Varga; csoundport Pd wrapper 2026.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
See core/reverbsc.c for the full notice.
*/

#include "m_pd.h"
#include "reverbsc.h"
#include <math.h>

#ifdef REVERBSC2
#define NAME "reverbsc2~"
#define SETUP reverbsc2_tilde_setup
#define LINEAR 1
#else
#define NAME "reverbsc~"
#define SETUP reverbsc_tilde_setup
#define LINEAR 0
#endif

static t_class *reverbsc_class;

typedef struct {
    t_object x_obj;
    t_float x_f;
    rsc_reverb r;
    double sr, pitchmod;
    double *buf;
    int bufn;
} t_reverbsc;

static void reverbsc_build(t_reverbsc *x)
{
    rsc_free(&x->r);
    if (rsc_init(&x->r, x->sr, x->pitchmod) != 0)
        pd_error(x, NAME ": sample rate out of range or out of memory, silent");
}

static t_int *reverbsc_perform(t_int *w)
{
    t_reverbsc *x = (t_reverbsc *)w[1];
    t_sample *inl = (t_sample *)w[2], *inr = (t_sample *)w[3];
    t_sample *fb = (t_sample *)w[4], *lp = (t_sample *)w[5];
    t_sample *outl = (t_sample *)w[6], *outr = (t_sample *)w[7];
    int n = (int)w[8], i;
    double *b = x->buf, feedback = fb[0], lpfreq = lp[0];

    for (i = 0; i < n; i++) {
        b[i] = isfinite(inl[i]) ? inl[i] : 0;
        b[n + i] = isfinite(inr[i]) ? inr[i] : 0;
    }
    /* k-rate, as in Csound; the feedback kept below 1 (csoundport) */
    if (!(feedback >= 0)) feedback = 0;
    if (feedback > 0.9999) feedback = 0.9999;
    if (!(lpfreq > 0)) lpfreq = 0;
    if (lpfreq > x->sr*0.5) lpfreq = x->sr*0.5;
    rsc_perform(&x->r, LINEAR, b, b + n, feedback, lpfreq, b + 2*n, b + 3*n, n);
    for (i = 0; i < n; i++) {
        outl[i] = (t_sample)b[2*n + i];
        outr[i] = (t_sample)b[3*n + i];
    }
    return w + 9;
}

static void reverbsc_dsp(t_reverbsc *x, t_signal **sp)
{
    int n = sp[0]->s_n;
    if (sp[0]->s_sr != x->sr) {
        x->sr = sp[0]->s_sr;
        reverbsc_build(x);
    }
    if (x->bufn != n) {
        freebytes(x->buf, sizeof(double)*4*x->bufn);
        x->buf = getbytes(sizeof(double)*4*n);
        x->bufn = n;
    }
    dsp_add(reverbsc_perform, 8, x, sp[0]->s_vec, sp[1]->s_vec, sp[2]->s_vec,
            sp[3]->s_vec, sp[4]->s_vec, sp[5]->s_vec, (t_int)n);
}

/* pitchmod 0..20: depth of the random delay modulation (rebuilds, silent) */
static void reverbsc_pitchmod(t_reverbsc *x, t_floatarg f)
{
    x->pitchmod = f < 0 ? 0 : f > 20 ? 20 : f;
    reverbsc_build(x);
}

static void reverbsc_clear(t_reverbsc *x) { rsc_clear(&x->r); }

static void *reverbsc_new(t_symbol *s, int argc, t_atom *argv)
{
    t_reverbsc *x = (t_reverbsc *)pd_new(reverbsc_class);
    (void)s;
    /* reverbsc~ [feedback] [lpfreq] [pitchmod] */
    x->pitchmod = argc > 2 ? atom_getfloatarg(2, argc, argv) : 1;
    if (x->pitchmod < 0) x->pitchmod = 0;
    if (x->pitchmod > 20) x->pitchmod = 20;
    x->sr = sys_getsr();
    reverbsc_build(x);
    signalinlet_new(&x->x_obj, 0);
    signalinlet_new(&x->x_obj, argc > 0 ? atom_getfloatarg(0, argc, argv) : 0.85);
    signalinlet_new(&x->x_obj, argc > 1 ? atom_getfloatarg(1, argc, argv) : 10000);
    outlet_new(&x->x_obj, &s_signal);
    outlet_new(&x->x_obj, &s_signal);
    return x;
}

static void reverbsc_free(t_reverbsc *x)
{
    rsc_free(&x->r);
    freebytes(x->buf, sizeof(double)*4*x->bufn);
}

void SETUP(void)
{
    t_class *c = reverbsc_class = class_new(gensym(NAME), (t_newmethod)reverbsc_new,
        (t_method)reverbsc_free, sizeof(t_reverbsc), CLASS_DEFAULT, A_GIMME, 0);
    CLASS_MAINSIGNALIN(c, t_reverbsc, x_f);
    class_addmethod(c, (t_method)reverbsc_dsp, gensym("dsp"), A_CANT, 0);
    class_addmethod(c, (t_method)reverbsc_pitchmod, gensym("pitchmod"), A_FLOAT, 0);
    class_addmethod(c, (t_method)reverbsc_clear, gensym("clear"), 0);
}
