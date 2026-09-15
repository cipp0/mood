/*
vafilter~ - Pd wrapper for the Csound filters of core/vafilters.c
csoundport Pd wrapper 2026, LGPL 2.1 like Csound. See core/vafilters.c for
the authors and the full notice.

Built once per filter: -DVA_NAME='"spf"' -DVA_SETUP=spf_tilde_setup
*/

#include "m_pd.h"
#include "vafilters.h"
#include <string.h>

static t_class *va_class;
static const va_desc *va_d;

typedef struct {
    t_object x_obj;
    t_float x_f;
    void *st;
    double opt[VA_MAXOPT];
    double sr;
    int n;
    double *buf;        /* (nin + nout) * n doubles */
} t_va;

static t_int *va_perform(t_int *w)
{
    t_va *x = (t_va *)w[1];
    const va_desc *d = va_d;
    int n = (int)w[2], i, k;
    const double *in[VA_MAXIN];
    double *out[VA_MAXOUT];

    /* Pd signals may be float and shared between inlets and outlets:
     * the core works on its own double copies */
    for (k = 0; k < d->nin; k++) {
        t_sample *v = (t_sample *)w[3 + k];
        double *b = x->buf + k*n;
        for (i = 0; i < n; i++)
            b[i] = v[i];
        in[k] = b;
    }
    for (k = 0; k < d->nout; k++)
        out[k] = x->buf + (d->nin + k)*n;
    va_process(d, x->st, x->sr, in, x->opt, out, (uint32_t)n);
    for (k = 0; k < d->nout; k++) {
        t_sample *v = (t_sample *)w[3 + d->nin + k];
        for (i = 0; i < n; i++)
            v[i] = (t_sample)out[k][i];
    }
    return w + 3 + d->nin + d->nout;
}

static void va_dsp(t_va *x, t_signal **sp)
{
    const va_desc *d = va_d;
    int nsig = d->nin + d->nout, n = sp[0]->s_n, i;
    t_int args[2 + VA_MAXIN + VA_MAXOUT];

    if (n != x->n) {
        double *buf = resizebytes(x->buf, x->n*nsig*sizeof(double), n*nsig*sizeof(double));
        if (!buf) {
            pd_error(x, "%s~: out of memory", d->name);
            return;
        }
        x->buf = buf;
        x->n = n;
    }
    x->sr = sp[0]->s_sr;
    args[0] = (t_int)x;
    args[1] = n;
    for (i = 0; i < nsig; i++)
        args[2 + i] = (t_int)sp[i]->s_vec;
    dsp_addv(va_perform, 2 + nsig, args);
}

static void va_clear(t_va *x)
{
    va_d->init(x->st, x->opt);
}

/* option messages: "<name> <value>" */
static void va_anything(t_va *x, t_symbol *s, int argc, t_atom *argv)
{
    const va_desc *d = va_d;
    for (int i = 0; i < d->nopt; i++) {
        if (strcmp(s->s_name, d->opt[i]))
            continue;
        if (!argc || argv->a_type != A_FLOAT) {
            pd_error(x, "%s~: %s needs a number", d->name, s->s_name);
            return;
        }
        x->opt[i] = argv->a_w.w_float;
        if (d->reinit & (1u << i))
            d->init(x->st, x->opt);
        return;
    }
    pd_error(x, "%s~: unknown message '%s'", d->name, s->s_name);
}

static void *va_new(t_symbol *s, int argc, t_atom *argv)
{
    const va_desc *d = va_d;
    t_va *x = (t_va *)pd_new(va_class);
    int i, a = 0;

    x->st = getbytes(d->size);
    /* arguments: the control inlets, then the options */
    for (i = 1; i < d->nin; i++) {
        t_float def = i < d->nin_audio ? 0 : d->indef[i];
        if (i >= d->nin_audio && argc > a)
            def = atom_getfloatarg(a++, argc, argv);
        signalinlet_new(&x->x_obj, def);
    }
    for (i = 0; i < d->nopt; i++)
        x->opt[i] = argc > a ? atom_getfloatarg(a++, argc, argv) : d->optdef[i];
    d->init(x->st, x->opt);
    x->sr = sys_getsr();
    for (i = 0; i < d->nout; i++)
        outlet_new(&x->x_obj, &s_signal);
    return x;
}

static void va_free(t_va *x)
{
    freebytes(x->st, va_d->size);
    freebytes(x->buf, x->n*(va_d->nin + va_d->nout)*sizeof(double));
}

void VA_SETUP(void)
{
    char name[64];

    va_d = va_find(VA_NAME);
    snprintf(name, sizeof(name), "%s~", va_d->name);
    va_class = class_new(gensym(name), (t_newmethod)va_new, (t_method)va_free,
                         sizeof(t_va), CLASS_DEFAULT, A_GIMME, 0);
    CLASS_MAINSIGNALIN(va_class, t_va, x_f);
    class_addmethod(va_class, (t_method)va_dsp, gensym("dsp"), A_CANT, 0);
    class_addmethod(va_class, (t_method)va_clear, gensym("clear"), 0);
    class_addanything(va_class, va_anything);
}
