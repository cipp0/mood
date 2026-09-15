# mood

A monophonic synthesizer for **Max for Live** and **Max** inspired by **mooD** by Eugenio Giordani
and Alessandro Petrolati, which in turn follows the Minimoog Model D. It is built on three Csound
opcodes ported to plain C and wrapped as Max and Pd externals:

| External | Csound opcode | Author of the algorithm | Role in the synth |
|---|---|---|---|
| `squinewave~` | `squinewave` | Rasmus Ekman | the three oscillators |
| `moogladder2~` | `moogladder2` | Victor Lazzarini, after Antti Huovilainen | the ladder filter |
| `reverbsc2~` | `reverbsc2` | Sean Costello | stereo reverb on the output |

The DSP code is Csound's, freed from the Csound API (`core/`), with a thin wrapper per host
(`pd/`, `max/`). The externals are general purpose: use them in your own Max and Pd patches too.

> Not affiliated with Moog Music, nor with the authors of mooD. "Minimoog" and "Model D" are
> trademarks of their owners and are used here only to describe the design this instrument follows.

## Download

From [Releases](../../releases):

| File | Contents |
|---|---|
| `mood.amxd` | the Max for Live device, frozen: the externals for macOS and Windows are inside |
| `mood-<version>-macos.zip` | `max/`: device, `mood.maxpat`, `.mxo` (arm64 + x86_64); `pd/`: `.pd_darwin` |
| `mood-<version>-windows-x64.zip` | `max/`: device, `mood.maxpat`, `.mxe64`; `pd/`: `.dll` |
| `mood-<version>-linux-x86_64.zip` | `pd/`: `.pd_linux` |
| `mood-<version>-linux-aarch64.zip` | `pd/`: `.pd_linux` (Raspberry Pi 4/5, Bela, ...) |

Max does not run on Linux, so the Linux zips have the Pd externals only. Every zip includes the
help patches of the three objects.

## Install

**Max for Live.** Drop `mood.amxd` on a MIDI track. The device is frozen with its externals,
nothing else to install.

**Max.** Add `max/` to *Options > File Preferences* and open `mood.maxpat` or the help files.

**Pd.** Copy the files of `pd/` into a folder of Pd's path (or use `[declare -path ...]`) and open
the `-help.pd` patches.

**macOS.** The externals are ad-hoc signed, not notarized. If macOS blocks them after the
download:

```bash
xattr -dr com.apple.quarantine path/to/max path/to/pd
```


## How the two core opcodes work

**squinewave~.** One period is four segments: a half cosine sweeping down, a flat part at -1, a
half cosine sweeping up, a flat part at +1. *Clip* shortens the sweeps and lengthens the flat
parts, from a sine (no flat parts) to a square (sweeps as short as allowed). *Skew* moves the
point between the down and the up half, from a symmetric wave to a narrow pulse or, with the flat
parts gone, a sawtooth. A sweep never gets shorter than a few samples (`minsweep`, about sr/3000),
which caps the slope of every edge: that is what keeps the high harmonics, and the aliasing, under
control without oversampling or wavetables. The oscillator also takes a hard sync input and gives
a sync output at the start of each period, used here for osc 2 synced to osc 1.

**moogladder2~.** A digital model of the transistor ladder (Huovilainen's improved model): four
one pole lowpass stages in series, each with a `tanh` on its input difference as the transistor
pairs, and the output fed back to the input scaled by the resonance (4 x resonance: the filter
self oscillates near 1). It runs at twice the sample rate with a half sample delay to compensate
the phase of the feedback, and polynomial corrections of the tuning and of the resonance gain keep
cutoff and emphasis in place up the range. Cutoff and resonance are audio rate and the
coefficients are recomputed only when they change. `moogladder2` differs from Csound's
`moogladder` by a faster `tanh` approximation and by clamping negative resonance.

## Build

Dependencies, not included in this repository:

- **Max SDK**: [Cycling74/max-sdk-base](https://github.com/Cycling74/max-sdk-base) (MIT), cloned
  as `max-sdk-base/` (ignored by git) or pointed to with `MAX_SDK=.../c74support`
- **Pd sources**: the `src` folder of a Pd installation, `PD_SRC=...` (default: Pd 0.56-2 in
  `/Applications`)
- **zig** for the Linux and Windows builds, **Xcode command line tools** for macOS, **python3** to
  regenerate the patches

```bash
git clone https://github.com/Cycling74/max-sdk-base
make           # macOS: build/macos/{pd,max}, universal, ad-hoc signed
make cross     # Linux x86_64/aarch64 (Pd), Windows x64 (Pd, Max) in build/
make release   # both, then the zips in dist/
make patches   # regenerate patches/mood.maxpat and mood.amxd from the Python scripts
```

`make patches` overwrites the device and the patch saved by Max: the committed device is frozen
and may have edits made in Max that the scripts do not have.

## Layout

- `core/`: `squinewave.c`, `vafilters.c` (Csound's `newfils.c` filters, `moogladder2` among them),
  `reverbsc.c`
- `pd/`, `max/`: the wrappers and the help patches. `vafilter~.c` builds one filter of the table
  in `core/vafilters.c` chosen with `-DVA_NAME`; `reverbsc~.c` builds `reverbsc2~` with
  `-DREVERBSC2`
- `patches/`: `mood.amxd` (frozen), `mood.maxpat` and the Python scripts that generated them
- `scripts/`: cross builds and release zips

## License

LGPL 2.1, like Csound: see `LICENSE`. The Max externals are linked with code of the Max SDK
(Cycling '74, MIT): see `LICENSE-MAX-SDK.md`. The SDK itself is not in this repository.
