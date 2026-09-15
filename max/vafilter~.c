/*
vafilter~ - Max wrapper for the Csound filters of core/vafilters.c
csoundport Max wrapper 2026, LGPL 2.1 like Csound. See core/vafilters.c for
the authors and the full notice.

Built once per filter: -DVA_NAME='"spf"'
*/

#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"
#include "vafilters.h"
#include <string.h>

static t_class *va_class;
static const va_desc *va_d;

typedef struct {
    t_pxobject ob;
    void *st;
    double opt[VA_MAXOPT];
    double sr;
    double inval[VA_MAXIN];     /* floats sent to signal inlets */
    short connected[VA_MAXIN];
    double *constbuf;           /* VA_MAXIN*maxn, unconnected inlets */
    long maxn;
} t_va;

static void va_perform64(t_va *x, t_object *dsp64, double **ins, long numins,
                         double **outs, long numouts, long n, long flags,
                         void *userparam)
{
    const va_desc *d = va_d;
    const double *in[VA_MAXIN];
    long i, j;

    if (n > x->maxn) {
        for (i = 0; i < numouts; ++i)
            memset(outs[i], 0, n*sizeof(double));
        return;
    }
    for (i = 0; i < d->nin; ++i) {
        if (x->connected[i]) {
            in[i] = ins[i];
        } else {
            double *b = x->constbuf + i*x->maxn;
            for (j = 0; j < n; ++j)
                b[j] = x->inval[i];
            in[i] = b;
        }
    }
    /* Z_NO_INPLACE: outputs never alias inputs */
    va_process(d, x->st, x->sr, in, x->opt, outs, (uint32_t)n);
}

static void va_dsp64(t_va *x, t_object *dsp64, short *count, double samplerate,
                     long maxvectorsize, long flags)
{
    for (long i = 0; i < va_d->nin; ++i)
        x->connected[i] = count[i];
    if (maxvectorsize != x->maxn) {
        double *buf = (double *)sysmem_newptrclear(VA_MAXIN*maxvectorsize*sizeof(double));
        if (!buf) {
            object_error((t_object *)x, "out of memory");
            return;
        }
        sysmem_freeptr(x->constbuf);
        x->constbuf = buf;
        x->maxn = maxvectorsize;
    }
    x->sr = samplerate;
    object_method(dsp64, gensym("dsp_add64"), x, va_perform64, 0, NULL);
}

static void va_float(t_va *x, double f)
{
    long inlet = proxy_getinlet((t_object *)x);
    if (inlet >= 0 && inlet < va_d->nin)
        x->inval[inlet] = f;
}

static void va_int(t_va *x, long n)
{
    va_float(x, (double)n);
}

static void va_clear(t_va *x)
{
    va_d->init(x->st, x->opt);
}

/* option messages: "<name> <value>" */
static void va_anything(t_va *x, t_symbol *s, long argc, t_atom *argv)
{
    const va_desc *d = va_d;
    for (int i = 0; i < d->nopt; i++) {
        if (strcmp(s->s_name, d->opt[i]))
            continue;
        if (!argc || (atom_gettype(argv) != A_FLOAT && atom_gettype(argv) != A_LONG)) {
            object_error((t_object *)x, "%s needs a number", s->s_name);
            return;
        }
        x->opt[i] = atom_getfloat(argv);
        /* ponytail: init runs on the main thread while the audio thread may
         * be in perform; a lock-free handover if it ever clicks */
        if (d->reinit & (1u << i))
            d->init(x->st, x->opt);
        return;
    }
    object_error((t_object *)x, "unknown message '%s'", s->s_name);
}

static void va_assist(t_va *x, void *b, long m, long a, char *s)
{
    const va_desc *d = va_d;
    if (m == ASSIST_INLET) {
        if (a == 0) {
            char opts[160] = "";
            for (int i = 0; i < d->nopt; i++) {
                strncat(opts, " ", sizeof(opts) - strlen(opts) - 1);
                strncat(opts, d->opt[i], sizeof(opts) - strlen(opts) - 1);
            }
            snprintf(s, 256, "(signal) %s, messages:%s clear", d->in[0], opts);
        } else if (a < d->nin) {
            snprintf(s, 256, a < d->nin_audio ? "(signal) %s" : "(signal/float) %s", d->in[a]);
        }
    } else if (a < d->nout) {
        snprintf(s, 256, "(signal) %s", d->out[a]);
    }
}

static void *va_new(t_symbol *s, long argc, t_atom *argv)
{
    const va_desc *d = va_d;
    t_va *x = (t_va *)object_alloc(va_class);
    long i, a = 0;

    if (!x)
        return NULL;
    dsp_setup((t_pxobject *)x, d->nin);
    x->ob.z_misc |= Z_NO_INPLACE;
    for (i = 0; i < d->nout; i++)
        outlet_new(x, "signal");
    x->st = sysmem_newptrclear(d->size);
    /* arguments: the control inlets, then the options */
    for (i = d->nin_audio; i < d->nin; i++)
        x->inval[i] = argc > a ? atom_getfloat(argv + a++) : d->indef[i];
    for (i = 0; i < d->nopt; i++)
        x->opt[i] = argc > a ? atom_getfloat(argv + a++) : d->optdef[i];
    d->init(x->st, x->opt);
    x->sr = sys_getsr();
    return x;
}

static void va_free(t_va *x)
{
    dsp_free((t_pxobject *)x);
    sysmem_freeptr(x->st);
    sysmem_freeptr(x->constbuf);
}

void ext_main(void *r)
{
    char name[64];
    t_class *c;

    va_d = va_find(VA_NAME);
    snprintf(name, sizeof(name), "%s~", va_d->name);
    c = class_new(name, (method)va_new, (method)va_free, sizeof(t_va), 0L, A_GIMME, 0);
    class_addmethod(c, (method)va_dsp64, "dsp64", A_CANT, 0);
    class_addmethod(c, (method)va_float, "float", A_FLOAT, 0);
    class_addmethod(c, (method)va_int, "int", A_LONG, 0);
    class_addmethod(c, (method)va_clear, "clear", 0);
    class_addmethod(c, (method)va_anything, "anything", A_GIMME, 0);
    class_addmethod(c, (method)va_assist, "assist", A_CANT, 0);
    class_dspinit(c);
    class_register(CLASS_BOX, c);
    va_class = c;
}
