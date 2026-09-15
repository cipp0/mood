/*
    vafilters.h: host-independent ports of Csound filter opcodes from
    newfils.c (Victor Lazzarini, Gleb Rogozinsky, Fons Adriaensen designs),
    biquad.c (Hans Mikelson, Matt Gerassimoff, Francois Blanc, Steven Yi),
    pitch.c (Josep Comajuncosas, John ffitch), lowpassr.c (Gabriel Maldonado),
    ugsc.c (Sean Costello), nlfilt.c (Dobson and Fitch), exciter.c (Markus
    Schmidt), gammatone.c (John ffitch).

    This file is part of Csound. The Csound Library is free software; you
    can redistribute it and/or modify it under the terms of the GNU Lesser
    General Public License as published by the Free Software Foundation;
    either version 2.1 of the License, or (at your option) any later version.
    See core/vafilters.c for the full notice.
*/

#pragma once

#include <stddef.h>
#include <stdint.h>

#define VA_MAXIN 5      /* signal inputs, the audio input(s) included */
#define VA_MAXOPT 5     /* control options (Csound k- and i-rate arguments) */
#define VA_MAXOUT 4

/* one Csound opcode as a host sees it; signals are double vectors */
typedef struct {
    const char *name;           /* object name without ~ */
    const char *csound;         /* Csound opcode */
    int32_t nin;                /* signal inlets; the first nin_audio are audio */
    int32_t nin_audio;
    const char *in[VA_MAXIN];
    double indef[VA_MAXIN];     /* defaults of the control inlets */
    int32_t nopt;
    const char *opt[VA_MAXOPT];
    double optdef[VA_MAXOPT];
    uint32_t reinit;            /* options (bitmask) that rerun init when set */
    int32_t nout;
    const char *out[VA_MAXOUT];
    size_t size;                /* state size */
    void (*init)(void *st, const double *opt);
    void (*perform)(void *st, double sr, const double *const *in,
                    const double *opt, double *const *out, uint32_t n);
} va_desc;

extern const va_desc va_filters[];
extern const int32_t va_nfilters;
const va_desc *va_find(const char *name);

/* perform plus a guard: a non-finite output clears the state and the block */
void va_process(const va_desc *d, void *st, double sr, const double *const *in,
                const double *opt, double *const *out, uint32_t n);
