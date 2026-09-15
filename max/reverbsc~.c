/*
reverbsc~, reverbsc2~ - Max externals wrapping the Csound reverbsc and reverbsc2 opcodes
Copyright 1999, 2005 Sean Costello and Istvan Varga; csoundport Max wrapper 2026.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.
See core/reverbsc.c for the full notice.
*/

#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"
#include "reverbsc.h"
#include "bb_swap.h"
#include <math.h>

#ifdef REVERBSC2
#define NAME "reverbsc2~"
#define LINEAR 1
#else
#define NAME "reverbsc~"
#define LINEAR 0
#endif

static t_class *reverbsc_class;

typedef struct {
    t_pxobject ob;
    bb_swap sw;
    double sr, pitchmod;
    double inval[4];
    short connected[4];
    _Atomic(int) clear;
} t_reverbsc;

static void rev_delete(void *m)
{
    rsc_free((rsc_reverb *)m);
    sysmem_freeptr(m);
}

static void reverbsc_build(t_reverbsc *x)
{
    rsc_reverb *r = (rsc_reverb *)sysmem_newptrclear(sizeof(rsc_reverb));
    if (!r)
        return;
    if (rsc_init(r, x->sr, x->pitchmod) != 0)
        object_error((t_object *)x, "sample rate out of range or out of memory, silent");
    bb_swap_post(&x->sw, r, rev_delete);
}

static void reverbsc_perform64(t_reverbsc *x, t_object *dsp64, double **ins, long numins,
                               double **outs, long numouts, long n, long flags, void *up)
{
    rsc_reverb *r = (rsc_reverb *)bb_swap_take(&x->sw);
    double feedback = x->connected[2] ? ins[2][0] : x->inval[2];
    double lpfreq = x->connected[3] ? ins[3][0] : x->inval[3];
    long i, k;
    if (!r) {
        memset(outs[0], 0, sizeof(double)*n);
        memset(outs[1], 0, sizeof(double)*n);
        return;
    }
    if (atomic_exchange(&x->clear, 0))
        rsc_clear(r);
    for (k = 0; k < 2; k++) {
        if (!x->connected[k]) {
            for (i = 0; i < n; i++) ins[k][i] = x->inval[k];
        } else {
            for (i = 0; i < n; i++) if (!isfinite(ins[k][i])) ins[k][i] = 0;
        }
    }
    if (!(feedback >= 0)) feedback = 0;
    if (feedback > 0.9999) feedback = 0.9999;
    if (!(lpfreq > 0)) lpfreq = 0;
    if (lpfreq > x->sr*0.5) lpfreq = x->sr*0.5;
    rsc_perform(r, LINEAR, ins[0], ins[1], feedback, lpfreq, outs[0], outs[1], (uint32_t)n);
}

static void reverbsc_dsp64(t_reverbsc *x, t_object *dsp64, short *count, double sr, long maxvs, long flags)
{
    for (int k = 0; k < 4; k++) x->connected[k] = count[k];
    if (sr != x->sr) {
        x->sr = sr;
        reverbsc_build(x);
    }
    object_method(dsp64, gensym("dsp_add64"), x, reverbsc_perform64, 0, NULL);
}

static void reverbsc_float(t_reverbsc *x, double f)
{
    long in = proxy_getinlet((t_object *)x);
    x->inval[in > 3 ? 3 : in] = f;
}

static void reverbsc_int(t_reverbsc *x, long n) { reverbsc_float(x, (double)n); }

static void reverbsc_pitchmod(t_reverbsc *x, double f)
{
    x->pitchmod = f < 0 ? 0 : f > 20 ? 20 : f;
    reverbsc_build(x);
}

static void reverbsc_clear(t_reverbsc *x) { atomic_store(&x->clear, 1); }

static void reverbsc_assist(t_reverbsc *x, void *b, long m, long a, char *s)
{
    static const char *ins[4] = {"(signal) left input; pitchmod clear", "(signal) right input",
                                 "(signal/float) feedback 0..1 (per block)", "(signal/float) lowpass Hz (per block)"};
    if (m == ASSIST_INLET)
        snprintf(s, 256, "%s", ins[a > 3 ? 3 : a]);
    else
        snprintf(s, 256, "(signal) %s output", a ? "right" : "left");
}

static void *reverbsc_new(t_symbol *s, long argc, t_atom *argv)
{
    t_reverbsc *x = (t_reverbsc *)object_alloc(reverbsc_class);
    if (!x)
        return NULL;
    /* reverbsc~ [feedback] [lpfreq] [pitchmod] */
    x->inval[2] = argc > 0 ? atom_getfloat(argv) : 0.85;
    x->inval[3] = argc > 1 ? atom_getfloat(argv + 1) : 10000;
    x->pitchmod = argc > 2 ? atom_getfloat(argv + 2) : 1;
    if (x->pitchmod < 0) x->pitchmod = 0;
    if (x->pitchmod > 20) x->pitchmod = 20;
    x->sr = sys_getsr();
    dsp_setup((t_pxobject *)x, 4);
    x->ob.z_misc |= Z_NO_INPLACE;
    outlet_new(x, "signal");
    outlet_new(x, "signal");
    reverbsc_build(x);
    return x;
}

static void reverbsc_free(t_reverbsc *x)
{
    dsp_free((t_pxobject *)x);
    bb_swap_free(&x->sw, rev_delete);
}

void ext_main(void *r)
{
    t_class *c = class_new(NAME, (method)reverbsc_new, (method)reverbsc_free, sizeof(t_reverbsc), 0L, A_GIMME, 0);
    class_addmethod(c, (method)reverbsc_dsp64, "dsp64", A_CANT, 0);
    class_addmethod(c, (method)reverbsc_float, "float", A_FLOAT, 0);
    class_addmethod(c, (method)reverbsc_int, "int", A_LONG, 0);
    class_addmethod(c, (method)reverbsc_pitchmod, "pitchmod", A_FLOAT, 0);
    class_addmethod(c, (method)reverbsc_clear, "clear", 0);
    class_addmethod(c, (method)reverbsc_assist, "assist", A_CANT, 0);
    class_dspinit(c);
    class_register(CLASS_BOX, c);
    reverbsc_class = c;
}
