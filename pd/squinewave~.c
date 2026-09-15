/*
squinewave~ - Pd external wrapping the Csound squinewave opcode
Copyright (C) 2017, 2024 rasmus ekman; csoundport Pd wrapper 2026.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
See core/squinewave.c for the full notice.
*/

#include "m_pd.h"
#include "squinewave.h"
#include <math.h>

static t_class *squinewave_class;

typedef struct {
    t_object x_obj;
    t_float x_f;
    sqw_osc o;
    double sr, minsweep, phase;
    int reinit;
    double *buf;
    int bufn;
} t_squinewave;

static void squinewave_start(t_squinewave *x)
{
    if (sqw_init(&x->o, x->sr, x->minsweep, x->phase))
        post("squinewave~: minsweep is 4 to sr/100, set to the default %g", x->o.Min_Sweep);
}

static t_int *squinewave_perform(t_int *w)
{
    t_squinewave *x = (t_squinewave *)w[1];
    int n = (int)w[8], i, k;
    double *b = x->buf;

    for (k = 0; k < 4; k++) {
        t_sample *in = (t_sample *)w[2 + k];
        for (i = 0; i < n; i++)
            b[k*n + i] = isfinite(in[i]) ? in[i] : 0;
    }
    if (x->reinit) {
        x->reinit = 0;
        squinewave_start(x);
    }
    sqw_perform(&x->o, b, b + n, b + 2*n, b + 3*n, b + 4*n, b + 5*n, n);
    for (k = 0; k < 2; k++) {
        t_sample *out = (t_sample *)w[6 + k];
        for (i = 0; i < n; i++)
            out[i] = (t_sample)b[(4 + k)*n + i];
    }
    return w + 9;
}

static void squinewave_dsp(t_squinewave *x, t_signal **sp)
{
    int n = sp[0]->s_n;
    if (sp[0]->s_sr != x->sr) {
        x->sr = sp[0]->s_sr;
        squinewave_start(x);
    }
    if (x->bufn != n) {
        freebytes(x->buf, sizeof(double)*6*x->bufn);
        x->buf = getbytes(sizeof(double)*6*n);
        x->bufn = n;
    }
    dsp_add(squinewave_perform, 8, x, sp[0]->s_vec, sp[1]->s_vec, sp[2]->s_vec,
            sp[3]->s_vec, sp[4]->s_vec, sp[5]->s_vec, (t_int)n);
}

/* phase <0..2>: restart there at the next block (negative: the up zero crossing) */
static void squinewave_phase(t_squinewave *x, t_floatarg f)
{
    x->phase = f;
    x->o.Min_Sweep = 0;         /* so the phase is set even when negative */
    x->reinit = 1;
}

/* minsweep <4..sr/100>: shortest sweep in samples, higher is smoother (0 default) */
static void squinewave_minsweep(t_squinewave *x, t_floatarg f)
{
    x->minsweep = f;
    x->phase = -1;              /* keep running */
    x->reinit = 1;
}

static void *squinewave_new(t_symbol *s, int argc, t_atom *argv)
{
    t_squinewave *x = (t_squinewave *)pd_new(squinewave_class);
    (void)s;
    /* squinewave~ [freq] [clip] [skew] [minsweep] [phase] */
    x->sr = sys_getsr();
    x->minsweep = argc > 3 ? atom_getfloatarg(3, argc, argv) : 0;
    x->phase = argc > 4 ? atom_getfloatarg(4, argc, argv) : -1;
    squinewave_start(x);
    x->x_f = argc > 0 ? atom_getfloatarg(0, argc, argv) : 220;
    signalinlet_new(&x->x_obj, argc > 1 ? atom_getfloatarg(1, argc, argv) : 0);
    signalinlet_new(&x->x_obj, argc > 2 ? atom_getfloatarg(2, argc, argv) : 0);
    signalinlet_new(&x->x_obj, 0);
    outlet_new(&x->x_obj, &s_signal);
    outlet_new(&x->x_obj, &s_signal);
    return x;
}

static void squinewave_free(t_squinewave *x)
{
    freebytes(x->buf, sizeof(double)*6*x->bufn);
}

void squinewave_tilde_setup(void)
{
    t_class *c = squinewave_class = class_new(gensym("squinewave~"), (t_newmethod)squinewave_new,
        (t_method)squinewave_free, sizeof(t_squinewave), CLASS_DEFAULT, A_GIMME, 0);
    CLASS_MAINSIGNALIN(c, t_squinewave, x_f);
    class_addmethod(c, (t_method)squinewave_dsp, gensym("dsp"), A_CANT, 0);
    class_addmethod(c, (t_method)squinewave_phase, gensym("phase"), A_FLOAT, 0);
    class_addmethod(c, (t_method)squinewave_minsweep, gensym("minsweep"), A_FLOAT, 0);
}
