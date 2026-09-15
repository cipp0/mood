/*
squinewave~ - Max external wrapping the Csound squinewave opcode
Copyright (C) 2017, 2024 rasmus ekman; csoundport Max wrapper 2026.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
See core/squinewave.c for the full notice.
*/

#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"
#include "squinewave.h"
#include <math.h>
#include <stdatomic.h>

static t_class *squinewave_class;

typedef struct {
    t_pxobject ob;
    sqw_osc o;
    double sr, minsweep, phase;
    _Atomic(int) reinit;
    int keep;
    double inval[4];
    short connected[4];
    double *buf;
    long bufn;
} t_squinewave;

static void squinewave_perform64(t_squinewave *x, t_object *dsp64, double **ins, long numins,
                                 double **outs, long numouts, long n, long flags, void *up)
{
    long i, k;
    double *in[4];
    if (n > x->bufn) {
        memset(outs[0], 0, sizeof(double)*n);
        memset(outs[1], 0, sizeof(double)*n);
        return;
    }
    if (atomic_exchange(&x->reinit, 0)) {
        if (!x->keep) x->o.Min_Sweep = 0;
        sqw_init(&x->o, x->sr, x->minsweep, x->phase);
    }
    for (k = 0; k < 4; k++) {
        in[k] = x->buf + k*x->bufn;
        for (i = 0; i < n; i++) {
            double v = x->connected[k] ? ins[k][i] : x->inval[k];
            in[k][i] = isfinite(v) ? v : 0;
        }
    }
    sqw_perform(&x->o, in[0], in[1], in[2], in[3], outs[0], outs[1], (uint32_t)n);
}

static void squinewave_dsp64(t_squinewave *x, t_object *dsp64, short *count, double sr, long maxvs, long flags)
{
    for (int k = 0; k < 4; k++) x->connected[k] = count[k];
    if (maxvs > x->bufn) {
        sysmem_freeptr(x->buf);
        x->buf = (double *)sysmem_newptrclear(sizeof(double)*4*maxvs);
        x->bufn = x->buf ? maxvs : 0;
    }
    if (sr != x->sr) {
        x->sr = sr;
        x->keep = 1;
        atomic_store(&x->reinit, 1);
    }
    object_method(dsp64, gensym("dsp_add64"), x, squinewave_perform64, 0, NULL);
}

static void squinewave_float(t_squinewave *x, double f)
{
    long in = proxy_getinlet((t_object *)x);
    x->inval[in > 3 ? 3 : in] = f;
}

static void squinewave_int(t_squinewave *x, long n) { squinewave_float(x, (double)n); }

/* phase <0..2>: restart there (negative: the up zero crossing) */
static void squinewave_phase(t_squinewave *x, double f)
{
    x->phase = f;
    x->keep = 0;
    atomic_store(&x->reinit, 1);
}

/* minsweep <4..sr/100>: shortest sweep in samples (0 default) */
static void squinewave_minsweep(t_squinewave *x, double f)
{
    x->minsweep = f;
    x->phase = -1;
    x->keep = 1;
    atomic_store(&x->reinit, 1);
}

static void squinewave_assist(t_squinewave *x, void *b, long m, long a, char *s)
{
    static const char *ins[4] = {"(signal/float) frequency in Hz, negative runs backwards; phase minsweep",
                                 "(signal/float) clip 0..1: sine to square", "(signal/float) skew -1..1: to saw and pulse",
                                 "(signal) sync: 1 restarts the cycle"};
    if (m == ASSIST_INLET)
        snprintf(s, 256, "%s", ins[a > 3 ? 3 : a]);
    else
        snprintf(s, 256, a ? "(signal) 1 at the start of each cycle" : "(signal) output");
}

static void *squinewave_new(t_symbol *s, long argc, t_atom *argv)
{
    t_squinewave *x = (t_squinewave *)object_alloc(squinewave_class);
    if (!x)
        return NULL;
    /* squinewave~ [freq] [clip] [skew] [minsweep] [phase] */
    x->inval[0] = argc > 0 ? atom_getfloat(argv) : 220;
    x->inval[1] = argc > 1 ? atom_getfloat(argv + 1) : 0;
    x->inval[2] = argc > 2 ? atom_getfloat(argv + 2) : 0;
    x->minsweep = argc > 3 ? atom_getfloat(argv + 3) : 0;
    x->phase = argc > 4 ? atom_getfloat(argv + 4) : -1;
    x->sr = sys_getsr();
    sqw_init(&x->o, x->sr, x->minsweep, x->phase);
    dsp_setup((t_pxobject *)x, 4);
    x->ob.z_misc |= Z_NO_INPLACE;
    outlet_new(x, "signal");
    outlet_new(x, "signal");
    return x;
}

static void squinewave_free(t_squinewave *x)
{
    dsp_free((t_pxobject *)x);
    sysmem_freeptr(x->buf);
}

void ext_main(void *r)
{
    t_class *c = class_new("squinewave~", (method)squinewave_new, (method)squinewave_free,
                           sizeof(t_squinewave), 0L, A_GIMME, 0);
    class_addmethod(c, (method)squinewave_dsp64, "dsp64", A_CANT, 0);
    class_addmethod(c, (method)squinewave_float, "float", A_FLOAT, 0);
    class_addmethod(c, (method)squinewave_int, "int", A_LONG, 0);
    class_addmethod(c, (method)squinewave_phase, "phase", A_FLOAT, 0);
    class_addmethod(c, (method)squinewave_minsweep, "minsweep", A_FLOAT, 0);
    class_addmethod(c, (method)squinewave_assist, "assist", A_CANT, 0);
    class_dspinit(c);
    class_register(CLASS_BOX, c);
    squinewave_class = c;
}
