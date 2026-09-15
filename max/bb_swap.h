/*
    bb_swap.h: models of core/bilbao.c are built on the message thread and
    handed to the audio thread, which alone runs them. csoundport, LGPL 2.1.
*/

#pragma once

#include <stdatomic.h>
#include <stdlib.h>

typedef struct {
    void *cur;                  /* audio thread only */
    _Atomic(void *) pending;    /* newest model, not taken yet */
    _Atomic(void *) trash;      /* model let go by the audio thread */
} bb_swap;

/* message thread: publish a model, delete the ones the audio thread let go */
static inline void bb_swap_post(bb_swap *s, void *m, void (*del)(void *))
{
    void *t = atomic_exchange(&s->trash, NULL);
    if (t)
        del(t);
    t = atomic_exchange(&s->pending, m);
    if (t)
        del(t);
}

/* audio thread, at the start of a vector: the model to run (may be NULL) */
static inline void *bb_swap_take(bb_swap *s)
{
    void *m = atomic_exchange(&s->pending, NULL);
    if (m) {
        void *old = s->cur;
        s->cur = m;
        /* ponytail: a model already in the trash (a post racing this take)
         * leaks, the audio thread must not free */
        (void)atomic_exchange(&s->trash, old);
    }
    return s->cur;
}

/* after dsp_free: nothing runs any more */
static inline void bb_swap_free(bb_swap *s, void (*del)(void *))
{
    void *t;
    if (s->cur) del(s->cur);
    if ((t = atomic_exchange(&s->pending, NULL))) del(t);
    if ((t = atomic_exchange(&s->trash, NULL))) del(t);
    s->cur = NULL;
}
