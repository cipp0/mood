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
   40,
   30,
   1050,
   700
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
      20,
      10,
      300,
      32
     ],
     "text": "reverbsc2~",
     "fontsize": 24.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      157,
      18,
      700,
      22
     ],
     "text": "stereo reverb, Csound 7's lighter version (linear interpolation)"
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
      50,
      980,
      50
     ],
     "text": "Eight delay lines feed each other through a scattering junction (Julius O. Smith's waveguide networks); their lengths wander slowly at random, so the tail is smooth and never metallic. The Csound reverb everybody uses. Add the folder of the .mxo files to Max's search path (Options > File Preferences)."
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 0,
     "patching_rect": [
      20,
      100,
      90,
      22
     ],
     "outlettype": [],
     "text": "p reference",
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
       200,
       100,
       820,
       700
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
          15,
          15,
          780,
          22
         ],
         "text": "reverbsc2~ [feedback] [lpfreq] [pitchmod]"
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          39,
          780,
          22
         ],
         "text": "Defaults: feedback 0.85, lowpass 10000 Hz, pitch modulation 1."
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          75,
          780,
          22
         ],
         "text": "INLETS"
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          99,
          780,
          22
         ],
         "text": "1, 2: (signal) left and right input; messages"
        }
       },
       {
        "box": {
         "id": "obj-5",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          123,
          780,
          22
         ],
         "text": "3: (signal/float) feedback 0..1: the length of the tail (0.6 room, 0.85 hall, 0.95 cathedral)"
        }
       },
       {
        "box": {
         "id": "obj-6",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          147,
          780,
          22
         ],
         "text": "4: (signal/float) cutoff of the lowpass in the loop, Hz: darker tails with lower values"
        }
       },
       {
        "box": {
         "id": "obj-7",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          183,
          780,
          22
         ],
         "text": "OUTLETS"
        }
       },
       {
        "box": {
         "id": "obj-8",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          207,
          780,
          22
         ],
         "text": "1, 2: (signal) left and right reverberation (no dry signal)"
        }
       },
       {
        "box": {
         "id": "obj-9",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          243,
          780,
          22
         ],
         "text": "MESSAGES"
        }
       },
       {
        "box": {
         "id": "obj-10",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          267,
          780,
          36
         ],
         "text": "pitchmod <f>: depth of the random delay changes, 0..20 (1): 0 is static and can ring, higher is a chorus (rebuilds, silent)"
        }
       },
       {
        "box": {
         "id": "obj-11",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          305,
          780,
          22
         ],
         "text": "clear: silence the tail"
        }
       },
       {
        "box": {
         "id": "obj-12",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          341,
          780,
          22
         ],
         "text": "NOTES"
        }
       },
       {
        "box": {
         "id": "obj-13",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          365,
          780,
          36
         ],
         "text": "Csound opcodes: reverbsc, reverbsc2 (Csound 7: linear interpolation of the delays, lighter). reverbsc~ output matches Csound 6.18 within 8e-9."
        }
       },
       {
        "box": {
         "id": "obj-14",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          403,
          780,
          50
         ],
         "text": "Feedback and cutoff are read once per block, as Csound's k-rate arguments. Port: the feedback is kept below 1, input NaN become 0. Csound's isr argument (the rate the delay times are computed for) is the host sample rate here."
        }
       },
       {
        "box": {
         "id": "obj-15",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          455,
          780,
          22
         ],
         "text": "Copyright 1999, 2005 Sean Costello and Istvan Varga, LGPL 2.1."
        }
       }
      ],
      "lines": []
     }
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      140,
      250,
      22
     ],
     "text": "1. Something to reverberate"
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      170,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      50,
      172,
      80,
      22
     ],
     "text": "drum hits"
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      200,
      86,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "metro 1200"
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      227,
      65,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1, 0 20"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      254,
      51,
      22
     ],
     "outlettype": [
      "signal",
      "bang"
     ],
     "text": "line~"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      100,
      227,
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
     "id": "obj-12",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      100,
      281,
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
     "id": "obj-13",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      200,
      170,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      230,
      172,
      60,
      22
     ],
     "text": "plucks"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      200,
      79,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "metro 400"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      227,
      79,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "random 15"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      254,
      44,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "+ 60"
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      200,
      281,
      44,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "mtof"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      200,
      308,
      177,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "squinewave~ 220 0.4 0.6"
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      370,
      281,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.4, 0 250"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      370,
      308,
      51,
      22
     ],
     "outlettype": [
      "signal",
      "bang"
     ],
     "text": "line~"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      338,
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
     "id": "obj-23",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      470,
      170,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      500,
      172,
      170,
      36
     ],
     "text": "adc~ (careful: feedback)"
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      470,
      200,
      72,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "adc~ 1 2"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      470,
      227,
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
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      550,
      227,
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
     "id": "obj-28",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      680,
      140,
      300,
      22
     ],
     "text": "2. Spaces: feedback and lowpass"
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      680,
      165,
      50,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      830,
      165,
      50,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      735,
      165,
      70,
      22
     ],
     "text": "feedback"
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      885,
      165,
      80,
      22
     ],
     "text": "lowpass Hz"
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      680,
      330,
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
     "id": "obj-34",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      195,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.6 12000"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780,
      195,
      120,
      22
     ],
     "text": "small room"
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      220,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.85 10000"
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780,
      220,
      120,
      22
     ],
     "text": "hall"
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      245,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.95 6000"
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780,
      245,
      120,
      22
     ],
     "text": "cathedral"
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      270,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.99 3000"
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780,
      270,
      120,
      22
     ],
     "text": "dark, endless"
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      295,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.9999 2000"
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      780,
      295,
      120,
      22
     ],
     "text": "freeze"
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      365,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pitchmod 0"
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      765,
      365,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pitchmod 1"
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      850,
      365,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pitchmod 5"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      935,
      365,
      80,
      36
     ],
     "outlettype": [
      ""
     ],
     "text": "pitchmod 20"
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      395,
      51,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "clear"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      920,
      195,
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
     "id": "obj-50",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      920,
      222,
      86,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.85 10000"
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      20,
      440,
      163,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "reverbsc2~ 0.85 10000"
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      250,
      440,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      280,
      442,
      50,
      22
     ],
     "text": "+ dry"
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      250,
      470,
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
     "id": "obj-55",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      535,
      58,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "*~ 0.3"
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      130,
      535,
      58,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "*~ 0.3"
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      90,
      505,
      50,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      145,
      505,
      60,
      22
     ],
     "text": "volume"
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      20,
      570,
      45,
      45
     ]
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      75,
      585,
      180,
      36
     ],
     "text": "click to turn audio on/off"
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      270,
      505,
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
     "id": "obj-62",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      270,
      532,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.3"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-6",
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
      "obj-10",
      0
     ],
     "destination": [
      "obj-12",
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
      "obj-15",
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
      "obj-17",
      0
     ],
     "destination": [
      "obj-18",
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
      "obj-25",
      0
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-25",
      1
     ],
     "destination": [
      "obj-27",
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
      "obj-26",
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
      "obj-27",
      1
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
      "obj-33",
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
      "obj-33",
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
      "obj-33",
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
      "obj-33",
      0
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
      "obj-33",
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
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      1
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
      "obj-50",
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
      "obj-12",
      0
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
      "obj-22",
      0
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
      "obj-26",
      0
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
      "obj-12",
      0
     ],
     "destination": [
      "obj-51",
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
      "obj-51",
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
      "obj-51",
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
      "obj-51",
      2
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
      "obj-51",
      3
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
      "obj-51",
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
      "obj-51",
      0
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
      "obj-51",
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
      "obj-51",
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
      "obj-51",
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
      "obj-54",
      0
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
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
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
      "obj-52",
      0
     ],
     "destination": [
      "obj-54",
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
      "obj-55",
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
      "obj-56",
      1
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
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      1
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
      "obj-55",
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
      "obj-59",
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
      "obj-59",
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
      "obj-62",
      0
     ],
     "destination": [
      "obj-57",
      0
     ]
    }
   }
  ]
 }
}