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
     "text": "squinewave~",
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
      170,
      18,
      700,
      22
     ],
     "text": "sine, square, saw and pulse from one morphing oscillator"
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
     "text": "A cosine whose sweeps get shorter: clip squeezes both halves (sine to square), skew moves the middle (towards saw and narrow pulses). The sweeps are never shorter than a few samples, so the edges stay band limited without tables. Hard sync and through zero FM included. Add the folder of the .mxo files to Max's search path (Options > File Preferences)."
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
         "text": "squinewave~ [freq] [clip] [skew] [minsweep] [phase]"
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
         "text": "Defaults: 220 Hz, clip 0, skew 0, minsweep sr/3000 (at least 8), phase at the up zero crossing."
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
         "text": "1: (signal/float) frequency in Hz; negative runs the wave backwards (through zero FM); messages"
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
         "text": "2: (signal/float) clip 0..1: 0 sine-like, 1 square-like"
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
         "text": "3: (signal/float) skew -1..1: 0 symmetric, towards +-1 a saw or a narrow pulse"
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
          171,
          780,
          22
         ],
         "text": "4: (signal) sync: a sample >= 1 starts a new cycle (hard sync)"
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
         "text": "OUTLETS"
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
          231,
          780,
          22
         ],
         "text": "1: (signal) the wave -1..1"
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
          255,
          780,
          22
         ],
         "text": "2: (signal) 1 at the start of each cycle: sync another squinewave~"
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
          291,
          780,
          22
         ],
         "text": "MESSAGES"
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
          315,
          780,
          22
         ],
         "text": "phase <0..2>: restart at this phase (negative: the up zero crossing)"
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
          339,
          780,
          22
         ],
         "text": "minsweep <n>: shortest sweep in samples, 4..sr/100: higher is rounder and less aliased"
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
          375,
          780,
          22
         ],
         "text": "NOTES"
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
          399,
          780,
          36
         ],
         "text": "Csound opcode: squinewave (the Csound 7 version: fractional minsweep, sharper sync, through zero FM). Output matches Csound 6.18 within 3e-8 with positive frequencies."
        }
       },
       {
        "box": {
         "id": "obj-16",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          437,
          780,
          22
         ],
         "text": "Above sr/(2 minsweep) the wave becomes a pure sine."
        }
       },
       {
        "box": {
         "id": "obj-17",
         "maxclass": "comment",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          15,
          461,
          780,
          22
         ],
         "text": "Copyright 2017, 2024 rasmus ekman, LGPL 2.1."
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
     "text": "1. Shape: clip and skew"
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
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
     "id": "obj-7",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      120,
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
     "id": "obj-8",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      220,
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
     "id": "obj-9",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      190,
      50,
      22
     ],
     "text": "freq"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      120,
      190,
      50,
      22
     ],
     "text": "clip"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      220,
      190,
      50,
      22
     ],
     "text": "skew"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      350,
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
     "id": "obj-13",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      165,
      60,
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
     "id": "obj-14",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      165,
      160,
      22
     ],
     "text": "sine"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      190,
      60,
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
     "id": "obj-16",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      190,
      160,
      22
     ],
     "text": "square"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      215,
      60,
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
     "id": "obj-18",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      215,
      160,
      36
     ],
     "text": "saw-like (skewed sine)"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      240,
      60,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1 0.9"
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      240,
      160,
      22
     ],
     "text": "narrow pulse"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      265,
      60,
      36
     ],
     "outlettype": [
      ""
     ],
     "text": "0.5 -0.6"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      265,
      160,
      22
     ],
     "text": "in between"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      290,
      60,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0 -1"
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      290,
      160,
      22
     ],
     "text": "saw down"
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      220,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "55"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      75,
      220,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "110"
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      130,
      220,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "440"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      185,
      220,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1760"
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      250,
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
     "id": "obj-30",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      277,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "110"
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      307,
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
     "id": "obj-32",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      50,
      309,
      230,
      36
     ],
     "text": "slow sweep of clip and skew (LFO)"
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      337,
      44,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "cos~"
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      100,
      337,
      93,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "phasor~ 0.1"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      180,
      337,
      100,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "phasor~ 0.07"
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      180,
      364,
      44,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "cos~"
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      364,
      44,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "abs~"
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      391,
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
     "id": "obj-39",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      180,
      391,
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
     "id": "obj-40",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      20,
      440,
      121,
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
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      250,
      440,
      95,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "minsweep 4"
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      440,
      95,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "minsweep 15"
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      450,
      440,
      95,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "minsweep 60"
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      620,
      140,
      400,
      36
     ],
     "text": "2. Hard sync: a slave restarted by the cycles of a master"
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      620,
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
     "id": "obj-46",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      675,
      165,
      70,
      36
     ],
     "text": "master Hz"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      770,
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
     "id": "obj-48",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      825,
      165,
      130,
      36
     ],
     "text": "slave Hz: sweep it"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      960,
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
      960,
      222,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "55"
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1010,
      222,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "180"
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      620,
      200,
      114,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "squinewave~ 55"
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      770,
      240,
      177,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "squinewave~ 180 0.3 0.5"
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      620,
      280,
      350,
      22
     ],
     "text": "3. Through zero FM: the frequency goes negative"
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      620,
      305,
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
     "id": "obj-56",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      675,
      305,
      160,
      22
     ],
     "text": "FM depth Hz (try 300)"
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      620,
      332,
      79,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "cycle~ 73"
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      620,
      359,
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
     "id": "obj-59",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      620,
      386,
      58,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "+~ 110"
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 2,
     "patching_rect": [
      620,
      413,
      177,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "squinewave~ 110 0.2 0.3"
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      490,
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
     "id": "obj-62",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      50,
      492,
      80,
      22
     ],
     "text": "1 shapes"
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      150,
      490,
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
     "id": "obj-64",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      180,
      492,
      80,
      22
     ],
     "text": "2 sync"
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      280,
      490,
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
     "id": "obj-66",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      310,
      492,
      80,
      22
     ],
     "text": "3 FM"
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      520,
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
     "id": "obj-68",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      150,
      520,
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
     "id": "obj-69",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      280,
      520,
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
     "id": "obj-70",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      585,
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
     "id": "obj-71",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      130,
      585,
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
     "id": "obj-72",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      90,
      555,
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
     "id": "obj-73",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      145,
      555,
      60,
      22
     ],
     "text": "volume"
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      20,
      620,
      45,
      45
     ]
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      75,
      635,
      180,
      36
     ],
     "text": "click to turn audio on/off"
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      270,
      555,
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
     "id": "obj-77",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      270,
      582,
      44,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0.15"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-13",
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
      "obj-15",
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
      "obj-17",
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
      "obj-19",
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
      "obj-21",
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
      "obj-23",
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
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      1
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
      "obj-25",
      0
     ],
     "destination": [
      "obj-6",
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
      "obj-6",
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
      "obj-6",
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
      "obj-6",
      0
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
      "obj-30",
      0
     ],
     "destination": [
      "obj-6",
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
      "obj-37",
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
      "obj-38",
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
      "obj-31",
      0
     ],
     "destination": [
      "obj-38",
      1
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
      "obj-39",
      1
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
      "obj-40",
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
      "obj-40",
      1
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
      "obj-40",
      2
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
      "obj-40",
      1
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
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-41",
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
      "obj-42",
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
      "obj-40",
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
      "obj-50",
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
      "obj-51",
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
      "obj-45",
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
      "obj-47",
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
      "obj-52",
      1
     ],
     "destination": [
      "obj-53",
      3
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
      "obj-55",
      0
     ],
     "destination": [
      "obj-58",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
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
      "obj-59",
      0
     ],
     "destination": [
      "obj-60",
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
      "obj-67",
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
      "obj-67",
      1
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
      "obj-68",
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
      "obj-68",
      1
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
      "obj-69",
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
      "obj-69",
      1
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
      "obj-70",
      1
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
      "obj-71",
      1
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
      "obj-70",
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
      "obj-70",
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
      "obj-67",
      0
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
      0
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
      "obj-69",
      0
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
      "obj-70",
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
      "obj-71",
      0
     ],
     "destination": [
      "obj-74",
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
      "obj-77",
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
      "obj-72",
      0
     ]
    }
   }
  ]
 }
}