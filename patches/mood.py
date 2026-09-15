# generates mood.maxpat: a monophonic synth after the Minimoog Model D,
# three squinewave~ oscillators, noise, moogladder2~, two ADS(R) contours,
# glide, modulation mix and a small sequencer. Needs the max/
# folder in Max's search path.
import os, sys

here = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(here, "..", "max"))
from maxpatch import Patcher

WAVES = ["triangle", "shark", "saw", "square", "wide pulse", "narrow pulse"]
# clip, skew of squinewave~ for each Model D waveform
SHAPES = ["0 0", "0 0.5", "0 1", "1 0", "1 0.5", "1 0.85"]

# ------------------------------------------------------------ parameters
# name: (label, min, max, default)
PARAMS = {
    "tune": ("tune", -2, 2, 0), "glide": ("glide ms", 0, 2000, 0),
    "modmix": ("osc3 <-> noise", 0, 1, 0), "wheel": ("mod wheel", 0, 1, 0),
    "oscmod": ("osc mod", 0, 1, 0), "filtmod": ("filter mod", 0, 1, 0),
    "o1oct": ("octave", -2, 2, 0), "o1wave": ("wave", 0, 5, 2),
    "o2oct": ("octave", -2, 2, 0), "o2det": ("detune st", -7, 7, 0.08), "o2wave": ("wave", 0, 5, 2),
    "sync": ("sync to osc1", 0, 1, 0),
    "o3oct": ("octave", -6, 2, -1), "o3det": ("detune st", -7, 7, -0.06), "o3wave": ("wave", 0, 5, 3),
    "o3kbd": ("keyboard", 0, 1, 1),
    "v1": ("osc 1", 0, 1, 0.8), "v2": ("osc 2", 0, 1, 0.7), "v3": ("osc 3", 0, 1, 0.5),
    "vn": ("noise", 0, 1, 0), "noisetype": ("white/pink", 0, 1, 0), "drive": ("drive", 0.1, 4, 1.5),
    "cutoff": ("cutoff (note)", 0, 135, 40), "emph": ("emphasis", 0, 1, 0.4),
    "amount": ("contour amt", 0, 1, 0.6), "kbdtrack": ("kbd track", 0, 1, 0.33),
    "fa": ("attack", 1, 5000, 5), "fd": ("decay", 5, 5000, 300), "fs": ("sustain", 0, 1, 0.2),
    "la": ("attack", 1, 5000, 3), "ld": ("decay", 5, 5000, 400), "ls": ("sustain", 0, 1, 0.8),
    "decayrel": ("decay on release", 0, 1, 1), "master": ("volume", 0, 1, 0.4),
    "revmix": ("reverb", 0, 1, 0.25), "revfb": ("size", 0.5, 0.99, 0.85), "revlp": ("tone Hz", 500, 16000, 8000),
    "tempo": ("step ms", 60, 1000, 160), "gatelen": ("gate %", 5, 100, 50),
}
TOGGLES = {"oscmod", "filtmod", "sync", "o3kbd", "noisetype", "decayrel"}
MENUS = {"o1wave", "o2wave", "o3wave"}


def preset(**kw):
    v = {k: p[3] for k, p in PARAMS.items()}
    v.update(kw)
    return "; " + "; ".join("md-%s %g" % (k, v[k]) for k in PARAMS if k not in ("tempo", "gatelen"))


PRESETS = [
    ("Fat bass", preset()),
    ("Taurus-ish sub", preset(o1oct=-1, o2oct=-1, o3oct=-2, o3det=0.03, o1wave=3, o2wave=2, o3wave=0,
                              v3=0.9, cutoff=34, emph=0.2, amount=0.45, fd=500, fs=0.1, ld=900, ls=0.6, glide=60)),
    ("Lead + vibrato", preset(o1wave=2, o2wave=4, o2det=7.02, o2oct=0, o3kbd=0, o3oct=-4, o3det=17, o3wave=0,
                              v3=0, oscmod=1, wheel=0.12, cutoff=70, emph=0.55, amount=0.4, fs=0.6,
                              la=10, ld=800, ls=0.9, glide=120, revmix=0.35, revfb=0.9)),
    ("Brass", preset(o1wave=2, o2wave=2, o2det=0.12, o3wave=2, o3det=-0.1, o3oct=0, cutoff=48, emph=0.15,
                     amount=0.75, fa=220, fd=900, fs=0.55, la=40, ld=600, ls=0.85)),
    ("Sync sweep", preset(sync=1, o2oct=1, o2det=5, o2wave=2, v1=0.2, v2=1, v3=0, o3kbd=0, o3oct=-5,
                          o3det=0, oscmod=0, filtmod=0, cutoff=80, emph=0.3, amount=0.3, fs=0.7, ld=700, ls=0.9)),
    ("Resonant wobble", preset(o1wave=3, o2wave=2, o3kbd=0, o3oct=-4, o3det=14, o3wave=0, v3=0,
                               filtmod=1, wheel=0.7, modmix=0, cutoff=45, emph=0.85, amount=0.2, fs=0.8, ls=1)),
    ("Noise wind", preset(v1=0, v2=0, v3=0, vn=1, noisetype=1, o3kbd=0, o3oct=-6, o3det=0, filtmod=1,
                          wheel=0.9, modmix=0, cutoff=72, emph=0.92, amount=0, la=900, ld=2000, ls=1,
                          kbdtrack=1, drive=0.8, revmix=0.5, revfb=0.95, revlp=5000)),
]

PATTERNS = [
    ("disco", "36 48 36 48 36 48 36 48 34 46 34 46 39 51 41 53"),
    ("acid", "36 36 48 36 39 36 51 36 41 36 43 48 36 46 36 39"),
    ("berlin", "36 43 48 51 55 51 48 43 36 43 48 51 55 58 55 51"),
]


# ------------------------------------------------------------ helpers
def S(M, x, y, text, nin=1, nout=1, w=None):
    """a signal object"""
    return M.obj(x, y, text, nin, nout, ["signal"]*nout, w=w)


def hidden(M, bid):
    M.boxes[-1]["box"]["hidden"] = 1 if M.boxes[-1]["box"]["id"] == bid else M.boxes[-1]["box"].get("hidden", 0)
    for b in M.boxes:
        if b["box"]["id"] == bid:
            b["box"]["hidden"] = 1
    return bid


def panel(M, x, y, w, h, title, color):
    M.box("panel", x, y, w, h, None, 1, 0, bgcolor=color, rounded=10, background=1, mode=0)
    M.box("comment", x + 10, y + 6, w - 20, 22, title, 1, 0, fontface=1, fontsize=13.0,
          textcolor=[0.95, 0.95, 0.95, 1.0])


CTL = {}      # name -> id of its patching ui
W = {}        # other widgets shown in presentation


def control(M, x, y, name):
    """label, [r md-name] -> ui -> [s mdv-name]"""
    label, lo, hi, _ = PARAMS[name]
    M.box("comment", x, y, 110, 20, label, 1, 0, fontsize=11.0, textcolor=[0.9, 0.9, 0.9, 1.0])
    r = hidden(M, M.obj(x + 60, y - 22, "r md-" + name, 0, 1, [""]))
    if name in TOGGLES:
        ui = M.box("toggle", x, y + 20, 22, 22, None, 1, 1, ["int"], parameter_enable=0)
    elif name in MENUS:
        items = []
        for i, wv in enumerate(WAVES):
            items += ([","] if i else []) + [wv]
        ui = M.box("umenu", x, y + 20, 105, 22, None, 1, 3, ["int", "", ""], items=items, parameter_enable=0)
    else:
        ui = M.box("flonum", x, y + 20, 70, 22, None, 1, 2, ["", "bang"], parameter_enable=0,
                   minimum=lo, maximum=hi, format=6)
    s = hidden(M, M.obj(x + 60, y + 48, "s mdv-" + name, 1, 0, []))
    M.c(r, 0, ui, 0)
    M.c(ui, 0, s, 0)
    CTL[name] = ui
    return ui


PREFIX = ""   # "---" in Max for Live: names local to each device


def rcv(M, x, y, name):
    return M.obj(x, y, "r %smdv-%s" % (PREFIX, name), 0, 1, [""])


# ------------------------------------------------------------ the voice
def voice():
    V = Patcher([100, 100, 1200, 820])
    V.comment(10, 5, "The voice. Parameters arrive as mdv-<name>, notes as mdv-note and mdv-gate.", 600)

    # pitch: note with glide, tune, pitch modulation
    rn = rcv(V, 10, 40, "note")
    rg = rcv(V, 110, 40, "glide")
    pk = V.obj(10, 70, "pack 0. 0.", 2, 1, [""])
    ln = S(V, 10, 100, "line~", 2, 2)
    V.c(rn, 0, pk, 0); V.c(rg, 0, pk, 1); V.c(pk, 0, ln, 0)
    lb = V.obj(200, 40, "loadbang", 1, 1, ["bang"])
    l48 = V.msg(200, 70, "48")
    V.c(lb, 0, l48, 0); V.c(l48, 0, ln, 0)
    rt = rcv(V, 110, 100, "tune")
    tune = S(V, 10, 130, "+~ 0.", 2)
    V.c(ln, 0, tune, 0); V.c(rt, 0, tune, 1)
    pitch = S(V, 10, 190, "+~", 2)             # + pitch modulation
    V.c(tune, 0, pitch, 0)
    V.comment(80, 190, "note + tune + osc modulation (semitones)", 260)

    # modulation: (osc3 * (1 - mix) + noise * mix) * wheel
    mx = 700
    V.comment(mx, 10, "modulation mix and wheel", 200)
    rmix = rcv(V, mx, 40, "modmix")
    inv = V.obj(mx + 100, 70, "expr 1. - $f1", 1, 1, [""])
    V.c(rmix, 0, inv, 0)
    m3 = S(V, mx, 130, "*~ 1.", 2)
    mn = S(V, mx + 100, 130, "*~ 0.", 2)
    V.c(inv, 0, m3, 1); V.c(rmix, 0, mn, 1)
    msum = S(V, mx, 160, "+~", 2)
    V.c(m3, 0, msum, 0); V.c(mn, 0, msum, 1)
    rw = rcv(V, mx + 100, 160, "wheel")
    mod = S(V, mx, 190, "*~ 0.", 2)
    V.c(msum, 0, mod, 0); V.c(rw, 0, mod, 1)
    # to the oscillators: 6 semitones at full wheel
    rom = rcv(V, mx + 100, 220, "oscmod")
    omd = V.obj(mx + 100, 245, "* 6.", 2, 1, [""])
    V.c(rom, 0, omd, 0)
    pm = S(V, mx, 275, "*~ 0.", 2)
    V.c(mod, 0, pm, 0); V.c(omd, 0, pm, 1)
    V.c(pm, 0, pitch, 1)
    # to the filter: 2 octaves at full wheel
    rfm = rcv(V, mx + 100, 305, "filtmod")
    fmd = V.obj(mx + 100, 330, "* 24.", 2, 1, [""])
    V.c(rfm, 0, fmd, 0)
    fm = S(V, mx, 360, "*~ 0.", 2)
    V.c(mod, 0, fm, 0); V.c(fmd, 0, fm, 1)

    # oscillators
    def osc(x, n, det, kbd):
        V.comment(x, 230, "oscillator %d" % n, 120)
        ro = rcv(V, x + 90, 255, "o%doct" % n)
        if det:
            rd = rcv(V, x + 200, 255, "o%ddet" % n)
            pak = V.obj(x + 90, 280, "pak 0. 0.", 2, 1, [""])
            V.c(ro, 0, pak, 0); V.c(rd, 0, pak, 1)
            ex = V.obj(x + 90, 305, "expr $f1 * 12. + $f2", 1, 1, [""])
            V.c(pak, 0, ex, 0)
        else:
            ex = V.obj(x + 90, 305, "* 12.", 2, 1, [""])
            V.c(ro, 0, ex, 0)
        src = pitch
        if kbd:
            # osc3 is the modulation source: it takes the pitch before the
            # modulation, MSP refuses signal loops
            rk = rcv(V, x + 200, 305, "o3kbd")
            kg = S(V, x, 305, "*~ 1.", 2)
            V.c(tune, 0, kg, 0); V.c(rk, 0, kg, 1)
            src = kg
        add = S(V, x, 335, "+~ 0.", 2)
        V.c(src, 0, add, 0); V.c(ex, 0, add, 1)
        mt = S(V, x, 365, "mtof~")
        V.c(add, 0, mt, 0)
        rwv = rcv(V, x + 90, 365, "o%dwave" % n)
        sel = V.obj(x + 90, 390, "sel 0 1 2 3 4 5", 1, 7, [""]*7, w=110)
        V.c(rwv, 0, sel, 0)
        shp = []
        for i, s in enumerate(SHAPES):
            m = V.msg(x + 90 + (i % 3)*45, 420 + (i // 3)*25, s, 42)
            V.c(sel, i, m, 0)
            shp.append(m)
        up = V.obj(x + 90, 475, "unpack 0. 0.", 1, 2, ["float", "float"])
        for m in shp:
            V.c(m, 0, up, 0)
        sq = S(V, x, 510, "squinewave~ 110", 4, 2, w=110)
        V.c(mt, 0, sq, 0); V.c(up, 0, sq, 1); V.c(up, 1, sq, 2)
        return sq

    o1 = osc(10, 1, False, False)
    o2 = osc(240, 2, True, False)
    o3 = osc(470, 3, True, True)
    V.c(o3, 0, m3, 0)
    # sync: osc2 restarted by osc1
    rsy = rcv(V, 350, 540, "sync")
    sg = S(V, 240, 480, "*~ 0.", 2)
    V.c(o1, 1, sg, 0); V.c(rsy, 0, sg, 1); V.c(sg, 0, o2, 3)

    # noise
    V.comment(mx, 400, "noise", 60)
    wn = S(V, mx, 425, "noise~")
    pn = S(V, mx + 70, 425, "pink~")
    V.c(wn, 0, pn, 0)
    rnt = rcv(V, mx + 150, 425, "noisetype")
    p1 = V.obj(mx + 150, 450, "+ 1", 2, 1, ["int"])
    V.c(rnt, 0, p1, 0)
    ns = S(V, mx, 480, "selector~ 2 1", 3)
    V.c(p1, 0, ns, 0); V.c(wn, 0, ns, 1); V.c(pn, 0, ns, 2)
    V.c(ns, 0, mn, 0)

    # mixer
    V.comment(10, 560, "mixer", 60)
    mix = S(V, 10, 640, "+~", 2)
    parts = [(o1, "v1", 10), (o2, "v2", 240), (o3, "v3", 470), (ns, "vn", mx)]
    gains = []
    for src, nm, x in parts:
        rv = rcv(V, x + 90, 585, nm)
        g = S(V, x, 585, "*~ 0.", 2)
        V.c(src, 0, g, 0); V.c(rv, 0, g, 1)
        gains.append(g)
    m2 = S(V, 10, 615, "+~", 2)
    m3b = S(V, 240, 615, "+~", 2)
    V.c(gains[0], 0, m2, 0); V.c(gains[1], 0, m2, 1)
    V.c(gains[2], 0, m3b, 0); V.c(gains[3], 0, m3b, 1)
    V.c(m2, 0, mix, 0); V.c(m3b, 0, mix, 1)
    rdr = rcv(V, 110, 670, "drive")
    drive = S(V, 10, 670, "*~ 1.", 2)
    V.c(mix, 0, drive, 0); V.c(rdr, 0, drive, 1)

    # contours
    def contour(x, y, a, d, s, label):
        V.comment(x, y, label, 150)
        gate = rcv(V, x, y + 25, "gate")
        ra, rd, rs = rcv(V, x + 60, y + 25, a), rcv(V, x + 150, y + 25, d), rcv(V, x + 240, y + 25, s)
        rr = rcv(V, x + 240, y + 55, "decayrel")
        pk2 = V.obj(x + 150, y + 85, "pak 0 0.", 2, 1, [""])
        V.c(rr, 0, pk2, 0); V.c(rd, 0, pk2, 1)
        rel = V.obj(x + 150, y + 110, "expr $i1 * $f2 + (1 - $i1) * 10.", 1, 1, [""], w=150)
        V.c(pk2, 0, rel, 0)
        env = S(V, x, y + 145, "adsr~ 5 300 0.5 10", 5, 4, w=140)
        V.boxes[-1]["box"]["outlettype"] = ["signal", "signal", "", ""]
        V.c(gate, 0, env, 0); V.c(ra, 0, env, 1); V.c(rd, 0, env, 2); V.c(rs, 0, env, 3); V.c(rel, 0, env, 4)
        return env

    fenv = contour(10, 710, "fa", "fd", "fs", "filter contour")
    aenv = contour(420, 710, "la", "ld", "ls", "loudness contour")

    # filter: cutoff note + contour * amount * 5 octaves + keyboard tracking + modulation
    fx = 900
    V.comment(fx, 10, "filter cutoff (semitones)", 200)
    rc = rcv(V, fx, 40, "cutoff")
    cs = S(V, fx, 70, "sig~")
    V.c(rc, 0, cs, 0)
    ram = rcv(V, fx + 110, 100, "amount")
    am = V.obj(fx + 110, 125, "* 60.", 2, 1, [""])
    V.c(ram, 0, am, 0)
    fe = S(V, fx, 155, "*~ 0.", 2)
    V.c(fenv, 0, fe, 0); V.c(am, 0, fe, 1)
    kt = S(V, fx, 185, "-~ 60.", 2)
    V.c(tune, 0, kt, 0)
    rkt = rcv(V, fx + 110, 185, "kbdtrack")
    ktg = S(V, fx, 215, "*~ 0.", 2)
    V.c(kt, 0, ktg, 0); V.c(rkt, 0, ktg, 1)
    c1 = S(V, fx, 250, "+~", 2)
    c2 = S(V, fx, 280, "+~", 2)
    c3 = S(V, fx, 310, "+~", 2)
    V.c(cs, 0, c1, 0); V.c(fe, 0, c1, 1)
    V.c(c1, 0, c2, 0); V.c(ktg, 0, c2, 1)
    V.c(c2, 0, c3, 0); V.c(fm, 0, c3, 1)
    cm = S(V, fx, 340, "mtof~")
    cc = S(V, fx, 370, "clip~ 20. 18000.", 3)
    V.c(c3, 0, cm, 0); V.c(cm, 0, cc, 0)
    remph = rcv(V, fx + 110, 400, "emph")
    flt = S(V, fx, 430, "moogladder2~", 3, 1)
    V.c(drive, 0, flt, 0); V.c(cc, 0, flt, 1); V.c(remph, 0, flt, 2)

    # amplifier
    vca = S(V, fx, 800, "*~", 2)
    V.c(flt, 0, vca, 0); V.c(aenv, 0, vca, 1)
    rm = rcv(V, fx + 110, 830, "master")
    msq = V.obj(fx + 110, 855, "pow 2.", 2, 1, [""])
    V.c(rm, 0, msq, 0)
    vol = S(V, fx, 885, "*~ 0.", 2)
    V.c(vca, 0, vol, 0); V.c(msq, 0, vol, 1)
    # reverbsc2~ (Csound 7's reverbsc with linear interpolation), dry/wet
    rfb = rcv(V, fx + 120, 915, "revfb")
    rlp = rcv(V, fx + 220, 915, "revlp")
    rev = S(V, fx, 950, "reverbsc2~ 0.85 8000", 4, 2, w=140)
    V.c(vol, 0, rev, 0); V.c(vol, 0, rev, 1); V.c(rfb, 0, rev, 2); V.c(rlp, 0, rev, 3)
    rmx = rcv(V, fx + 160, 980, "revmix")
    dry = V.obj(fx + 160, 1005, "expr 1. - $f1", 1, 1, [""])
    V.c(rmx, 0, dry, 0)
    for side, x in ((0, fx), (1, fx + 150)):
        wet = S(V, x, 1035, "*~ 0.25", 2)
        dg = S(V, x + 70, 1035, "*~ 0.75", 2)
        V.c(rev, side, wet, 0); V.c(rmx, 0, wet, 1)
        V.c(vol, 0, dg, 0); V.c(dry, 0, dg, 1)
        sm = S(V, x, 1065, "+~", 2)
        V.c(wet, 0, sm, 0); V.c(dg, 0, sm, 1)
        V.obj(x, 1095, "send~ %smd-out%s" % (PREFIX, "LR"[side]), 1, 0, [])
        V.c(sm, 0, V.boxes[-1]["box"]["id"], 0)
    V.rect = [100, 100, 1250, 1000]
    return V


# ------------------------------------------------------------ front panel
def front():
    M = Patcher([30, 40, 1320, 860])
    dark = [0.16, 0.16, 0.17, 1.0]
    wood = [0.33, 0.21, 0.12, 1.0]
    M.box("panel", 0, 0, 1320, 860, None, 1, 0, bgcolor=wood, background=1, mode=0)
    M.box("comment", 20, 10, 600, 34, "mood", 1, 0, fontsize=26.0, fontface=1,
          textcolor=[0.96, 0.9, 0.78, 1.0])
    M.box("comment", 20, 46, 1200, 20, "three squinewave~ oscillators, noise~ / pink~, moogladder2~ (Csound's "
          "Moog ladder), two contours and glide. Needs the max/ folder in the search path. "
          "Click the speaker, pick a preset, play the keyboard, MIDI or the sequencer.",
          1, 0, fontsize=11.0, textcolor=[0.96, 0.9, 0.78, 1.0])

    # controllers
    panel(M, 20, 80, 190, 330, "CONTROLLERS", dark)
    for i, nm in enumerate(["tune", "glide", "modmix", "wheel"]):
        control(M, 35, 120 + i*55, nm)
    control(M, 120, 285, "oscmod")
    control(M, 120, 340, "filtmod")

    # oscillator bank
    panel(M, 220, 80, 360, 330, "OSCILLATOR BANK", dark)
    for n, y in ((1, 110), (2, 210), (3, 310)):
        M.box("comment", 235, y, 60, 20, "osc %d" % n, 1, 0, fontface=1, textcolor=[1, 0.8, 0.4, 1])
        control(M, 235, y + 20, "o%doct" % n)
        if n > 1:
            control(M, 320, y + 20, "o%ddet" % n)
        control(M, 410, y + 20, "o%dwave" % n)
    control(M, 320, 130, "sync")
    control(M, 530, 330, "o3kbd")

    # mixer
    panel(M, 590, 80, 230, 330, "MIXER", dark)
    for i, nm in enumerate(["v1", "v2", "v3", "vn"]):
        control(M, 605, 120 + i*55, nm)
    control(M, 700, 285, "noisetype")
    control(M, 700, 120, "drive")

    # modifiers
    panel(M, 830, 80, 470, 330, "MODIFIERS", dark)
    M.box("comment", 845, 105, 200, 20, "filter", 1, 0, fontface=1, textcolor=[1, 0.8, 0.4, 1])
    for i, nm in enumerate(["cutoff", "emph", "amount", "kbdtrack"]):
        control(M, 845 + i*110, 125, nm)
    M.box("comment", 845, 190, 200, 20, "filter contour", 1, 0, fontface=1, textcolor=[1, 0.8, 0.4, 1])
    for i, nm in enumerate(["fa", "fd", "fs"]):
        control(M, 845 + i*110, 210, nm)
    M.box("comment", 845, 275, 200, 20, "loudness contour", 1, 0, fontface=1, textcolor=[1, 0.8, 0.4, 1])
    for i, nm in enumerate(["la", "ld", "ls"]):
        control(M, 845 + i*110, 295, nm)
    control(M, 1175, 295, "decayrel")
    M.box("comment", 845, 360, 440, 40, "cutoff is a note number: 60 = 262 Hz; the contour opens it by up to "
          "5 octaves, kbd track 1 follows the keyboard", 1, 0, fontsize=10.0, textcolor=[0.8, 0.8, 0.8, 1])

    # presets
    panel(M, 20, 420, 560, 150, "PRESETS", dark)
    for i, (nm, msg) in enumerate(PRESETS):
        col, row = i % 4, i // 4
        M.box("message", 35 + col*135, 455 + row*40, 125, 22, nm, 2, 1, [""])
        bid = M.boxes[-1]["box"]["id"]
        W["preset%d" % i] = bid
        m = hidden(M, M.msg(35 + col*135, 480 + row*40, msg, 100))
        M.c(bid, 0, m, 0)
        if i == 0:
            first = bid
    lb = hidden(M, M.obj(470, 530, "loadbang", 1, 1, ["bang"]))
    dl = hidden(M, M.obj(470, 550, "delay 100", 2, 1, ["bang"]))
    M.c(lb, 0, dl, 0); M.c(dl, 0, first, 0)

    # keyboard and MIDI
    panel(M, 20, 580, 780, 260, "KEYBOARD", dark)
    kb = M.box("kslider", 35, 620, 560, 60, None, 2, 2, ["int", "int"], parameter_enable=0,
               range=49, offset=36)
    W["keyboard"] = kb
    M.box("comment", 610, 615, 180, 60, "click a key: a note of the gate length below. MIDI input "
          "plays too (last note priority)", 1, 0, fontsize=10.0, textcolor=[0.85, 0.85, 0.85, 1])
    # click: note on now, note off after gatems
    kt = hidden(M, M.obj(35, 690, "t i i", 1, 2, ["int", "int"]))
    kon = hidden(M, M.msg(35, 715, "$1 100"))
    kpipe = hidden(M, M.obj(100, 715, "pipe 300", 2, 1, ["int"]))
    koff = hidden(M, M.msg(100, 740, "$1 0"))
    M.c(kb, 0, kt, 0); M.c(kt, 0, kpipe, 0); M.c(kt, 1, kon, 0); M.c(kpipe, 0, koff, 0)
    midi = hidden(M, M.obj(250, 690, "midiin", 1, 1, ["int"]))
    mp = hidden(M, M.obj(250, 715, "midiparse", 1, 8, [""]*8))
    M.c(midi, 0, mp, 0)
    # the mono logic: note off only for the sounding note
    rev = hidden(M, M.obj(400, 690, "zl.rev", 2, 2, ["", ""]))
    for src in (kon, koff):
        M.c(src, 0, rev, 0)
    M.c(mp, 0, rev, 0)
    rt = hidden(M, M.obj(400, 715, "route 0", 1, 2, ["", ""]))
    M.c(rev, 0, rt, 0)
    eq = hidden(M, M.obj(400, 740, "== 0", 2, 1, ["int"]))
    sel = hidden(M, M.obj(400, 765, "sel 1", 2, 2, ["bang", ""]))
    zero = hidden(M, M.msg(400, 790, "0"))
    M.c(rt, 0, eq, 0); M.c(eq, 0, sel, 0); M.c(sel, 0, zero, 0)
    up = hidden(M, M.obj(480, 740, "unpack 0 0", 1, 2, ["int", "int"]))
    M.c(rt, 1, up, 0)
    tn = hidden(M, M.obj(560, 765, "t i i", 1, 2, ["int", "int"]))
    M.c(up, 1, tn, 0); M.c(tn, 0, eq, 1)
    sn = hidden(M, M.obj(560, 790, "s mdv-note", 1, 0, []))
    M.c(tn, 1, sn, 0)
    one = hidden(M, M.msg(480, 790, "1"))
    M.c(up, 0, one, 0)
    sg = hidden(M, M.obj(480, 815, "s mdv-gate", 1, 0, []))
    M.c(one, 0, sg, 0); M.c(zero, 0, sg, 0)

    # sequencer
    M.box("comment", 35, 750, 100, 20, "sequencer", 1, 0, fontface=1, textcolor=[1, 0.8, 0.4, 1])
    seq_on = M.box("toggle", 35, 775, 24, 24, None, 1, 1, ["int"], parameter_enable=0)
    W["seq"] = seq_on
    control(M, 75, 760, "tempo")
    control(M, 165, 760, "gatelen")
    metro = hidden(M, M.obj(35, 805, "metro 160", 2, 1, ["bang"]))
    rtempo = hidden(M, M.obj(100, 805, "r mdv-tempo", 0, 1, [""]))
    M.c(seq_on, 0, metro, 0); M.c(rtempo, 0, metro, 1)
    cnt = hidden(M, M.obj(35, 830, "counter 0 15", 3, 4, ["int", "", "", "int"]))
    M.c(metro, 0, cnt, 0)
    look = hidden(M, M.obj(150, 830, "zl.lookup", 2, 2, ["", ""]))
    M.c(cnt, 0, look, 0)
    st = hidden(M, M.obj(250, 830, "t i i", 1, 2, ["int", "int"]))
    M.c(look, 0, st, 0)
    son = hidden(M, M.msg(330, 830, "$1 100"))
    M.c(st, 1, son, 0); M.c(son, 0, rev, 0)
    gl = hidden(M, M.obj(250, 855, "pak 160 50", 2, 1, [""]))
    rg = hidden(M, M.obj(330, 805, "r mdv-gatelen", 0, 1, [""]))
    M.c(rtempo, 0, gl, 0); M.c(rg, 0, gl, 1)
    gx = hidden(M, M.obj(250, 880, "expr $f1 * $f2 / 100.", 1, 1, [""]))
    M.c(gl, 0, gx, 0)
    spipe = hidden(M, M.obj(420, 855, "pipe 80", 2, 1, ["int"]))
    M.c(st, 0, spipe, 0); M.c(gx, 0, spipe, 1)
    soff = hidden(M, M.msg(420, 880, "$1 0"))
    M.c(spipe, 0, soff, 0); M.c(soff, 0, rev, 0)
    M.box("comment", 260, 760, 90, 20, "pattern", 1, 0, fontsize=11.0, textcolor=[0.9, 0.9, 0.9, 1])
    for i, (nm, notes) in enumerate(PATTERNS):
        M.box("message", 260 + i*75, 780, 70, 22, nm, 2, 1, [""])
        bid = M.boxes[-1]["box"]["id"]
        W["pattern%d" % i] = bid
        pm = hidden(M, M.msg(260 + i*75, 805, notes, 60))
        M.c(bid, 0, pm, 0); M.c(pm, 0, look, 1)
        if i == 0:
            firstpat = pm
    M.c(lb, 0, firstpat, 0)
    tlb = hidden(M, M.msg(520, 530, "; md-tempo 160; md-gatelen 50"))
    M.c(lb, 0, tlb, 0)

    # output
    panel(M, 810, 580, 490, 260, "OUTPUT", dark)
    control(M, 825, 615, "master")
    for i, nm in enumerate(["revmix", "revfb", "revlp"]):
        control(M, 825 + (i % 2)*80, 700 + (i // 2)*60 if i < 2 else 760, nm)
    routl = M.obj(900, 615, "receive~ md-outL", 1, 1, ["signal"])
    routr = M.obj(900, 640, "receive~ md-outR", 1, 1, ["signal"])
    dac = M.box("ezdac~", 1000, 760, 50, 50, None, 2, 0)
    M.c(routl, 0, dac, 0); M.c(routr, 0, dac, 1)
    sc = M.box("scope~", 1060, 615, 220, 205, None, 2, 0, bgcolor=[0.05, 0.08, 0.05, 1],
               fgcolor=[0.4, 1.0, 0.5, 1], calccount=32)
    M.c(routl, 0, sc, 0)
    W["dac"], W["scope"] = dac, sc

    # the voice
    M.box("newobj", 1180, 20, 80, 22, "p voice", 0, 0, [], patcher=voice().patcher())
    M.box("comment", 1060, 20, 120, 20, "the DSP is in", 1, 0, fontsize=10.0, textcolor=[0.96, 0.9, 0.78, 1])
    M.rect = [30, 40, 1340, 900]
    presentation(M)
    return M


# ------------------------------------------------------------ presentation: a Model D
WOOD = [0.42, 0.26, 0.14, 1.0]
BLACK = [0.07, 0.07, 0.075, 1.0]
CREAM = [0.93, 0.9, 0.82, 1.0]
ORANGE = [1.0, 0.52, 0.1, 1.0]
BLUE = [0.35, 0.6, 0.95, 1.0]
PX = 1450          # patching x of the presentation only objects
py_next = [20]


def pos():
    py_next[0] += 30
    return PX, py_next[0]


def show(M, bid, rect):
    for b in M.boxes:
        if b["box"]["id"] == bid:
            b["box"]["presentation"] = 1
            b["box"]["presentation_rect"] = list(rect)
            b["box"].pop("hidden", None)
    return bid


def pbox(M, maxclass, rect, text=None, nin=1, nout=0, otype=None, **extra):
    x, y = pos()
    bid = M.box(maxclass, x, y, rect[2], rect[3], text, nin, nout, otype, **extra)
    return show(M, bid, rect)


def ptext(M, x, y, w, text, size=10.0, color=CREAM, bold=0, center=1, font="Arial"):
    return pbox(M, "comment", (x, y, w, size + 10), text, 1, 0, None, fontsize=size, fontface=bold,
                textcolor=color, textjustification=center, fontname=font)


def knob(M, name, x, y, d=46, maxclass="dial", h=None):
    """a dial (or slider) in presentation, kept in step with the control's number box"""
    label, lo, hi, _ = PARAMS[name]
    integer = name.endswith("oct")
    steps = int(hi - lo) if integer else 1000
    mult = 1 if integer else (hi - lo) / 1000.0
    rect = (x, y, d, h or d)
    if maxclass == "dial":
        pbox(M, "panel", (x - 7, y - 7, d + 14, d + 14), None, 1, 0, None, bgcolor=[0.78, 0.76, 0.72, 1],
             rounded=int((d + 14)/2), background=0, mode=0, border=0)
        ptext(M, x - 22, y + d + 2, 26, "%g" % lo, 8.0, [0.75, 0.75, 0.75, 1])
        ptext(M, x + d - 4, y + d + 2, 30, "%g" % hi, 8.0, [0.75, 0.75, 0.75, 1])
        extra = dict(needlecolor=CREAM, outlinecolor=[0.35, 0.35, 0.35, 1], bgcolor=BLACK,
                     fgcolor=[0.2, 0.2, 0.2, 1], thickness=45.0, degrees=300)
    else:
        extra = dict(bgcolor=[0.15, 0.15, 0.15, 1], knobcolor=CREAM, knobshape=0)
    ptext(M, x - 25, y - 22, d + 50, label.upper(), 9.0)
    ui = pbox(M, maxclass, rect, None, 1, 1, ["float" if not integer else "int"], parameter_enable=0,
              size=steps, mult=mult, min=lo, floatoutput=0 if integer else 1, **extra)
    fl = CTL[name]
    px, py = pos()
    ex = M.obj(px + 60, py, "expr ($f1 - %g) / %g" % (lo, mult), 1, 1, [""], w=150)
    px, py = pos()
    st = M.obj(px + 60, py, "prepend set", 1, 1, [""])
    M.c(ui, 0, fl, 0)
    M.c(fl, 0, ex, 0); M.c(ex, 0, st, 0); M.c(st, 0, ui, 0)


def rocker(M, name, x, y, label, color=ORANGE):
    ptext(M, x - 30, y - 18, 84, label.upper(), 9.0)
    show(M, CTL[name], (x + 3, y, 18, 18))
    for b in M.boxes:
        if b["box"]["id"] == CTL[name]:
            b["box"].update(checkedcolor=color, uncheckedcolor=[0.35, 0.35, 0.35, 1], bgcolor=[0.9, 0.9, 0.88, 1])


def menu(M, name, x, y, w=92):
    ptext(M, x, y - 18, w, "WAVEFORM", 9.0)
    show(M, CTL[name], (x, y, w, 22))
    for b in M.boxes:
        if b["box"]["id"] == CTL[name]:
            b["box"].update(bgcolor=[0.13, 0.13, 0.13, 1], textcolor=CREAM, fontsize=11.0)


def button(M, key, rect, color=[0.2, 0.2, 0.21, 1]):
    show(M, W[key], rect)
    for b in M.boxes:
        if b["box"]["id"] == W[key]:
            b["box"].update(bgcolor=color, bgfillcolor_type="color", bgfillcolor_color=color,
                            textcolor=CREAM, fontsize=11.0, textjustification=1)


def presentation(M):
    # cabinet: wood, the black front panel, the keybed
    pbox(M, "panel", (0, 0, 1400, 790), None, 1, 0, None, bgcolor=WOOD, background=1, mode=0, border=0)
    for x in (8, 1386):
        pbox(M, "panel", (x, 0, 6, 790), None, 1, 0, None, bgcolor=[0.32, 0.19, 0.1, 1], background=1, border=0)
    pbox(M, "panel", (30, 15, 1340, 405), None, 1, 0, None, bgcolor=BLACK, background=1, rounded=6, border=0)
    pbox(M, "panel", (30, 470, 1340, 305), None, 1, 0, None, bgcolor=BLACK, background=1, rounded=6, border=0)
    # section lines and names, as the strip under the knobs of the original
    for x in (230, 590, 800, 1150):
        pbox(M, "panel", (x, 30, 2, 345), None, 1, 0, None, bgcolor=[0.55, 0.55, 0.52, 1], background=1, border=0)
    pbox(M, "panel", (40, 355, 1320, 2), None, 1, 0, None, bgcolor=[0.55, 0.55, 0.52, 1], background=1, border=0)
    for x0, x1, t in ((30, 230, "CONTROLLERS"), (230, 590, "OSCILLATOR BANK"), (590, 800, "MIXER"),
                      (800, 1150, "MODIFIERS"), (1150, 1370, "OUTPUT")):
        ptext(M, x0, 368, x1 - x0, t, 14.0, CREAM, 1)
    ptext(M, 40, 425, 600, "mood", 30.0, CREAM, 3, 0, "Georgia")
    ptext(M, 640, 437, 720, "squinewave~  +  moogladder2~  +  reverbsc2~   -   Csound opcodes in Max", 12.0,
          [0.93, 0.85, 0.7, 1], 0, 2)

    # CONTROLLERS
    knob(M, "tune", 60, 60)
    knob(M, "glide", 145, 60)
    knob(M, "modmix", 100, 160)
    rocker(M, "oscmod", 65, 280, "osc mod")
    rocker(M, "filtmod", 145, 280, "filter mod")

    # OSCILLATOR BANK
    for n, y in ((1, 60), (2, 160), (3, 260)):
        ptext(M, 238, y - 38, 60, "OSC %d" % n, 10.0, ORANGE, 1, 0)
        knob(M, "o%doct" % n, 255, y)
        if n > 1:
            knob(M, "o%ddet" % n, 345, y)
        menu(M, "o%dwave" % n, 430, y + 12, 95 if n == 3 else 140)
    rocker(M, "sync", 345, 72, "sync 2>1")
    rocker(M, "o3kbd", 550, 272, "kbd", BLUE)

    # MIXER
    for nm, y in (("v1", 60), ("v2", 160), ("v3", 260)):
        knob(M, nm, 625, y)
    knob(M, "vn", 725, 60)
    rocker(M, "noisetype", 725, 172, "pink", BLUE)
    knob(M, "drive", 725, 260)

    # MODIFIERS
    ptext(M, 810, 22, 200, "FILTER", 10.0, ORANGE, 1, 0)
    for i, nm in enumerate(["cutoff", "emph", "amount", "kbdtrack"]):
        knob(M, nm, 835 + i*80, 60)
    ptext(M, 810, 122, 200, "FILTER CONTOUR", 10.0, ORANGE, 1, 0)
    for i, nm in enumerate(["fa", "fd", "fs"]):
        knob(M, nm, 835 + i*80, 160)
    ptext(M, 810, 222, 200, "LOUDNESS CONTOUR", 10.0, ORANGE, 1, 0)
    for i, nm in enumerate(["la", "ld", "ls"]):
        knob(M, nm, 835 + i*80, 260)
    rocker(M, "decayrel", 1080, 272, "decay")

    # OUTPUT
    knob(M, "master", 1185, 60)
    knob(M, "revmix", 1290, 60)
    knob(M, "revfb", 1185, 160)
    knob(M, "revlp", 1290, 160)
    show(M, W["dac"], (1175, 255, 60, 60))
    show(M, W["scope"], (1250, 250, 105, 80))

    # KEYBED: mod wheel, keyboard, presets, sequencer
    knob(M, "wheel", 62, 530, 30, "slider", 170)
    ptext(M, 40, 710, 70, "(wheel)", 8.0, [0.75, 0.75, 0.75, 1])
    show(M, W["keyboard"], (125, 505, 870, 250))
    for b in M.boxes:
        if b["box"]["id"] == W["keyboard"]:
            b["box"].update(whitekeycolor=[0.97, 0.96, 0.92, 1], blackkeycolor=[0.05, 0.05, 0.05, 1],
                            hkeycolor=ORANGE)
    ptext(M, 1015, 480, 340, "PRESETS", 12.0, ORANGE, 1, 0)
    for i in range(len(PRESETS)):
        button(M, "preset%d" % i, (1015 + (i % 2)*172, 505 + (i // 2)*32, 165, 26))
    ptext(M, 1015, 640, 340, "SEQUENCER", 12.0, ORANGE, 1, 0)
    show(M, W["seq"], (1015, 668, 24, 24))
    for b in M.boxes:
        if b["box"]["id"] == W["seq"]:
            b["box"].update(checkedcolor=ORANGE, bgcolor=[0.9, 0.9, 0.88, 1])
    for i in range(len(PATTERNS)):
        button(M, "pattern%d" % i, (1050 + i*75, 668, 70, 24), [0.25, 0.18, 0.1, 1])
    knob(M, "tempo", 1070, 722, 34)
    knob(M, "gatelen", 1160, 722, 34)


if __name__ == "__main__":
    import json
    d = {"patcher": front().patcher()}
    d["patcher"]["openinpresentation"] = 1
    d["patcher"]["rect"] = [30, 40, 1430, 870]
    json.dump(d, open(os.path.join(here, "mood.maxpat"), "w"), indent=1)
    print("ok mood.maxpat")
