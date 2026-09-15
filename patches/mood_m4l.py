# generates mood.amxd: the synth of mood.py as a Max for Live
# instrument, live.* objects only, played by the MIDI of the Live track.
# The voice is the same subpatch, with ---names local to each device.
# Needs the max/ folder in Max's search path (squinewave~,
# moogladder2~, reverbsc2~).
import json, os, struct, sys

here = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, here)
sys.path.insert(0, os.path.join(here, "..", "max"))
import mood
from maxpatch import Patcher

mood.PREFIX = "---"
P = "---"
WAVES = ["Triangle", "Shark", "Saw", "Square", "Wide Pulse", "Narrow Pulse"]

TIME, HZ, SEMI, FLOAT, INT = 2, 3, 7, 1, 0
# name: (long name, short name, min, max, initial, unit style, exponent)
DIALS = {
    "tune": ("Tune", "Tune", -2, 2, 0, SEMI, 1), "glide": ("Glide", "Glide", 0, 2000, 0, TIME, 3),
    "modmix": ("Mod Mix", "Osc3>Noise", 0, 1, 0, FLOAT, 1), "wheel": ("Mod Wheel", "Wheel", 0, 1, 0, FLOAT, 1),
    "o1oct": ("Osc 1 Octave", "Oct 1", -2, 2, 0, INT, 1),
    "o2oct": ("Osc 2 Octave", "Oct 2", -2, 2, 0, INT, 1), "o2det": ("Osc 2 Detune", "Det 2", -7, 7, 0.08, SEMI, 1),
    "o3oct": ("Osc 3 Octave", "Oct 3", -6, 2, -1, INT, 1), "o3det": ("Osc 3 Detune", "Det 3", -7, 7, -0.06, SEMI, 1),
    "v1": ("Osc 1 Level", "Osc 1", 0, 1, 0.8, FLOAT, 1), "v2": ("Osc 2 Level", "Osc 2", 0, 1, 0.7, FLOAT, 1),
    "v3": ("Osc 3 Level", "Osc 3", 0, 1, 0.5, FLOAT, 1), "vn": ("Noise Level", "Noise", 0, 1, 0, FLOAT, 1),
    "drive": ("Drive", "Drive", 0.1, 4, 1.5, FLOAT, 1),
    "cutoff": ("Cutoff", "Cutoff", 20, 18000, 82, HZ, 3), "emph": ("Emphasis", "Emphasis", 0, 1, 0.4, FLOAT, 1),
    "amount": ("Contour Amount", "Contour", 0, 1, 0.6, FLOAT, 1), "kbdtrack": ("Keyboard Track", "Kbd Trk", 0, 1, 0.33, FLOAT, 1),
    "fa": ("Filter Attack", "F Attack", 1, 5000, 5, TIME, 3), "fd": ("Filter Decay", "F Decay", 5, 5000, 300, TIME, 3),
    "fs": ("Filter Sustain", "F Sustain", 0, 1, 0.2, FLOAT, 1),
    "la": ("Loudness Attack", "L Attack", 1, 5000, 3, TIME, 3), "ld": ("Loudness Decay", "L Decay", 5, 5000, 400, TIME, 3),
    "ls": ("Loudness Sustain", "L Sustain", 0, 1, 0.8, FLOAT, 1),
    "revmix": ("Reverb Mix", "Reverb", 0, 1, 0.25, FLOAT, 1), "revfb": ("Reverb Size", "Size", 0.5, 0.99, 0.85, FLOAT, 1),
    "revlp": ("Reverb Tone", "Tone", 500, 16000, 8000, HZ, 3),
}
# name: (long name, short name, items, initial, object)
ENUMS = {
    "oscmod": ("Osc Modulation", "Osc Mod", ["off", "on"], 0, "live.text"),
    "filtmod": ("Filter Modulation", "Filt Mod", ["off", "on"], 0, "live.text"),
    "sync": ("Osc 2 Sync", "Sync", ["off", "on"], 0, "live.text"),
    "o3kbd": ("Osc 3 Keyboard", "Osc3 Kbd", ["off", "on"], 1, "live.text"),
    "decayrel": ("Decay on Release", "Release", ["off", "on"], 1, "live.text"),
    "noisetype": ("Noise Color", "Noise", ["White", "Pink"], 0, "live.tab"),
    "o1wave": ("Osc 1 Waveform", "Wave 1", WAVES, 2, "live.menu"),
    "o2wave": ("Osc 2 Waveform", "Wave 2", WAVES, 2, "live.menu"),
    "o3wave": ("Osc 3 Waveform", "Wave 3", WAVES, 3, "live.menu"),
}

PARAMETERS = {}
patch_y = [20]


def ploc(h=22):
    """patching position of the next ui object, in a column on the right"""
    patch_y[0] += h + 40
    return 1000, patch_y[0]


def valueof(long, short, **kw):
    v = {"parameter_longname": long, "parameter_shortname": short, "parameter_initial_enable": 1}
    v.update(kw)
    return {"valueof": v}


def dial(M, name, x, y, w=44, h=48):
    long, short, lo, hi, init, unit, expo = DIALS[name]
    px, py = ploc(h)
    extra = {}
    if expo != 1:
        extra["parameter_exponent"] = float(expo)
    bid = M.box("live.dial", px, py, w, h, None, 1, 2, ["", "float"], parameter_enable=1, varname=long,
                presentation=1, presentation_rect=[x, y, w, h], fontsize=9.0,
                saved_attribute_attributes=valueof(long, short, parameter_mmin=float(lo), parameter_mmax=float(hi),
                                                   parameter_initial=[float(init)],
                                                   parameter_type=1 if unit == INT else 0,
                                                   parameter_unitstyle=unit, **extra))
    PARAMETERS[bid] = [long, short, 0]
    return bid


def enum(M, name, x, y, w, h):
    long, short, items, init, cls = ENUMS[name]
    px, py = ploc(h)
    attrs = dict(parameter_enable=1, varname=long, presentation=1, presentation_rect=[x, y, w, h], fontsize=9.0,
                 saved_attribute_attributes=valueof(long, short, parameter_enum=items, parameter_mmax=len(items) - 1,
                                                    parameter_initial=[init], parameter_type=2))
    if cls == "live.text":
        bid = M.box(cls, px, py, w, h, short, 1, 2, ["", ""], texton=short, mode=1, **attrs)
    elif cls == "live.tab":
        bid = M.box(cls, px, py, w, h, None, 1, 3, ["", "", "float"], num_lines_patching=1,
                    num_lines_presentation=1, **attrs)
    else:
        bid = M.box(cls, px, py, w, h, None, 1, 3, ["", "", "float"], **attrs)
    PARAMETERS[bid] = [long, short, 0]
    return bid


def title(M, x, y, w, text):
    px, py = ploc(16)
    return M.box("live.comment", px, py, w, 16, text, 0, 0, presentation=1, presentation_rect=[x, y, w, 16],
                 fontsize=10.0, fontface=1, textjustification=0)


def line(M, x):
    px, py = ploc(10)
    return M.box("live.line", px, py, 10, 150, None, 1, 0, presentation=1, presentation_rect=[x, 4, 6, 160],
                 justification=1)


def to_voice(M, ui, name, conv=None):
    """ui -> [conv] -> [s ---mdv-name]"""
    b = [bb["box"] for bb in M.boxes if bb["box"]["id"] == ui][0]
    x, y = b["patching_rect"][0] + 160, b["patching_rect"][1]
    src = ui
    if conv:
        c = M.obj(x, y, conv, 2, 1, [""])
        M.c(src, 0, c, 0)
        src, x = c, x + 110
    s = M.obj(x, y, "s %smdv-%s" % (P, name), 1, 0, [])
    M.c(src, 0, s, 0)
    return src


def device():
    M = Patcher([60, 60, 1500, 900])
    M.comment(20, 10, "mood for Max for Live: squinewave~ x3, moogladder2~, reverbsc2~. "
              "Needs the max/ folder in the search path. The DSP is in [p voice].", 900)

    # MIDI from the track: last note priority, pitch bend, mod wheel (CC 1)
    mi = M.obj(20, 60, "midiin", 1, 1, ["int"])
    mp = M.obj(20, 90, "midiparse", 1, 8, [""]*8)
    M.c(mi, 0, mp, 0)
    rev = M.obj(20, 130, "zl.rev", 2, 2, ["", ""])
    M.c(mp, 0, rev, 0)
    rt = M.obj(20, 160, "route 0", 1, 2, ["", ""])
    M.c(rev, 0, rt, 0)
    eq = M.obj(20, 190, "== 0", 2, 1, ["int"])
    sel = M.obj(20, 220, "sel 1", 2, 2, ["bang", ""])
    zero = M.msg(20, 250, "0")
    M.c(rt, 0, eq, 0); M.c(eq, 0, sel, 0); M.c(sel, 0, zero, 0)
    up = M.obj(120, 190, "unpack 0 0", 1, 2, ["int", "int"])
    M.c(rt, 1, up, 0)
    tn = M.obj(200, 220, "t i i", 1, 2, ["int", "int"])
    M.c(up, 1, tn, 0); M.c(tn, 0, eq, 1)
    sn = M.obj(200, 250, "s %smdv-note" % P, 1, 0, [])
    M.c(tn, 1, sn, 0)
    one = M.msg(120, 250, "1")
    M.c(up, 0, one, 0)
    sg = M.obj(120, 280, "s %smdv-gate" % P, 1, 0, [])
    M.c(one, 0, sg, 0); M.c(zero, 0, sg, 0)
    M.comment(300, 130, "note on: pitch, then gate 1; note off only for the sounding note", 300)

    # the voice needs master at 1: the level is live.gain~
    lb = M.obj(300, 60, "loadbang", 1, 1, ["bang"])
    m1 = M.msg(300, 90, "1")
    ms = M.obj(300, 120, "s %smdv-master" % P, 1, 0, [])
    M.c(lb, 0, m1, 0); M.c(m1, 0, ms, 0)

    # ------------------------------------------------ the front panel (presentation)
    ui = {}
    # MODULATION
    title(M, 6, 2, 130, "CONTROLLERS")
    ui["tune"] = dial(M, "tune", 6, 18)
    ui["glide"] = dial(M, "glide", 50, 18)
    ui["modmix"] = dial(M, "modmix", 94, 18)
    ui["wheel"] = dial(M, "wheel", 6, 88)
    ui["oscmod"] = enum(M, "oscmod", 54, 98, 44, 16)
    ui["filtmod"] = enum(M, "filtmod", 54, 120, 44, 16)
    line(M, 140)

    # OSCILLATOR BANK
    title(M, 148, 2, 190, "OSCILLATOR BANK")
    for n, x in ((1, 150), (2, 215), (3, 280)):
        ui["o%doct" % n] = dial(M, "o%doct" % n, x + 8, 18)
        if n > 1:
            ui["o%ddet" % n] = dial(M, "o%ddet" % n, x + 8, 72)
        ui["o%dwave" % n] = enum(M, "o%dwave" % n, x, 126, 60, 15)
    ui["sync"] = enum(M, "sync", 222, 146, 46, 15)
    ui["o3kbd"] = enum(M, "o3kbd", 284, 146, 52, 15)
    title(M, 158, 80, 44, "OSC 1")
    line(M, 342)

    # MIXER
    title(M, 350, 2, 140, "MIXER")
    for nm, x in (("v1", 350), ("v2", 394), ("v3", 438)):
        ui[nm] = dial(M, nm, x, 18)
    ui["vn"] = dial(M, "vn", 350, 88)
    ui["drive"] = dial(M, "drive", 394, 88)
    ui["noisetype"] = enum(M, "noisetype", 440, 104, 46, 30)
    line(M, 490)

    # FILTER
    title(M, 498, 2, 100, "FILTER")
    ui["cutoff"] = dial(M, "cutoff", 498, 18)
    ui["emph"] = dial(M, "emph", 542, 18)
    ui["amount"] = dial(M, "amount", 498, 88)
    ui["kbdtrack"] = dial(M, "kbdtrack", 542, 88)
    line(M, 590)

    # CONTOURS
    title(M, 598, 2, 190, "FILTER / LOUDNESS CONTOURS")
    for i, nm in enumerate(["fa", "fd", "fs"]):
        ui[nm] = dial(M, nm, 598 + i*44, 18)
    for i, nm in enumerate(["la", "ld", "ls"]):
        ui[nm] = dial(M, nm, 598 + i*44, 88)
    ui["decayrel"] = enum(M, "decayrel", 734, 70, 50, 16)
    line(M, 790)

    # OUTPUT
    title(M, 798, 2, 95, "OUTPUT")
    ui["revmix"] = dial(M, "revmix", 798, 18)
    ui["revfb"] = dial(M, "revfb", 842, 18)
    ui["revlp"] = dial(M, "revlp", 798, 88)
    px, py = ploc(60)
    scope = M.box("live.scope~", px, py, 80, 60, None, 2, 1, ["bang"], presentation=1,
                  presentation_rect=[842, 96, 48, 60])
    px, py = ploc(140)
    gain = M.box("live.gain~", px, py, 40, 140, None, 2, 5, ["signal", "signal", "", "float", "list"],
                 parameter_enable=1, varname="Volume", presentation=1, presentation_rect=[898, 14, 44, 146],
                 fontsize=9.0, saved_attribute_attributes=valueof("Volume", "Volume", parameter_mmin=-70.0,
                                                                    parameter_mmax=6.0, parameter_initial=[-6.0],
                                                                    parameter_type=0, parameter_unitstyle=4))
    PARAMETERS[gain] = ["Volume", "Volume", 0]

    # ui -> voice
    for nm, u in ui.items():
        if nm == "cutoff":
            to_voice(M, u, nm, "ftom")
        elif nm == "tune":
            continue
        else:
            to_voice(M, u, nm)
    # tune + pitch bend (+-2 semitones)
    b = [bb["box"] for bb in M.boxes if bb["box"]["id"] == ui["tune"]][0]
    tx, ty = b["patching_rect"][0] + 160, b["patching_rect"][1]
    bend = M.obj(20, 330, "expr ($f1 - 64.) / 64. * 2.", 1, 1, [""], w=170)
    M.c(mp, 5, bend, 0)
    pk = M.obj(tx, ty, "pak 0. 0.", 2, 1, [""])
    M.c(ui["tune"], 0, pk, 0); M.c(bend, 0, pk, 1)
    tsum = M.obj(tx + 80, ty, "expr $f1 + $f2", 1, 1, [""])
    M.c(pk, 0, tsum, 0)
    ts = M.obj(tx + 180, ty, "s %smdv-tune" % P, 1, 0, [])
    M.c(tsum, 0, ts, 0)
    # mod wheel CC 1 moves the Wheel dial
    cc = M.obj(20, 360, "route 1", 1, 2, ["", ""])
    M.c(mp, 2, cc, 0)
    cn = M.obj(20, 390, "/ 127.", 2, 1, ["float"])
    M.c(cc, 0, cn, 0); M.c(cn, 0, ui["wheel"], 0)

    # the voice and the output
    M.box("newobj", 300, 400, 80, 22, "p voice", 0, 0, [], patcher=mood.voice().patcher())
    rl = M.obj(300, 450, "receive~ %smd-outL" % P, 1, 1, ["signal"])
    rr = M.obj(450, 450, "receive~ %smd-outR" % P, 1, 1, ["signal"])
    M.c(rl, 0, gain, 0); M.c(rr, 0, gain, 1)
    M.c(rl, 0, scope, 0)
    out = M.obj(300, 520, "plugout~", 2, 2, ["signal", "signal"])
    M.c(gain, 0, out, 0); M.c(gain, 1, out, 1)
    return M


if __name__ == "__main__":
    M = device()
    p = M.patcher()
    p.update(openinpresentation=1, devicewidth=950.0, rect=[60, 60, 1500, 900],
             parameters=dict(PARAMETERS, inherited_shortname=1),
             description="mooD inspired monosynth: squinewave~, moogladder2~, reverbsc2~ (csoundport)")
    js = (json.dumps({"patcher": p}, indent=1) + "\n").encode() + b"\x00"
    data = (b"ampf" + struct.pack("<I", 4) + b"iiii" + b"meta" + struct.pack("<I", 4) + struct.pack("<I", 0) +
            b"ptch" + struct.pack("<I", len(js)) + js)
    open(os.path.join(here, "mood.amxd"), "wb").write(data)
    print("ok mood.amxd", len(PARAMETERS), "parameters")
