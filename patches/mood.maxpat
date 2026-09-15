{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 1,
   "revision": 2,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   30,
   40,
   1430,
   870
  ],
  "default_fontsize": 12.0,
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      0,
      0,
      1320,
      860
     ],
     "bgcolor": [
      0.33,
      0.21,
      0.12,
      1.0
     ],
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      10,
      600,
      34
     ],
     "text": "mood",
     "fontsize": 26.0,
     "fontface": 1,
     "textcolor": [
      0.96,
      0.9,
      0.78,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      46,
      1200,
      20
     ],
     "text": "three squinewave~ oscillators, noise~ / pink~, moogladder2~ (Csound's Moog ladder), two contours and glide. Needs the csoundport max/ folder in the search path. Click the speaker, pick a preset, play the keyboard, MIDI or the sequencer.",
     "fontsize": 11.0,
     "textcolor": [
      0.96,
      0.9,
      0.78,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      80,
      190,
      330
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30,
      86,
      170,
      22
     ],
     "text": "CONTROLLERS",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      35,
      120,
      110,
      20
     ],
     "text": "tune",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      95,
      98,
      79,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-tune",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      35,
      140,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -2,
     "maximum": 2,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      95,
      168,
      86,
      22
     ],
     "outlettype": [],
     "text": "s mdv-tune",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      35,
      175,
      110,
      20
     ],
     "text": "glide ms",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      95,
      153,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-glide",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      35,
      195,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 2000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      95,
      223,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-glide",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      35,
      230,
      110,
      20
     ],
     "text": "osc3 <-> noise",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      95,
      208,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-modmix",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      35,
      250,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      95,
      278,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-modmix",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      35,
      285,
      110,
      20
     ],
     "text": "mod wheel",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      95,
      263,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-wheel",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      35,
      305,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      95,
      333,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-wheel",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120,
      285,
      110,
      20
     ],
     "text": "osc mod",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      180,
      263,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-oscmod",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      120,
      305,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      68,
      280,
      18,
      18
     ],
     "checkedcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      180,
      333,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-oscmod",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120,
      340,
      110,
      20
     ],
     "text": "filter mod",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      180,
      318,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-filtmod",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      120,
      360,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      148,
      280,
      18,
      18
     ],
     "checkedcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      180,
      388,
      107,
      22
     ],
     "outlettype": [],
     "text": "s mdv-filtmod",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      220,
      80,
      360,
      330
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      86,
      340,
      22
     ],
     "text": "OSCILLATOR BANK",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      110,
      60,
      20
     ],
     "text": "osc 1",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      130,
      110,
      20
     ],
     "text": "octave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      295,
      108,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o1oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      235,
      150,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -2,
     "maximum": 2,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      295,
      178,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o1oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      410,
      130,
      110,
      20
     ],
     "text": "wave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      470,
      108,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o1wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "umenu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      410,
      150,
      105,
      22
     ],
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "triangle",
      ",",
      "shark",
      ",",
      "saw",
      ",",
      "square",
      ",",
      "wide pulse",
      ",",
      "narrow pulse"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      430,
      72,
      140,
      22
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.13,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      470,
      178,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o1wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      210,
      60,
      20
     ],
     "text": "osc 2",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      230,
      110,
      20
     ],
     "text": "octave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      295,
      208,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o2oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      235,
      250,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -2,
     "maximum": 2,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      295,
      278,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o2oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      320,
      230,
      110,
      20
     ],
     "text": "detune st",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380,
      208,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o2det",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      320,
      250,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -7,
     "maximum": 7,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380,
      278,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o2det",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      410,
      230,
      110,
      20
     ],
     "text": "wave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      470,
      208,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o2wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "umenu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      410,
      250,
      105,
      22
     ],
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "triangle",
      ",",
      "shark",
      ",",
      "saw",
      ",",
      "square",
      ",",
      "wide pulse",
      ",",
      "narrow pulse"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      430,
      172,
      140,
      22
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.13,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      470,
      278,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o2wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      310,
      60,
      20
     ],
     "text": "osc 3",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      235,
      330,
      110,
      20
     ],
     "text": "octave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      295,
      308,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o3oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      235,
      350,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -6,
     "maximum": 2,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      295,
      378,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o3oct",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      320,
      330,
      110,
      20
     ],
     "text": "detune st",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380,
      308,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o3det",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      320,
      350,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": -7,
     "maximum": 7,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-62",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380,
      378,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o3det",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      410,
      330,
      110,
      20
     ],
     "text": "wave",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-64",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      470,
      308,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o3wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "umenu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      410,
      350,
      105,
      22
     ],
     "outlettype": [
      "int",
      "",
      ""
     ],
     "items": [
      "triangle",
      ",",
      "shark",
      ",",
      "saw",
      ",",
      "square",
      ",",
      "wide pulse",
      ",",
      "narrow pulse"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      430,
      272,
      95,
      22
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.13,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      470,
      378,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o3wave",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      320,
      130,
      110,
      20
     ],
     "text": "sync to osc1",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-68",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      380,
      108,
      79,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-sync",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      320,
      150,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      348,
      72,
      18,
      18
     ],
     "checkedcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      380,
      178,
      86,
      22
     ],
     "outlettype": [],
     "text": "s mdv-sync",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      530,
      330,
      110,
      20
     ],
     "text": "keyboard",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      590,
      308,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-o3kbd",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      530,
      350,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      553,
      272,
      18,
      18
     ],
     "checkedcolor": [
      0.35,
      0.6,
      0.95,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      590,
      378,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-o3kbd",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      590,
      80,
      230,
      330
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      600,
      86,
      210,
      22
     ],
     "text": "MIXER",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      605,
      120,
      110,
      20
     ],
     "text": "osc 1",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-78",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      665,
      98,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-v1",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-79",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      605,
      140,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      665,
      168,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-v1",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-81",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      605,
      175,
      110,
      20
     ],
     "text": "osc 2",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-82",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      665,
      153,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-v2",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-83",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      605,
      195,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-84",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      665,
      223,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-v2",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-85",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      605,
      230,
      110,
      20
     ],
     "text": "osc 3",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-86",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      665,
      208,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-v3",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-87",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      605,
      250,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-88",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      665,
      278,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-v3",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-89",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      605,
      285,
      110,
      20
     ],
     "text": "noise",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-90",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      665,
      263,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-vn",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-91",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      605,
      305,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-92",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      665,
      333,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-vn",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-93",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      700,
      285,
      110,
      20
     ],
     "text": "white/pink",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-94",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      760,
      263,
      114,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-noisetype",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-95",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      700,
      305,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      728,
      172,
      18,
      18
     ],
     "checkedcolor": [
      0.35,
      0.6,
      0.95,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-96",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      760,
      333,
      121,
      22
     ],
     "outlettype": [],
     "text": "s mdv-noisetype",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-97",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      700,
      120,
      110,
      20
     ],
     "text": "drive",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-98",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      760,
      98,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-drive",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-99",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      700,
      140,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0.1,
     "maximum": 4,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-100",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      760,
      168,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-drive",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-101",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      830,
      80,
      470,
      330
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-102",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      840,
      86,
      450,
      22
     ],
     "text": "MODIFIERS",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-103",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      105,
      200,
      20
     ],
     "text": "filter",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-104",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      125,
      110,
      20
     ],
     "text": "cutoff (note)",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-105",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      905,
      103,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-cutoff",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-106",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      845,
      145,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 135,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-107",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      905,
      173,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-cutoff",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-108",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      955,
      125,
      110,
      20
     ],
     "text": "emphasis",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-109",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1015,
      103,
      79,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-emph",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-110",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      955,
      145,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-111",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1015,
      173,
      86,
      22
     ],
     "outlettype": [],
     "text": "s mdv-emph",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-112",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1065,
      125,
      110,
      20
     ],
     "text": "contour amt",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-113",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1125,
      103,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-amount",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-114",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1065,
      145,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-115",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1125,
      173,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-amount",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-116",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1175,
      125,
      110,
      20
     ],
     "text": "kbd track",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-117",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1235,
      103,
      107,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-kbdtrack",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-118",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1175,
      145,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-119",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1235,
      173,
      114,
      22
     ],
     "outlettype": [],
     "text": "s mdv-kbdtrack",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-120",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      190,
      200,
      20
     ],
     "text": "filter contour",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-121",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      210,
      110,
      20
     ],
     "text": "attack",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-122",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      905,
      188,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-fa",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-123",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      845,
      230,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 1,
     "maximum": 5000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-124",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      905,
      258,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-fa",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-125",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      955,
      210,
      110,
      20
     ],
     "text": "decay",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-126",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1015,
      188,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-fd",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-127",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      955,
      230,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 5,
     "maximum": 5000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-128",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1015,
      258,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-fd",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-129",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1065,
      210,
      110,
      20
     ],
     "text": "sustain",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-130",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1125,
      188,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-fs",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-131",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1065,
      230,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-132",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1125,
      258,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-fs",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-133",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      275,
      200,
      20
     ],
     "text": "loudness contour",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-134",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      295,
      110,
      20
     ],
     "text": "attack",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-135",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      905,
      273,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-la",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-136",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      845,
      315,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 1,
     "maximum": 5000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-137",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      905,
      343,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-la",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-138",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      955,
      295,
      110,
      20
     ],
     "text": "decay",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-139",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1015,
      273,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-ld",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-140",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      955,
      315,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 5,
     "maximum": 5000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-141",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1015,
      343,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-ld",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-142",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1065,
      295,
      110,
      20
     ],
     "text": "sustain",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-143",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1125,
      273,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-ls",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-144",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1065,
      315,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-145",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1125,
      343,
      72,
      22
     ],
     "outlettype": [],
     "text": "s mdv-ls",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-146",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1175,
      295,
      110,
      20
     ],
     "text": "decay on release",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-147",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      1235,
      273,
      107,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-decayrel",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-148",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1175,
      315,
      22,
      22
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      1083,
      272,
      18,
      18
     ],
     "checkedcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "uncheckedcolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-149",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1235,
      343,
      114,
      22
     ],
     "outlettype": [],
     "text": "s mdv-decayrel",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-150",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      845,
      360,
      440,
      40
     ],
     "text": "cutoff is a note number: 60 = 262 Hz; the contour opens it by up to 5 octaves, kbd track 1 follows the keyboard",
     "fontsize": 10.0,
     "textcolor": [
      0.8,
      0.8,
      0.8,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-151",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      420,
      560,
      150
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-152",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30,
      426,
      540,
      22
     ],
     "text": "PRESETS",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-153",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      455,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Fat bass",
     "presentation": 1,
     "presentation_rect": [
      1015,
      505,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-154",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      480,
      100,
      526
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 0; md-modmix 0; md-wheel 0; md-oscmod 0; md-filtmod 0; md-o1oct 0; md-o1wave 2; md-o2oct 0; md-o2det 0.08; md-o2wave 2; md-sync 0; md-o3oct -1; md-o3det -0.06; md-o3wave 3; md-o3kbd 1; md-v1 0.8; md-v2 0.7; md-v3 0.5; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 40; md-emph 0.4; md-amount 0.6; md-kbdtrack 0.33; md-fa 5; md-fd 300; md-fs 0.2; md-la 3; md-ld 400; md-ls 0.8; md-decayrel 1; md-master 0.4; md-revmix 0.25; md-revfb 0.85; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-155",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      170,
      455,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Taurus-ish sub",
     "presentation": 1,
     "presentation_rect": [
      1187,
      505,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-156",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      170,
      480,
      100,
      540
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 60; md-modmix 0; md-wheel 0; md-oscmod 0; md-filtmod 0; md-o1oct -1; md-o1wave 3; md-o2oct -1; md-o2det 0.08; md-o2wave 2; md-sync 0; md-o3oct -2; md-o3det 0.03; md-o3wave 0; md-o3kbd 1; md-v1 0.8; md-v2 0.7; md-v3 0.9; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 34; md-emph 0.2; md-amount 0.45; md-kbdtrack 0.33; md-fa 5; md-fd 500; md-fs 0.1; md-la 3; md-ld 900; md-ls 0.6; md-decayrel 1; md-master 0.4; md-revmix 0.25; md-revfb 0.85; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-157",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      305,
      455,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Lead + vibrato",
     "presentation": 1,
     "presentation_rect": [
      1015,
      537,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-158",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      305,
      480,
      100,
      540
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 120; md-modmix 0; md-wheel 0.12; md-oscmod 1; md-filtmod 0; md-o1oct 0; md-o1wave 2; md-o2oct 0; md-o2det 7.02; md-o2wave 4; md-sync 0; md-o3oct -4; md-o3det 17; md-o3wave 0; md-o3kbd 0; md-v1 0.8; md-v2 0.7; md-v3 0; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 70; md-emph 0.55; md-amount 0.4; md-kbdtrack 0.33; md-fa 5; md-fd 300; md-fs 0.6; md-la 10; md-ld 800; md-ls 0.9; md-decayrel 1; md-master 0.4; md-revmix 0.35; md-revfb 0.9; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-159",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      440,
      455,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Brass",
     "presentation": 1,
     "presentation_rect": [
      1187,
      537,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-160",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      440,
      480,
      100,
      540
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 0; md-modmix 0; md-wheel 0; md-oscmod 0; md-filtmod 0; md-o1oct 0; md-o1wave 2; md-o2oct 0; md-o2det 0.12; md-o2wave 2; md-sync 0; md-o3oct 0; md-o3det -0.1; md-o3wave 2; md-o3kbd 1; md-v1 0.8; md-v2 0.7; md-v3 0.5; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 48; md-emph 0.15; md-amount 0.75; md-kbdtrack 0.33; md-fa 220; md-fd 900; md-fs 0.55; md-la 40; md-ld 600; md-ls 0.85; md-decayrel 1; md-master 0.4; md-revmix 0.25; md-revfb 0.85; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-161",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      495,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Sync sweep",
     "presentation": 1,
     "presentation_rect": [
      1015,
      569,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-162",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      520,
      100,
      526
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 0; md-modmix 0; md-wheel 0; md-oscmod 0; md-filtmod 0; md-o1oct 0; md-o1wave 2; md-o2oct 1; md-o2det 5; md-o2wave 2; md-sync 1; md-o3oct -5; md-o3det 0; md-o3wave 3; md-o3kbd 0; md-v1 0.2; md-v2 1; md-v3 0; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 80; md-emph 0.3; md-amount 0.3; md-kbdtrack 0.33; md-fa 5; md-fd 300; md-fs 0.7; md-la 3; md-ld 700; md-ls 0.9; md-decayrel 1; md-master 0.4; md-revmix 0.25; md-revfb 0.85; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-163",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      170,
      495,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Resonant wobble",
     "presentation": 1,
     "presentation_rect": [
      1187,
      569,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-164",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      170,
      520,
      100,
      526
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 0; md-modmix 0; md-wheel 0.7; md-oscmod 0; md-filtmod 1; md-o1oct 0; md-o1wave 3; md-o2oct 0; md-o2det 0.08; md-o2wave 2; md-sync 0; md-o3oct -4; md-o3det 14; md-o3wave 0; md-o3kbd 0; md-v1 0.8; md-v2 0.7; md-v3 0; md-vn 0; md-noisetype 0; md-drive 1.5; md-cutoff 45; md-emph 0.85; md-amount 0.2; md-kbdtrack 0.33; md-fa 5; md-fd 300; md-fs 0.8; md-la 3; md-ld 400; md-ls 1; md-decayrel 1; md-master 0.4; md-revmix 0.25; md-revfb 0.85; md-revlp 8000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-165",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      305,
      495,
      125,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "Noise wind",
     "presentation": 1,
     "presentation_rect": [
      1015,
      601,
      165,
      26
     ],
     "bgcolor": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.2,
      0.2,
      0.21,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-166",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      305,
      520,
      100,
      526
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tune 0; md-glide 0; md-modmix 0; md-wheel 0.9; md-oscmod 0; md-filtmod 1; md-o1oct 0; md-o1wave 2; md-o2oct 0; md-o2det 0.08; md-o2wave 2; md-sync 0; md-o3oct -6; md-o3det 0; md-o3wave 3; md-o3kbd 0; md-v1 0; md-v2 0; md-v3 0; md-vn 1; md-noisetype 1; md-drive 0.8; md-cutoff 72; md-emph 0.92; md-amount 0; md-kbdtrack 1; md-fa 5; md-fd 300; md-fs 0.2; md-la 900; md-ld 2000; md-ls 1; md-decayrel 1; md-master 0.4; md-revmix 0.5; md-revfb 0.95; md-revlp 5000",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-167",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      470,
      530,
      72,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "loadbang",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-168",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      470,
      550,
      79,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 100",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-169",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      580,
      780,
      260
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-170",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      30,
      586,
      760,
      22
     ],
     "text": "KEYBOARD",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-171",
     "maxclass": "kslider",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      35,
      620,
      560,
      60
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "parameter_enable": 0,
     "range": 49,
     "offset": 36,
     "presentation": 1,
     "presentation_rect": [
      125,
      505,
      870,
      250
     ],
     "whitekeycolor": [
      0.97,
      0.96,
      0.92,
      1
     ],
     "blackkeycolor": [
      0.05,
      0.05,
      0.05,
      1
     ],
     "hkeycolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-172",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      610,
      615,
      180,
      60
     ],
     "text": "click a key: a note of the gate length below. MIDI input plays too (last note priority)",
     "fontsize": 10.0,
     "textcolor": [
      0.85,
      0.85,
      0.85,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-173",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      35,
      690,
      51,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-174",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      715,
      58,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "$1 100",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-175",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      100,
      715,
      72,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "pipe 300",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-176",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      100,
      740,
      44,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "$1 0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-177",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      250,
      690,
      58,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "midiin",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-178",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 8,
     "patching_rect": [
      250,
      715,
      79,
      22
     ],
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "midiparse",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-179",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      400,
      690,
      58,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "zl.rev",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-180",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      400,
      715,
      65,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "route 0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-181",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      400,
      740,
      44,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "== 0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-182",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      400,
      765,
      51,
      22
     ],
     "outlettype": [
      "bang",
      ""
     ],
     "text": "sel 1",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-183",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      400,
      790,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-184",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      480,
      740,
      86,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "unpack 0 0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-185",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      560,
      765,
      51,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-186",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      560,
      790,
      86,
      22
     ],
     "outlettype": [],
     "text": "s mdv-note",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-187",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      480,
      790,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-188",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      480,
      815,
      86,
      22
     ],
     "outlettype": [],
     "text": "s mdv-gate",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-189",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      35,
      750,
      100,
      20
     ],
     "text": "sequencer",
     "fontface": 1,
     "textcolor": [
      1,
      0.8,
      0.4,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-190",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      35,
      775,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      1015,
      668,
      24,
      24
     ],
     "checkedcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "bgcolor": [
      0.9,
      0.9,
      0.88,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-191",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      75,
      760,
      110,
      20
     ],
     "text": "step ms",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-192",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      135,
      738,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-tempo",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-193",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      75,
      780,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 60,
     "maximum": 1000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-194",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      135,
      808,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-tempo",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-195",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      165,
      760,
      110,
      20
     ],
     "text": "gate %",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-196",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      225,
      738,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-gatelen",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-197",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      165,
      780,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 5,
     "maximum": 100,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-198",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      225,
      808,
      107,
      22
     ],
     "outlettype": [],
     "text": "s mdv-gatelen",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-199",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      35,
      805,
      79,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "metro 160",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-200",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      100,
      805,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r mdv-tempo",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-201",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 4,
     "patching_rect": [
      35,
      830,
      100,
      22
     ],
     "outlettype": [
      "int",
      "",
      "",
      "int"
     ],
     "text": "counter 0 15",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-202",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      150,
      830,
      79,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "zl.lookup",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-203",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      250,
      830,
      51,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-204",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      330,
      830,
      58,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "$1 100",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-205",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      250,
      855,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pak 160 50",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-206",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      330,
      805,
      107,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r mdv-gatelen",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-207",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      250,
      880,
      163,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f1 * $f2 / 100.",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-208",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      420,
      855,
      65,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "pipe 80",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-209",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      420,
      880,
      44,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "$1 0",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-210",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      260,
      760,
      90,
      20
     ],
     "text": "pattern",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-211",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      260,
      780,
      70,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "disco",
     "presentation": 1,
     "presentation_rect": [
      1050,
      668,
      70,
      24
     ],
     "bgcolor": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-212",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      260,
      805,
      60,
      106
     ],
     "outlettype": [
      ""
     ],
     "text": "36 48 36 48 36 48 36 48 34 46 34 46 39 51 41 53",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-213",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      335,
      780,
      70,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "acid",
     "presentation": 1,
     "presentation_rect": [
      1125,
      668,
      70,
      24
     ],
     "bgcolor": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-214",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      335,
      805,
      60,
      106
     ],
     "outlettype": [
      ""
     ],
     "text": "36 36 48 36 39 36 51 36 41 36 43 48 36 46 36 39",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-215",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      410,
      780,
      70,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "berlin",
     "presentation": 1,
     "presentation_rect": [
      1200,
      668,
      70,
      24
     ],
     "bgcolor": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "bgfillcolor_type": "color",
     "bgfillcolor_color": [
      0.25,
      0.18,
      0.1,
      1
     ],
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "fontsize": 11.0,
     "textjustification": 1
    }
   },
   {
    "box": {
     "id": "obj-216",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      410,
      805,
      60,
      106
     ],
     "outlettype": [
      ""
     ],
     "text": "36 43 48 51 55 51 48 43 36 43 48 51 55 58 55 51",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-217",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      520,
      530,
      219,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "; md-tempo 160; md-gatelen 50",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-218",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      810,
      580,
      490,
      260
     ],
     "bgcolor": [
      0.16,
      0.16,
      0.17,
      1.0
     ],
     "rounded": 10,
     "background": 1,
     "mode": 0
    }
   },
   {
    "box": {
     "id": "obj-219",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      820,
      586,
      470,
      22
     ],
     "text": "OUTPUT",
     "fontface": 1,
     "fontsize": 13.0,
     "textcolor": [
      0.95,
      0.95,
      0.95,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-220",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      825,
      615,
      110,
      20
     ],
     "text": "volume",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-221",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      885,
      593,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-master",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-222",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      825,
      635,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-223",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      885,
      663,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-master",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-224",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      825,
      700,
      110,
      20
     ],
     "text": "reverb",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-225",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      885,
      678,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-revmix",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-226",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      825,
      720,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0,
     "maximum": 1,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-227",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      885,
      748,
      100,
      22
     ],
     "outlettype": [],
     "text": "s mdv-revmix",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-228",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      905,
      700,
      110,
      20
     ],
     "text": "size",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-229",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      965,
      678,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-revfb",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-230",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      905,
      720,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 0.5,
     "maximum": 0.99,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-231",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      965,
      748,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-revfb",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-232",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      825,
      760,
      110,
      20
     ],
     "text": "tone Hz",
     "fontsize": 11.0,
     "textcolor": [
      0.9,
      0.9,
      0.9,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-233",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 1,
     "patching_rect": [
      885,
      738,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "r md-revlp",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-234",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      825,
      780,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0,
     "minimum": 500,
     "maximum": 16000,
     "format": 6
    }
   },
   {
    "box": {
     "id": "obj-235",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      885,
      808,
      93,
      22
     ],
     "outlettype": [],
     "text": "s mdv-revlp",
     "hidden": 1
    }
   },
   {
    "box": {
     "id": "obj-236",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      900,
      615,
      128,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "receive~ md-outL"
    }
   },
   {
    "box": {
     "id": "obj-237",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      900,
      640,
      128,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "receive~ md-outR"
    }
   },
   {
    "box": {
     "id": "obj-238",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      1000,
      760,
      50,
      50
     ],
     "presentation": 1,
     "presentation_rect": [
      1175,
      255,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-239",
     "maxclass": "scope~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      1060,
      615,
      220,
      205
     ],
     "bgcolor": [
      0.05,
      0.08,
      0.05,
      1
     ],
     "fgcolor": [
      0.4,
      1.0,
      0.5,
      1
     ],
     "calccount": 32,
     "presentation": 1,
     "presentation_rect": [
      1250,
      250,
      105,
      80
     ]
    }
   },
   {
    "box": {
     "id": "obj-240",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 0,
     "patching_rect": [
      1180,
      20,
      80,
      22
     ],
     "outlettype": [],
     "text": "p voice",
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 1,
       "revision": 2,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       100,
       100,
       1250,
       1000
      ],
      "default_fontsize": 12.0,
      "gridsize": [
       15.0,
       15.0
      ],
      "boxes": [
       {
        "box": {
         "id": "obj-1",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          10,
          5,
          600,
          22
         ],
         "text": "The voice. Parameters arrive as mdv-<name>, notes as mdv-note and mdv-gate."
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          10,
          40,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-note"
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110,
          40,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-glide"
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          70,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pack 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-5",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 2,
         "patching_rect": [
          10,
          100,
          51,
          22
         ],
         "outlettype": [
          "signal",
          "signal"
         ],
         "text": "line~"
        }
       },
       {
        "box": {
         "id": "obj-6",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          200,
          40,
          72,
          22
         ],
         "outlettype": [
          "bang"
         ],
         "text": "loadbang"
        }
       },
       {
        "box": {
         "id": "obj-7",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          200,
          70,
          40,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "48"
        }
       },
       {
        "box": {
         "id": "obj-8",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110,
          100,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-tune"
        }
       },
       {
        "box": {
         "id": "obj-9",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          130,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~ 0."
        }
       },
       {
        "box": {
         "id": "obj-10",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          190,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-11",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          80,
          190,
          260,
          36
         ],
         "text": "note + tune + osc modulation (semitones)"
        }
       },
       {
        "box": {
         "id": "obj-12",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          700,
          10,
          200,
          22
         ],
         "text": "modulation mix and wheel"
        }
       },
       {
        "box": {
         "id": "obj-13",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          700,
          40,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-modmix"
        }
       },
       {
        "box": {
         "id": "obj-14",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          800,
          70,
          107,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr 1. - $f1"
        }
       },
       {
        "box": {
         "id": "obj-15",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          130,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 1."
        }
       },
       {
        "box": {
         "id": "obj-16",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          800,
          130,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-17",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          160,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-18",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          800,
          160,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-wheel"
        }
       },
       {
        "box": {
         "id": "obj-19",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          190,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-20",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          800,
          220,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-oscmod"
        }
       },
       {
        "box": {
         "id": "obj-21",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          800,
          245,
          44,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "* 6."
        }
       },
       {
        "box": {
         "id": "obj-22",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          275,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-23",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          800,
          305,
          107,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-filtmod"
        }
       },
       {
        "box": {
         "id": "obj-24",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          800,
          330,
          51,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "* 24."
        }
       },
       {
        "box": {
         "id": "obj-25",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          360,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-26",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          10,
          230,
          120,
          22
         ],
         "text": "oscillator 1"
        }
       },
       {
        "box": {
         "id": "obj-27",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          100,
          255,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o1oct"
        }
       },
       {
        "box": {
         "id": "obj-28",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          100,
          305,
          51,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "* 12."
        }
       },
       {
        "box": {
         "id": "obj-29",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          335,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~ 0."
        }
       },
       {
        "box": {
         "id": "obj-30",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          10,
          365,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "mtof~"
        }
       },
       {
        "box": {
         "id": "obj-31",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          100,
          365,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o1wave"
        }
       },
       {
        "box": {
         "id": "obj-32",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 7,
         "patching_rect": [
          100,
          390,
          110,
          22
         ],
         "outlettype": [
          "",
          "",
          "",
          "",
          "",
          "",
          ""
         ],
         "text": "sel 0 1 2 3 4 5"
        }
       },
       {
        "box": {
         "id": "obj-33",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          100,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0"
        }
       },
       {
        "box": {
         "id": "obj-34",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          145,
          420,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0.5"
        }
       },
       {
        "box": {
         "id": "obj-35",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          190,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 1"
        }
       },
       {
        "box": {
         "id": "obj-36",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          100,
          445,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0"
        }
       },
       {
        "box": {
         "id": "obj-37",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          145,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.5"
        }
       },
       {
        "box": {
         "id": "obj-38",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          190,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.85"
        }
       },
       {
        "box": {
         "id": "obj-39",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 2,
         "patching_rect": [
          100,
          475,
          100,
          22
         ],
         "outlettype": [
          "float",
          "float"
         ],
         "text": "unpack 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-40",
         "maxclass": "newobj",
         "numinlets": 4,
         "numoutlets": 2,
         "patching_rect": [
          10,
          510,
          110,
          22
         ],
         "outlettype": [
          "signal",
          "signal"
         ],
         "text": "squinewave~ 110"
        }
       },
       {
        "box": {
         "id": "obj-41",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          240,
          230,
          120,
          22
         ],
         "text": "oscillator 2"
        }
       },
       {
        "box": {
         "id": "obj-42",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          330,
          255,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o2oct"
        }
       },
       {
        "box": {
         "id": "obj-43",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          440,
          255,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o2det"
        }
       },
       {
        "box": {
         "id": "obj-44",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          330,
          280,
          79,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pak 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-45",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          330,
          305,
          156,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr $f1 * 12. + $f2"
        }
       },
       {
        "box": {
         "id": "obj-46",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          240,
          335,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~ 0."
        }
       },
       {
        "box": {
         "id": "obj-47",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          240,
          365,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "mtof~"
        }
       },
       {
        "box": {
         "id": "obj-48",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          330,
          365,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o2wave"
        }
       },
       {
        "box": {
         "id": "obj-49",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 7,
         "patching_rect": [
          330,
          390,
          110,
          22
         ],
         "outlettype": [
          "",
          "",
          "",
          "",
          "",
          "",
          ""
         ],
         "text": "sel 0 1 2 3 4 5"
        }
       },
       {
        "box": {
         "id": "obj-50",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          330,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0"
        }
       },
       {
        "box": {
         "id": "obj-51",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          375,
          420,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0.5"
        }
       },
       {
        "box": {
         "id": "obj-52",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          420,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 1"
        }
       },
       {
        "box": {
         "id": "obj-53",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          330,
          445,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0"
        }
       },
       {
        "box": {
         "id": "obj-54",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          375,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.5"
        }
       },
       {
        "box": {
         "id": "obj-55",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          420,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.85"
        }
       },
       {
        "box": {
         "id": "obj-56",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 2,
         "patching_rect": [
          330,
          475,
          100,
          22
         ],
         "outlettype": [
          "float",
          "float"
         ],
         "text": "unpack 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-57",
         "maxclass": "newobj",
         "numinlets": 4,
         "numoutlets": 2,
         "patching_rect": [
          240,
          510,
          110,
          22
         ],
         "outlettype": [
          "signal",
          "signal"
         ],
         "text": "squinewave~ 110"
        }
       },
       {
        "box": {
         "id": "obj-58",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          470,
          230,
          120,
          22
         ],
         "text": "oscillator 3"
        }
       },
       {
        "box": {
         "id": "obj-59",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560,
          255,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o3oct"
        }
       },
       {
        "box": {
         "id": "obj-60",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          670,
          255,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o3det"
        }
       },
       {
        "box": {
         "id": "obj-61",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          560,
          280,
          79,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pak 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-62",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          560,
          305,
          156,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr $f1 * 12. + $f2"
        }
       },
       {
        "box": {
         "id": "obj-63",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          670,
          305,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o3kbd"
        }
       },
       {
        "box": {
         "id": "obj-64",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          470,
          305,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 1."
        }
       },
       {
        "box": {
         "id": "obj-65",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          470,
          335,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~ 0."
        }
       },
       {
        "box": {
         "id": "obj-66",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          470,
          365,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "mtof~"
        }
       },
       {
        "box": {
         "id": "obj-67",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560,
          365,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-o3wave"
        }
       },
       {
        "box": {
         "id": "obj-68",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 7,
         "patching_rect": [
          560,
          390,
          110,
          22
         ],
         "outlettype": [
          "",
          "",
          "",
          "",
          "",
          "",
          ""
         ],
         "text": "sel 0 1 2 3 4 5"
        }
       },
       {
        "box": {
         "id": "obj-69",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          560,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0"
        }
       },
       {
        "box": {
         "id": "obj-70",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          605,
          420,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "0 0.5"
        }
       },
       {
        "box": {
         "id": "obj-71",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          650,
          420,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "0 1"
        }
       },
       {
        "box": {
         "id": "obj-72",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          560,
          445,
          42,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0"
        }
       },
       {
        "box": {
         "id": "obj-73",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          605,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.5"
        }
       },
       {
        "box": {
         "id": "obj-74",
         "maxclass": "message",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          650,
          445,
          42,
          36
         ],
         "outlettype": [
          ""
         ],
         "text": "1 0.85"
        }
       },
       {
        "box": {
         "id": "obj-75",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 2,
         "patching_rect": [
          560,
          475,
          100,
          22
         ],
         "outlettype": [
          "float",
          "float"
         ],
         "text": "unpack 0. 0."
        }
       },
       {
        "box": {
         "id": "obj-76",
         "maxclass": "newobj",
         "numinlets": 4,
         "numoutlets": 2,
         "patching_rect": [
          470,
          510,
          110,
          22
         ],
         "outlettype": [
          "signal",
          "signal"
         ],
         "text": "squinewave~ 110"
        }
       },
       {
        "box": {
         "id": "obj-77",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          350,
          540,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-sync"
        }
       },
       {
        "box": {
         "id": "obj-78",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          240,
          480,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-79",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          700,
          400,
          60,
          22
         ],
         "text": "noise"
        }
       },
       {
        "box": {
         "id": "obj-80",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          700,
          425,
          58,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "noise~"
        }
       },
       {
        "box": {
         "id": "obj-81",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          770,
          425,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "pink~"
        }
       },
       {
        "box": {
         "id": "obj-82",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          850,
          425,
          121,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-noisetype"
        }
       },
       {
        "box": {
         "id": "obj-83",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          850,
          450,
          40,
          22
         ],
         "outlettype": [
          "int"
         ],
         "text": "+ 1"
        }
       },
       {
        "box": {
         "id": "obj-84",
         "maxclass": "newobj",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          700,
          480,
          107,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "selector~ 2 1"
        }
       },
       {
        "box": {
         "id": "obj-85",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          10,
          560,
          60,
          22
         ],
         "text": "mixer"
        }
       },
       {
        "box": {
         "id": "obj-86",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          640,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-87",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          100,
          585,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-v1"
        }
       },
       {
        "box": {
         "id": "obj-88",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          585,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-89",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          330,
          585,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-v2"
        }
       },
       {
        "box": {
         "id": "obj-90",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          240,
          585,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-91",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          560,
          585,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-v3"
        }
       },
       {
        "box": {
         "id": "obj-92",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          470,
          585,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-93",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          790,
          585,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-vn"
        }
       },
       {
        "box": {
         "id": "obj-94",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          700,
          585,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-95",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          615,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-96",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          240,
          615,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-97",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          110,
          670,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-drive"
        }
       },
       {
        "box": {
         "id": "obj-98",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          10,
          670,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 1."
        }
       },
       {
        "box": {
         "id": "obj-99",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          10,
          710,
          150,
          22
         ],
         "text": "filter contour"
        }
       },
       {
        "box": {
         "id": "obj-100",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          10,
          735,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-gate"
        }
       },
       {
        "box": {
         "id": "obj-101",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          70,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-fa"
        }
       },
       {
        "box": {
         "id": "obj-102",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          160,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-fd"
        }
       },
       {
        "box": {
         "id": "obj-103",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          250,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-fs"
        }
       },
       {
        "box": {
         "id": "obj-104",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          250,
          765,
          114,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-decayrel"
        }
       },
       {
        "box": {
         "id": "obj-105",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          160,
          795,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pak 0 0."
        }
       },
       {
        "box": {
         "id": "obj-106",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          160,
          820,
          150,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr $i1 * $f2 + (1 - $i1) * 10."
        }
       },
       {
        "box": {
         "id": "obj-107",
         "maxclass": "newobj",
         "numinlets": 5,
         "numoutlets": 4,
         "patching_rect": [
          10,
          855,
          140,
          22
         ],
         "outlettype": [
          "signal",
          "signal",
          "",
          ""
         ],
         "text": "adsr~ 5 300 0.5 10"
        }
       },
       {
        "box": {
         "id": "obj-108",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          420,
          710,
          150,
          22
         ],
         "text": "loudness contour"
        }
       },
       {
        "box": {
         "id": "obj-109",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          420,
          735,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-gate"
        }
       },
       {
        "box": {
         "id": "obj-110",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          480,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-la"
        }
       },
       {
        "box": {
         "id": "obj-111",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          570,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-ld"
        }
       },
       {
        "box": {
         "id": "obj-112",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          660,
          735,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-ls"
        }
       },
       {
        "box": {
         "id": "obj-113",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          660,
          765,
          114,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-decayrel"
        }
       },
       {
        "box": {
         "id": "obj-114",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          570,
          795,
          72,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pak 0 0."
        }
       },
       {
        "box": {
         "id": "obj-115",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          570,
          820,
          150,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr $i1 * $f2 + (1 - $i1) * 10."
        }
       },
       {
        "box": {
         "id": "obj-116",
         "maxclass": "newobj",
         "numinlets": 5,
         "numoutlets": 4,
         "patching_rect": [
          420,
          855,
          140,
          22
         ],
         "outlettype": [
          "signal",
          "signal",
          "",
          ""
         ],
         "text": "adsr~ 5 300 0.5 10"
        }
       },
       {
        "box": {
         "id": "obj-117",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          900,
          10,
          200,
          22
         ],
         "text": "filter cutoff (semitones)"
        }
       },
       {
        "box": {
         "id": "obj-118",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          900,
          40,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-cutoff"
        }
       },
       {
        "box": {
         "id": "obj-119",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          900,
          70,
          44,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "sig~"
        }
       },
       {
        "box": {
         "id": "obj-120",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          100,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-amount"
        }
       },
       {
        "box": {
         "id": "obj-121",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          125,
          51,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "* 60."
        }
       },
       {
        "box": {
         "id": "obj-122",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          155,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-123",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          185,
          58,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "-~ 60."
        }
       },
       {
        "box": {
         "id": "obj-124",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          185,
          114,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-kbdtrack"
        }
       },
       {
        "box": {
         "id": "obj-125",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          215,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-126",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          250,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-127",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          280,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-128",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          310,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-129",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          900,
          340,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "mtof~"
        }
       },
       {
        "box": {
         "id": "obj-130",
         "maxclass": "newobj",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          900,
          370,
          128,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "clip~ 20. 18000."
        }
       },
       {
        "box": {
         "id": "obj-131",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          400,
          86,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-emph"
        }
       },
       {
        "box": {
         "id": "obj-132",
         "maxclass": "newobj",
         "numinlets": 3,
         "numoutlets": 1,
         "patching_rect": [
          900,
          430,
          100,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "moogladder2~"
        }
       },
       {
        "box": {
         "id": "obj-133",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          800,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~"
        }
       },
       {
        "box": {
         "id": "obj-134",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          830,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-master"
        }
       },
       {
        "box": {
         "id": "obj-135",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          1010,
          855,
          58,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "pow 2."
        }
       },
       {
        "box": {
         "id": "obj-136",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          885,
          51,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0."
        }
       },
       {
        "box": {
         "id": "obj-137",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1020,
          915,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-revfb"
        }
       },
       {
        "box": {
         "id": "obj-138",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1120,
          915,
          93,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-revlp"
        }
       },
       {
        "box": {
         "id": "obj-139",
         "maxclass": "newobj",
         "numinlets": 4,
         "numoutlets": 2,
         "patching_rect": [
          900,
          950,
          140,
          22
         ],
         "outlettype": [
          "signal",
          "signal"
         ],
         "text": "reverbsc2~ 0.85 8000"
        }
       },
       {
        "box": {
         "id": "obj-140",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          1060,
          980,
          100,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "r mdv-revmix"
        }
       },
       {
        "box": {
         "id": "obj-141",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          1060,
          1005,
          107,
          22
         ],
         "outlettype": [
          ""
         ],
         "text": "expr 1. - $f1"
        }
       },
       {
        "box": {
         "id": "obj-142",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          1035,
          65,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0.25"
        }
       },
       {
        "box": {
         "id": "obj-143",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          970,
          1035,
          65,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0.75"
        }
       },
       {
        "box": {
         "id": "obj-144",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          900,
          1065,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-145",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          900,
          1095,
          107,
          22
         ],
         "outlettype": [],
         "text": "send~ md-outL"
        }
       },
       {
        "box": {
         "id": "obj-146",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          1050,
          1035,
          65,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0.25"
        }
       },
       {
        "box": {
         "id": "obj-147",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          1120,
          1035,
          65,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "*~ 0.75"
        }
       },
       {
        "box": {
         "id": "obj-148",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "patching_rect": [
          1050,
          1065,
          40,
          22
         ],
         "outlettype": [
          "signal"
         ],
         "text": "+~"
        }
       },
       {
        "box": {
         "id": "obj-149",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          1050,
          1095,
          107,
          22
         ],
         "outlettype": [],
         "text": "send~ md-outR"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          0
         ],
         "destination": [
          "obj-4",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-4",
          0
         ],
         "destination": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-6",
          0
         ],
         "destination": [
          "obj-7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-7",
          0
         ],
         "destination": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-5",
          0
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-8",
          0
         ],
         "destination": [
          "obj-9",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-9",
          0
         ],
         "destination": [
          "obj-10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-13",
          0
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-14",
          0
         ],
         "destination": [
          "obj-15",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-13",
          0
         ],
         "destination": [
          "obj-16",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-15",
          0
         ],
         "destination": [
          "obj-17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-16",
          0
         ],
         "destination": [
          "obj-17",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-17",
          0
         ],
         "destination": [
          "obj-19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-18",
          0
         ],
         "destination": [
          "obj-19",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-20",
          0
         ],
         "destination": [
          "obj-21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-19",
          0
         ],
         "destination": [
          "obj-22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-21",
          0
         ],
         "destination": [
          "obj-22",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-22",
          0
         ],
         "destination": [
          "obj-10",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-23",
          0
         ],
         "destination": [
          "obj-24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-19",
          0
         ],
         "destination": [
          "obj-25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-24",
          0
         ],
         "destination": [
          "obj-25",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-27",
          0
         ],
         "destination": [
          "obj-28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-10",
          0
         ],
         "destination": [
          "obj-29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-28",
          0
         ],
         "destination": [
          "obj-29",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-29",
          0
         ],
         "destination": [
          "obj-30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-31",
          0
         ],
         "destination": [
          "obj-32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          0
         ],
         "destination": [
          "obj-33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          1
         ],
         "destination": [
          "obj-34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          2
         ],
         "destination": [
          "obj-35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          3
         ],
         "destination": [
          "obj-36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          4
         ],
         "destination": [
          "obj-37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-32",
          5
         ],
         "destination": [
          "obj-38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-33",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-34",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-35",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-36",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-37",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-38",
          0
         ],
         "destination": [
          "obj-39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-30",
          0
         ],
         "destination": [
          "obj-40",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-39",
          0
         ],
         "destination": [
          "obj-40",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-39",
          1
         ],
         "destination": [
          "obj-40",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-42",
          0
         ],
         "destination": [
          "obj-44",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-43",
          0
         ],
         "destination": [
          "obj-44",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-44",
          0
         ],
         "destination": [
          "obj-45",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-10",
          0
         ],
         "destination": [
          "obj-46",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-45",
          0
         ],
         "destination": [
          "obj-46",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-46",
          0
         ],
         "destination": [
          "obj-47",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-48",
          0
         ],
         "destination": [
          "obj-49",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          0
         ],
         "destination": [
          "obj-50",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          1
         ],
         "destination": [
          "obj-51",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          2
         ],
         "destination": [
          "obj-52",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          3
         ],
         "destination": [
          "obj-53",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          4
         ],
         "destination": [
          "obj-54",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-49",
          5
         ],
         "destination": [
          "obj-55",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-50",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-51",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-52",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-53",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-54",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-55",
          0
         ],
         "destination": [
          "obj-56",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-47",
          0
         ],
         "destination": [
          "obj-57",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-56",
          0
         ],
         "destination": [
          "obj-57",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-56",
          1
         ],
         "destination": [
          "obj-57",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-59",
          0
         ],
         "destination": [
          "obj-61",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-60",
          0
         ],
         "destination": [
          "obj-61",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-61",
          0
         ],
         "destination": [
          "obj-62",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-9",
          0
         ],
         "destination": [
          "obj-64",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-63",
          0
         ],
         "destination": [
          "obj-64",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-64",
          0
         ],
         "destination": [
          "obj-65",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-62",
          0
         ],
         "destination": [
          "obj-65",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-65",
          0
         ],
         "destination": [
          "obj-66",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-67",
          0
         ],
         "destination": [
          "obj-68",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          0
         ],
         "destination": [
          "obj-69",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          1
         ],
         "destination": [
          "obj-70",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          2
         ],
         "destination": [
          "obj-71",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          3
         ],
         "destination": [
          "obj-72",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          4
         ],
         "destination": [
          "obj-73",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-68",
          5
         ],
         "destination": [
          "obj-74",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-69",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-70",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-71",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-72",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-73",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-74",
          0
         ],
         "destination": [
          "obj-75",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-66",
          0
         ],
         "destination": [
          "obj-76",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-75",
          0
         ],
         "destination": [
          "obj-76",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-75",
          1
         ],
         "destination": [
          "obj-76",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-76",
          0
         ],
         "destination": [
          "obj-15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-40",
          1
         ],
         "destination": [
          "obj-78",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-77",
          0
         ],
         "destination": [
          "obj-78",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-78",
          0
         ],
         "destination": [
          "obj-57",
          3
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-80",
          0
         ],
         "destination": [
          "obj-81",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-82",
          0
         ],
         "destination": [
          "obj-83",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-83",
          0
         ],
         "destination": [
          "obj-84",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-80",
          0
         ],
         "destination": [
          "obj-84",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-81",
          0
         ],
         "destination": [
          "obj-84",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-84",
          0
         ],
         "destination": [
          "obj-16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-40",
          0
         ],
         "destination": [
          "obj-88",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-87",
          0
         ],
         "destination": [
          "obj-88",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-57",
          0
         ],
         "destination": [
          "obj-90",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-89",
          0
         ],
         "destination": [
          "obj-90",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-76",
          0
         ],
         "destination": [
          "obj-92",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-91",
          0
         ],
         "destination": [
          "obj-92",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-84",
          0
         ],
         "destination": [
          "obj-94",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-93",
          0
         ],
         "destination": [
          "obj-94",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-88",
          0
         ],
         "destination": [
          "obj-95",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-90",
          0
         ],
         "destination": [
          "obj-95",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-92",
          0
         ],
         "destination": [
          "obj-96",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-94",
          0
         ],
         "destination": [
          "obj-96",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-95",
          0
         ],
         "destination": [
          "obj-86",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-96",
          0
         ],
         "destination": [
          "obj-86",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-86",
          0
         ],
         "destination": [
          "obj-98",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-97",
          0
         ],
         "destination": [
          "obj-98",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-104",
          0
         ],
         "destination": [
          "obj-105",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-102",
          0
         ],
         "destination": [
          "obj-105",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-105",
          0
         ],
         "destination": [
          "obj-106",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-100",
          0
         ],
         "destination": [
          "obj-107",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-101",
          0
         ],
         "destination": [
          "obj-107",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-102",
          0
         ],
         "destination": [
          "obj-107",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-103",
          0
         ],
         "destination": [
          "obj-107",
          3
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-106",
          0
         ],
         "destination": [
          "obj-107",
          4
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-113",
          0
         ],
         "destination": [
          "obj-114",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-111",
          0
         ],
         "destination": [
          "obj-114",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-114",
          0
         ],
         "destination": [
          "obj-115",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-109",
          0
         ],
         "destination": [
          "obj-116",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-110",
          0
         ],
         "destination": [
          "obj-116",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-111",
          0
         ],
         "destination": [
          "obj-116",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-112",
          0
         ],
         "destination": [
          "obj-116",
          3
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-115",
          0
         ],
         "destination": [
          "obj-116",
          4
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-118",
          0
         ],
         "destination": [
          "obj-119",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-120",
          0
         ],
         "destination": [
          "obj-121",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-107",
          0
         ],
         "destination": [
          "obj-122",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-121",
          0
         ],
         "destination": [
          "obj-122",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-9",
          0
         ],
         "destination": [
          "obj-123",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-123",
          0
         ],
         "destination": [
          "obj-125",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-124",
          0
         ],
         "destination": [
          "obj-125",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-119",
          0
         ],
         "destination": [
          "obj-126",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-122",
          0
         ],
         "destination": [
          "obj-126",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-126",
          0
         ],
         "destination": [
          "obj-127",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-125",
          0
         ],
         "destination": [
          "obj-127",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-127",
          0
         ],
         "destination": [
          "obj-128",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-25",
          0
         ],
         "destination": [
          "obj-128",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-128",
          0
         ],
         "destination": [
          "obj-129",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-129",
          0
         ],
         "destination": [
          "obj-130",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-98",
          0
         ],
         "destination": [
          "obj-132",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-130",
          0
         ],
         "destination": [
          "obj-132",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-131",
          0
         ],
         "destination": [
          "obj-132",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-132",
          0
         ],
         "destination": [
          "obj-133",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-116",
          0
         ],
         "destination": [
          "obj-133",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-134",
          0
         ],
         "destination": [
          "obj-135",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-133",
          0
         ],
         "destination": [
          "obj-136",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-135",
          0
         ],
         "destination": [
          "obj-136",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-136",
          0
         ],
         "destination": [
          "obj-139",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-136",
          0
         ],
         "destination": [
          "obj-139",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-137",
          0
         ],
         "destination": [
          "obj-139",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-138",
          0
         ],
         "destination": [
          "obj-139",
          3
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-140",
          0
         ],
         "destination": [
          "obj-141",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-139",
          0
         ],
         "destination": [
          "obj-142",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-140",
          0
         ],
         "destination": [
          "obj-142",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-136",
          0
         ],
         "destination": [
          "obj-143",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-141",
          0
         ],
         "destination": [
          "obj-143",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-142",
          0
         ],
         "destination": [
          "obj-144",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-143",
          0
         ],
         "destination": [
          "obj-144",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-144",
          0
         ],
         "destination": [
          "obj-145",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-139",
          1
         ],
         "destination": [
          "obj-146",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-140",
          0
         ],
         "destination": [
          "obj-146",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-136",
          0
         ],
         "destination": [
          "obj-147",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-141",
          0
         ],
         "destination": [
          "obj-147",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-146",
          0
         ],
         "destination": [
          "obj-148",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-147",
          0
         ],
         "destination": [
          "obj-148",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-148",
          0
         ],
         "destination": [
          "obj-149",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "obj-241",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1060,
      20,
      120,
      20
     ],
     "text": "the DSP is in",
     "fontsize": 10.0,
     "textcolor": [
      0.96,
      0.9,
      0.78,
      1
     ]
    }
   },
   {
    "box": {
     "id": "obj-242",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      50,
      1400,
      790
     ],
     "bgcolor": [
      0.42,
      0.26,
      0.14,
      1.0
     ],
     "background": 1,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      0,
      0,
      1400,
      790
     ]
    }
   },
   {
    "box": {
     "id": "obj-243",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      80,
      6,
      790
     ],
     "bgcolor": [
      0.32,
      0.19,
      0.1,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      8,
      0,
      6,
      790
     ]
    }
   },
   {
    "box": {
     "id": "obj-244",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      110,
      6,
      790
     ],
     "bgcolor": [
      0.32,
      0.19,
      0.1,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1386,
      0,
      6,
      790
     ]
    }
   },
   {
    "box": {
     "id": "obj-245",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      140,
      1340,
      405
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "background": 1,
     "rounded": 6,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      30,
      15,
      1340,
      405
     ]
    }
   },
   {
    "box": {
     "id": "obj-246",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      170,
      1340,
      305
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "background": 1,
     "rounded": 6,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      30,
      470,
      1340,
      305
     ]
    }
   },
   {
    "box": {
     "id": "obj-247",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      200,
      2,
      345
     ],
     "bgcolor": [
      0.55,
      0.55,
      0.52,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      230,
      30,
      2,
      345
     ]
    }
   },
   {
    "box": {
     "id": "obj-248",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      230,
      2,
      345
     ],
     "bgcolor": [
      0.55,
      0.55,
      0.52,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      590,
      30,
      2,
      345
     ]
    }
   },
   {
    "box": {
     "id": "obj-249",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      260,
      2,
      345
     ],
     "bgcolor": [
      0.55,
      0.55,
      0.52,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      800,
      30,
      2,
      345
     ]
    }
   },
   {
    "box": {
     "id": "obj-250",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      290,
      2,
      345
     ],
     "bgcolor": [
      0.55,
      0.55,
      0.52,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1150,
      30,
      2,
      345
     ]
    }
   },
   {
    "box": {
     "id": "obj-251",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      320,
      1320,
      2
     ],
     "bgcolor": [
      0.55,
      0.55,
      0.52,
      1
     ],
     "background": 1,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      40,
      355,
      1320,
      2
     ]
    }
   },
   {
    "box": {
     "id": "obj-252",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      350,
      200,
      24.0
     ],
     "text": "CONTROLLERS",
     "fontsize": 14.0,
     "fontface": 1,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      30,
      368,
      200,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-253",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      380,
      360,
      24.0
     ],
     "text": "OSCILLATOR BANK",
     "fontsize": 14.0,
     "fontface": 1,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      230,
      368,
      360,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-254",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      410,
      210,
      24.0
     ],
     "text": "MIXER",
     "fontsize": 14.0,
     "fontface": 1,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      590,
      368,
      210,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-255",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      440,
      350,
      24.0
     ],
     "text": "MODIFIERS",
     "fontsize": 14.0,
     "fontface": 1,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      800,
      368,
      350,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-256",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      470,
      220,
      24.0
     ],
     "text": "OUTPUT",
     "fontsize": 14.0,
     "fontface": 1,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1150,
      368,
      220,
      24.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-257",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      500,
      600,
      40.0
     ],
     "text": "mood",
     "fontsize": 30.0,
     "fontface": 3,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Georgia",
     "presentation": 1,
     "presentation_rect": [
      40,
      425,
      600,
      40.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-258",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      530,
      720,
      22.0
     ],
     "text": "squinewave~  +  moogladder2~  +  reverbsc2~   -   Csound opcodes in Max",
     "fontsize": 12.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.85,
      0.7,
      1
     ],
     "textjustification": 2,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      640,
      437,
      720,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-259",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      560,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      53,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-260",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      590,
      26,
      18.0
     ],
     "text": "-2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      38,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-261",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      620,
      30,
      18.0
     ],
     "text": "2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      102,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-262",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      650,
      96,
      19.0
     ],
     "text": "TUNE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      35,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-263",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      680,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.004,
     "min": -2,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      60,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-264",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      710,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -2) / 0.004"
    }
   },
   {
    "box": {
     "id": "obj-265",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      740,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-266",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      770,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      138,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-267",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      800,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      123,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-268",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      830,
      30,
      18.0
     ],
     "text": "2000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      187,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-269",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      860,
      96,
      19.0
     ],
     "text": "GLIDE MS",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      120,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-270",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      890,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 2.0,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      145,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-271",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      920,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 2"
    }
   },
   {
    "box": {
     "id": "obj-272",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      950,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-273",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      980,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      93,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-274",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1010,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      78,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-275",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1040,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      142,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-276",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1070,
      96,
      19.0
     ],
     "text": "OSC3 <-> NOISE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      75,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-277",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      1100,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      100,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-278",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1130,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-279",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1160,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-280",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1190,
      84,
      19.0
     ],
     "text": "OSC MOD",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      35,
      262,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-281",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1220,
      84,
      19.0
     ],
     "text": "FILTER MOD",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      115,
      262,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-282",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1250,
      60,
      20.0
     ],
     "text": "OSC 1",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      238,
      22,
      60,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-283",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1280,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      248,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-284",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1310,
      26,
      18.0
     ],
     "text": "-2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      233,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-285",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1340,
      30,
      18.0
     ],
     "text": "2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      297,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-286",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1370,
      96,
      19.0
     ],
     "text": "OCTAVE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      230,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-287",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      1400,
      46,
      46
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "size": 4,
     "mult": 1,
     "min": -2,
     "floatoutput": 0,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      255,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-288",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1430,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -2) / 1"
    }
   },
   {
    "box": {
     "id": "obj-289",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1460,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-290",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1490,
      140,
      19.0
     ],
     "text": "WAVEFORM",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      430,
      54,
      140,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-291",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1520,
      60,
      20.0
     ],
     "text": "OSC 2",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      238,
      122,
      60,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-292",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1550,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      248,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-293",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1580,
      26,
      18.0
     ],
     "text": "-2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      233,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-294",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1610,
      30,
      18.0
     ],
     "text": "2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      297,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-295",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1640,
      96,
      19.0
     ],
     "text": "OCTAVE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      230,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-296",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      1670,
      46,
      46
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "size": 4,
     "mult": 1,
     "min": -2,
     "floatoutput": 0,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      255,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-297",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1700,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -2) / 1"
    }
   },
   {
    "box": {
     "id": "obj-298",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1730,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-299",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1760,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      338,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-300",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1790,
      26,
      18.0
     ],
     "text": "-7",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      323,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-301",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1820,
      30,
      18.0
     ],
     "text": "7",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      387,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-302",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1850,
      96,
      19.0
     ],
     "text": "DETUNE ST",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      320,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-303",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      1880,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.014,
     "min": -7,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      345,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-304",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1910,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -7) / 0.014"
    }
   },
   {
    "box": {
     "id": "obj-305",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      1940,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-306",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      1970,
      140,
      19.0
     ],
     "text": "WAVEFORM",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      430,
      154,
      140,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-307",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2000,
      60,
      20.0
     ],
     "text": "OSC 3",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      238,
      222,
      60,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-308",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2030,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      248,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-309",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2060,
      26,
      18.0
     ],
     "text": "-6",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      233,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-310",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2090,
      30,
      18.0
     ],
     "text": "2",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      297,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-311",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2120,
      96,
      19.0
     ],
     "text": "OCTAVE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      230,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-312",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      2150,
      46,
      46
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0,
     "size": 8,
     "mult": 1,
     "min": -6,
     "floatoutput": 0,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      255,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-313",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2180,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -6) / 1"
    }
   },
   {
    "box": {
     "id": "obj-314",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2210,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-315",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2240,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      338,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-316",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2270,
      26,
      18.0
     ],
     "text": "-7",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      323,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-317",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2300,
      30,
      18.0
     ],
     "text": "7",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      387,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-318",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2330,
      96,
      19.0
     ],
     "text": "DETUNE ST",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      320,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-319",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      2360,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.014,
     "min": -7,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      345,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-320",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2390,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - -7) / 0.014"
    }
   },
   {
    "box": {
     "id": "obj-321",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2420,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-322",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2450,
      95,
      19.0
     ],
     "text": "WAVEFORM",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      430,
      254,
      95,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-323",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2480,
      84,
      19.0
     ],
     "text": "SYNC 2>1",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      315,
      54,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-324",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2510,
      84,
      19.0
     ],
     "text": "KBD",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      520,
      254,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-325",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2540,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      618,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-326",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2570,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      603,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-327",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2600,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      667,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-328",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2630,
      96,
      19.0
     ],
     "text": "OSC 1",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      600,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-329",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      2660,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      625,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-330",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2690,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-331",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2720,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-332",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2750,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      618,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-333",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2780,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      603,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-334",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2810,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      667,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-335",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2840,
      96,
      19.0
     ],
     "text": "OSC 2",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      600,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-336",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      2870,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      625,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-337",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2900,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-338",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      2930,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-339",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2960,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      618,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-340",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      2990,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      603,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-341",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3020,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      667,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-342",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3050,
      96,
      19.0
     ],
     "text": "OSC 3",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      600,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-343",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      3080,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      625,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-344",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3110,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-345",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3140,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-346",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3170,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      718,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-347",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3200,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      703,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-348",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3230,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      767,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-349",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3260,
      96,
      19.0
     ],
     "text": "NOISE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      700,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-350",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      3290,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      725,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-351",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3320,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-352",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3350,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-353",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3380,
      84,
      19.0
     ],
     "text": "PINK",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      695,
      154,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-354",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3410,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      718,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-355",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3440,
      26,
      18.0
     ],
     "text": "0.1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      703,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-356",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3470,
      30,
      18.0
     ],
     "text": "4",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      767,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-357",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3500,
      96,
      19.0
     ],
     "text": "DRIVE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      700,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-358",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      3530,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.0039,
     "min": 0.1,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      725,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-359",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3560,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0.1) / 0.0039"
    }
   },
   {
    "box": {
     "id": "obj-360",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3590,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-361",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3620,
      200,
      20.0
     ],
     "text": "FILTER",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      22,
      200,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-362",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3650,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      828,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-363",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3680,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      813,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-364",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3710,
      30,
      18.0
     ],
     "text": "135",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      877,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-365",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3740,
      96,
      19.0
     ],
     "text": "CUTOFF (NOTE)",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-366",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      3770,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.135,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      835,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-367",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3800,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.135"
    }
   },
   {
    "box": {
     "id": "obj-368",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      3830,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-369",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3860,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      908,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-370",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3890,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      893,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-371",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3920,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      957,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-372",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      3950,
      96,
      19.0
     ],
     "text": "EMPHASIS",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      890,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-373",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      3980,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      915,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-374",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4010,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-375",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4040,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-376",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4070,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      988,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-377",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4100,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      973,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-378",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4130,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1037,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-379",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4160,
      96,
      19.0
     ],
     "text": "CONTOUR AMT",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      970,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-380",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      4190,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      995,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-381",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4220,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-382",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4250,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-383",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4280,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1068,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-384",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4310,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1053,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-385",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4340,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1117,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-386",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4370,
      96,
      19.0
     ],
     "text": "KBD TRACK",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1050,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-387",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      4400,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1075,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-388",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4430,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-389",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4460,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-390",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4490,
      200,
      20.0
     ],
     "text": "FILTER CONTOUR",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      122,
      200,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-391",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4520,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      828,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-392",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4550,
      26,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      813,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-393",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4580,
      30,
      18.0
     ],
     "text": "5000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      877,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-394",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4610,
      96,
      19.0
     ],
     "text": "ATTACK",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-395",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      4640,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 4.999,
     "min": 1,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      835,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-396",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4670,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 1) / 4.999"
    }
   },
   {
    "box": {
     "id": "obj-397",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4700,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-398",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4730,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      908,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-399",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4760,
      26,
      18.0
     ],
     "text": "5",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      893,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-400",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4790,
      30,
      18.0
     ],
     "text": "5000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      957,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-401",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4820,
      96,
      19.0
     ],
     "text": "DECAY",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      890,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-402",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      4850,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 4.995,
     "min": 5,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      915,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-403",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4880,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 5) / 4.995"
    }
   },
   {
    "box": {
     "id": "obj-404",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      4910,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-405",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4940,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      988,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-406",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      4970,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      973,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-407",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5000,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1037,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-408",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5030,
      96,
      19.0
     ],
     "text": "SUSTAIN",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      970,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-409",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      5060,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      995,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-410",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5090,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-411",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5120,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-412",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5150,
      200,
      20.0
     ],
     "text": "LOUDNESS CONTOUR",
     "fontsize": 10.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      222,
      200,
      20.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-413",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5180,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      828,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-414",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5210,
      26,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      813,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-415",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5240,
      30,
      18.0
     ],
     "text": "5000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      877,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-416",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5270,
      96,
      19.0
     ],
     "text": "ATTACK",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      810,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-417",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      5300,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 4.999,
     "min": 1,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      835,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-418",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5330,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 1) / 4.999"
    }
   },
   {
    "box": {
     "id": "obj-419",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5360,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-420",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5390,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      908,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-421",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5420,
      26,
      18.0
     ],
     "text": "5",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      893,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-422",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5450,
      30,
      18.0
     ],
     "text": "5000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      957,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-423",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5480,
      96,
      19.0
     ],
     "text": "DECAY",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      890,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-424",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      5510,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 4.995,
     "min": 5,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      915,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-425",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5540,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 5) / 4.995"
    }
   },
   {
    "box": {
     "id": "obj-426",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5570,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-427",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5600,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      988,
      253,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-428",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5630,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      973,
      308,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-429",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5660,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1037,
      308,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-430",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5690,
      96,
      19.0
     ],
     "text": "SUSTAIN",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      970,
      238,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-431",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      5720,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      995,
      260,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-432",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5750,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-433",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5780,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-434",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5810,
      84,
      19.0
     ],
     "text": "DECAY",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1050,
      254,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-435",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5840,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1178,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-436",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5870,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1163,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-437",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5900,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1227,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-438",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      5930,
      96,
      19.0
     ],
     "text": "VOLUME",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1160,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-439",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      5960,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1185,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-440",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      5990,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-441",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6020,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-442",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6050,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1283,
      53,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-443",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6080,
      26,
      18.0
     ],
     "text": "0",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1268,
      108,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-444",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6110,
      30,
      18.0
     ],
     "text": "1",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1332,
      108,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-445",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6140,
      96,
      19.0
     ],
     "text": "REVERB",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1265,
      38,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-446",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      6170,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1290,
      60,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-447",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6200,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-448",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6230,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-449",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6260,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1178,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-450",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6290,
      26,
      18.0
     ],
     "text": "0.5",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1163,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-451",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6320,
      30,
      18.0
     ],
     "text": "0.99",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1227,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-452",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6350,
      96,
      19.0
     ],
     "text": "SIZE",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1160,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-453",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      6380,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.00049,
     "min": 0.5,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1185,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-454",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6410,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0.5) / 0.00049"
    }
   },
   {
    "box": {
     "id": "obj-455",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6440,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-456",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6470,
      60,
      60
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 30,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1283,
      153,
      60,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-457",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6500,
      26,
      18.0
     ],
     "text": "500",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1268,
      208,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-458",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6530,
      30,
      18.0
     ],
     "text": "16000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1332,
      208,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-459",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6560,
      96,
      19.0
     ],
     "text": "TONE HZ",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1265,
      138,
      96,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-460",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      6590,
      46,
      46
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 15.5,
     "min": 500,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1290,
      160,
      46,
      46
     ]
    }
   },
   {
    "box": {
     "id": "obj-461",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6620,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 500) / 15.5"
    }
   },
   {
    "box": {
     "id": "obj-462",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6650,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-463",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6680,
      80,
      19.0
     ],
     "text": "MOD WHEEL",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      37,
      508,
      80,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-464",
     "maxclass": "slider",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      6710,
      30,
      170
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.001,
     "min": 0,
     "floatoutput": 1,
     "bgcolor": [
      0.15,
      0.15,
      0.15,
      1
     ],
     "knobcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "knobshape": 0,
     "presentation": 1,
     "presentation_rect": [
      62,
      530,
      30,
      170
     ]
    }
   },
   {
    "box": {
     "id": "obj-465",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6740,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 0) / 0.001"
    }
   },
   {
    "box": {
     "id": "obj-466",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      6770,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-467",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6800,
      70,
      18.0
     ],
     "text": "(wheel)",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      40,
      710,
      70,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-468",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6830,
      340,
      22.0
     ],
     "text": "PRESETS",
     "fontsize": 12.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1015,
      480,
      340,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-469",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6860,
      340,
      22.0
     ],
     "text": "SEQUENCER",
     "fontsize": 12.0,
     "fontface": 1,
     "textcolor": [
      1.0,
      0.52,
      0.1,
      1.0
     ],
     "textjustification": 0,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1015,
      640,
      340,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-470",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6890,
      48,
      48
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 24,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1063,
      715,
      48,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-471",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6920,
      26,
      18.0
     ],
     "text": "60",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1048,
      758,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-472",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6950,
      30,
      18.0
     ],
     "text": "1000",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1100,
      758,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-473",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      6980,
      84,
      19.0
     ],
     "text": "STEP MS",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1045,
      700,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-474",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      7010,
      34,
      34
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.94,
     "min": 60,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1070,
      722,
      34,
      34
     ]
    }
   },
   {
    "box": {
     "id": "obj-475",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      7040,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 60) / 0.94"
    }
   },
   {
    "box": {
     "id": "obj-476",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      7070,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "obj-477",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      7100,
      48,
      48
     ],
     "bgcolor": [
      0.78,
      0.76,
      0.72,
      1
     ],
     "rounded": 24,
     "background": 0,
     "mode": 0,
     "border": 0,
     "presentation": 1,
     "presentation_rect": [
      1153,
      715,
      48,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-478",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      7130,
      26,
      18.0
     ],
     "text": "5",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1138,
      758,
      26,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-479",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      7160,
      30,
      18.0
     ],
     "text": "100",
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.75,
      0.75,
      0.75,
      1
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1190,
      758,
      30,
      18.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-480",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1450,
      7190,
      84,
      19.0
     ],
     "text": "GATE %",
     "fontsize": 9.0,
     "fontface": 0,
     "textcolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "textjustification": 1,
     "fontname": "Arial",
     "presentation": 1,
     "presentation_rect": [
      1135,
      700,
      84,
      19.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-481",
     "maxclass": "dial",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1450,
      7220,
      34,
      34
     ],
     "outlettype": [
      "float"
     ],
     "parameter_enable": 0,
     "size": 1000,
     "mult": 0.095,
     "min": 5,
     "floatoutput": 1,
     "needlecolor": [
      0.93,
      0.9,
      0.82,
      1.0
     ],
     "outlinecolor": [
      0.35,
      0.35,
      0.35,
      1
     ],
     "bgcolor": [
      0.07,
      0.07,
      0.075,
      1.0
     ],
     "fgcolor": [
      0.2,
      0.2,
      0.2,
      1
     ],
     "thickness": 45.0,
     "degrees": 300,
     "presentation": 1,
     "presentation_rect": [
      1160,
      722,
      34,
      34
     ]
    }
   },
   {
    "box": {
     "id": "obj-482",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      7250,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr ($f1 - 5) / 0.095"
    }
   },
   {
    "box": {
     "id": "obj-483",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1510,
      7280,
      93,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
      0
     ],
     "destination": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-44",
      0
     ],
     "destination": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-48",
      0
     ],
     "destination": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-52",
      0
     ],
     "destination": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-56",
      0
     ],
     "destination": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-57",
      0
     ],
     "destination": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-60",
      0
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-64",
      0
     ],
     "destination": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-65",
      0
     ],
     "destination": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      0
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      0
     ],
     "destination": [
      "obj-74",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-82",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-83",
      0
     ],
     "destination": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-92",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-105",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-107",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-109",
      0
     ],
     "destination": [
      "obj-110",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-113",
      0
     ],
     "destination": [
      "obj-114",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-117",
      0
     ],
     "destination": [
      "obj-118",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
      0
     ],
     "destination": [
      "obj-119",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-124",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-131",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-132",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      0
     ],
     "destination": [
      "obj-136",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-137",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-141",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-145",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-147",
      0
     ],
     "destination": [
      "obj-148",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-153",
      0
     ],
     "destination": [
      "obj-154",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-155",
      0
     ],
     "destination": [
      "obj-156",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-158",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-159",
      0
     ],
     "destination": [
      "obj-160",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-162",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-165",
      0
     ],
     "destination": [
      "obj-166",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-168",
      0
     ],
     "destination": [
      "obj-153",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-173",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-175",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      1
     ],
     "destination": [
      "obj-174",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      0
     ],
     "destination": [
      "obj-176",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      0
     ],
     "destination": [
      "obj-178",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-176",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-179",
      0
     ],
     "destination": [
      "obj-180",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-180",
      0
     ],
     "destination": [
      "obj-181",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      0
     ],
     "destination": [
      "obj-183",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-180",
      1
     ],
     "destination": [
      "obj-184",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      1
     ],
     "destination": [
      "obj-185",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-181",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      1
     ],
     "destination": [
      "obj-186",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-187",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-187",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-183",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      0
     ],
     "destination": [
      "obj-193",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      0
     ],
     "destination": [
      "obj-197",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-198",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-199",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-199",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-199",
      0
     ],
     "destination": [
      "obj-201",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      0
     ],
     "destination": [
      "obj-202",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-202",
      0
     ],
     "destination": [
      "obj-203",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-203",
      1
     ],
     "destination": [
      "obj-204",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-204",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-205",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      0
     ],
     "destination": [
      "obj-205",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      0
     ],
     "destination": [
      "obj-207",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-203",
      0
     ],
     "destination": [
      "obj-208",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-207",
      0
     ],
     "destination": [
      "obj-208",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-208",
      0
     ],
     "destination": [
      "obj-209",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-209",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-211",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-202",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-214",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-202",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-215",
      0
     ],
     "destination": [
      "obj-216",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-216",
      0
     ],
     "destination": [
      "obj-202",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-217",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      0
     ],
     "destination": [
      "obj-222",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-223",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-227",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-229",
      0
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-230",
      0
     ],
     "destination": [
      "obj-231",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-233",
      0
     ],
     "destination": [
      "obj-234",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      0
     ],
     "destination": [
      "obj-238",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-238",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      0
     ],
     "destination": [
      "obj-239",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-263",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-264",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-264",
      0
     ],
     "destination": [
      "obj-265",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-265",
      0
     ],
     "destination": [
      "obj-263",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-270",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-271",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-271",
      0
     ],
     "destination": [
      "obj-272",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-272",
      0
     ],
     "destination": [
      "obj-270",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-278",
      0
     ],
     "destination": [
      "obj-279",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-279",
      0
     ],
     "destination": [
      "obj-277",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-287",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-288",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-288",
      0
     ],
     "destination": [
      "obj-289",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      0
     ],
     "destination": [
      "obj-287",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-296",
      0
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-44",
      0
     ],
     "destination": [
      "obj-297",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-298",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-298",
      0
     ],
     "destination": [
      "obj-296",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-303",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-48",
      0
     ],
     "destination": [
      "obj-304",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-304",
      0
     ],
     "destination": [
      "obj-305",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-305",
      0
     ],
     "destination": [
      "obj-303",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      0
     ],
     "destination": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-57",
      0
     ],
     "destination": [
      "obj-313",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      0
     ],
     "destination": [
      "obj-314",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-314",
      0
     ],
     "destination": [
      "obj-312",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      0
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-320",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-320",
      0
     ],
     "destination": [
      "obj-321",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-321",
      0
     ],
     "destination": [
      "obj-319",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-329",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-330",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-330",
      0
     ],
     "destination": [
      "obj-331",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-331",
      0
     ],
     "destination": [
      "obj-329",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-83",
      0
     ],
     "destination": [
      "obj-337",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-337",
      0
     ],
     "destination": [
      "obj-338",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-338",
      0
     ],
     "destination": [
      "obj-336",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-344",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-344",
      0
     ],
     "destination": [
      "obj-345",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-345",
      0
     ],
     "destination": [
      "obj-343",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-350",
      0
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-351",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-351",
      0
     ],
     "destination": [
      "obj-352",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-350",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-359",
      0
     ],
     "destination": [
      "obj-360",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-360",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-366",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-367",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-367",
      0
     ],
     "destination": [
      "obj-368",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-368",
      0
     ],
     "destination": [
      "obj-366",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-373",
      0
     ],
     "destination": [
      "obj-110",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-374",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-374",
      0
     ],
     "destination": [
      "obj-375",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-375",
      0
     ],
     "destination": [
      "obj-373",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-380",
      0
     ],
     "destination": [
      "obj-114",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-381",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-382",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-382",
      0
     ],
     "destination": [
      "obj-380",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-387",
      0
     ],
     "destination": [
      "obj-118",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
      0
     ],
     "destination": [
      "obj-388",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-388",
      0
     ],
     "destination": [
      "obj-389",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-389",
      0
     ],
     "destination": [
      "obj-387",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-395",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-396",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-396",
      0
     ],
     "destination": [
      "obj-397",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-397",
      0
     ],
     "destination": [
      "obj-395",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-402",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-403",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-403",
      0
     ],
     "destination": [
      "obj-404",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-404",
      0
     ],
     "destination": [
      "obj-402",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-409",
      0
     ],
     "destination": [
      "obj-131",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-410",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-410",
      0
     ],
     "destination": [
      "obj-411",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-411",
      0
     ],
     "destination": [
      "obj-409",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-417",
      0
     ],
     "destination": [
      "obj-136",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-418",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-418",
      0
     ],
     "destination": [
      "obj-419",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-419",
      0
     ],
     "destination": [
      "obj-417",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-424",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-425",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-425",
      0
     ],
     "destination": [
      "obj-426",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-426",
      0
     ],
     "destination": [
      "obj-424",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-431",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-432",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-432",
      0
     ],
     "destination": [
      "obj-433",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-433",
      0
     ],
     "destination": [
      "obj-431",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-439",
      0
     ],
     "destination": [
      "obj-222",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-440",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-440",
      0
     ],
     "destination": [
      "obj-441",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-441",
      0
     ],
     "destination": [
      "obj-439",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-446",
      0
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-447",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-447",
      0
     ],
     "destination": [
      "obj-448",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-448",
      0
     ],
     "destination": [
      "obj-446",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-453",
      0
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-230",
      0
     ],
     "destination": [
      "obj-454",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-454",
      0
     ],
     "destination": [
      "obj-455",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-455",
      0
     ],
     "destination": [
      "obj-453",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-460",
      0
     ],
     "destination": [
      "obj-234",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-461",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-461",
      0
     ],
     "destination": [
      "obj-462",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-462",
      0
     ],
     "destination": [
      "obj-460",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-464",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
     ],
     "destination": [
      "obj-465",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-465",
      0
     ],
     "destination": [
      "obj-466",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-466",
      0
     ],
     "destination": [
      "obj-464",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-474",
      0
     ],
     "destination": [
      "obj-193",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-475",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-475",
      0
     ],
     "destination": [
      "obj-476",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-476",
      0
     ],
     "destination": [
      "obj-474",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-481",
      0
     ],
     "destination": [
      "obj-197",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-482",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-482",
      0
     ],
     "destination": [
      "obj-483",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-483",
      0
     ],
     "destination": [
      "obj-481",
      0
     ]
    }
   }
  ],
  "openinpresentation": 1
 }
}