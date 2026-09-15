# tiny Max patcher writer shared by the help generators
import json, math


class Patcher:
    def __init__(self, rect):
        self.boxes, self.lines, self.rect = [], [], rect

    def box(self, maxclass, x, y, w, h, text=None, nin=1, nout=0, otype=None, **extra):
        bid = "obj-%d" % (len(self.boxes) + 1)
        b = {"id": bid, "maxclass": maxclass, "numinlets": nin, "numoutlets": nout,
             "patching_rect": [x, y, w, h]}
        if otype is not None:
            b["outlettype"] = otype
        if text is not None:
            b["text"] = text
        b.update(extra)
        self.boxes.append({"box": b})
        return bid

    def obj(self, x, y, text, nin=1, nout=1, otype=None, w=None):
        w = w or max(40, 7*len(text) + 16)
        return self.box("newobj", x, y, w, 22, text, nin, nout, otype if otype is not None else [""]*nout)

    def msg(self, x, y, text, w=None):
        w = w or min(300, max(40, 7*len(text) + 16))
        lines = max(1, math.ceil(7*len(text)/(w - 10)))
        return self.box("message", x, y, w, 8 + 14*lines, text, 2, 1, [""])

    def comment(self, x, y, text, w=300):
        lines = max(1, math.ceil(7*len(text)/(w - 10)))
        return self.box("comment", x, y, w, 8 + 14*lines, text, 1, 0)

    def flonum(self, x, y):
        return self.box("flonum", x, y, 50, 22, None, 1, 2, ["", "bang"], parameter_enable=0)

    def c(self, a, ao, b, bi):
        self.lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})

    def patcher(self):
        return {"fileversion": 1,
                "appversion": {"major": 9, "minor": 1, "revision": 2,
                               "architecture": "x64", "modernui": 1},
                "classnamespace": "box", "rect": self.rect,
                "default_fontsize": 12.0, "gridsize": [15.0, 15.0],
                "boxes": self.boxes, "lines": self.lines}

    def save(self, path):
        json.dump({"patcher": self.patcher()}, open(path, "w"), indent=1)
