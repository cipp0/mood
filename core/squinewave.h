/*
    squinewave.h: Csound's squinewave (Opcodes/squinewave.c), rasmus ekman's
    sine-square-pulse-saw morphing oscillator. csoundport, LGPL 2.1.
*/

#pragma once

#include <stdint.h>

typedef struct {
    double phase, sweep_phase, hardsync_phase, hardsync_inc;
    int32_t neg_freq, init_phase;
    double Min_Sweep, Maxphase_By_sr, Max_Sweep_Freq, Max_Sync_Freq, Sync_Phase_Inc;
    double iphase;
} sqw_osc;

/* minsweep 4..sr/100 (0 default sr/3000), iphase 0..2 (negative: the up
 * zero crossing, or keep the phase when restarting). Returns 1 when
 * minsweep was out of range and set to the default */
int32_t sqw_init(sqw_osc *p, double sr, double minsweep, double iphase);
/* freq (Hz, negative runs backwards), clip 0..1, skew -1..1: n samples each.
 * sync_in (NULL or n samples, >= 1 syncs), sync_out (NULL or n samples) */
void sqw_perform(sqw_osc *p, const double *freq, const double *clip, const double *skew,
                 const double *sync_in, double *out, double *sync_out, uint32_t n);
