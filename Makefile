PD_SRC ?= /Applications/Pd-0.56-2.app/Contents/Resources/src
MAX_SDK ?= max-sdk-base/c74support
CFLAGS = -O3 -Wall -Wno-unused-function -Icore
ARCHS = -arch arm64 -arch x86_64

PD_CC = cc $(CFLAGS) -Ipd -I$(PD_SRC) $(ARCHS) -bundle -undefined dynamic_lookup
MAX_CC = cc $(CFLAGS) -Imax -I$(MAX_SDK)/max-includes -I$(MAX_SDK)/msp-includes \
	$(ARCHS) -mmacosx-version-min=10.13 -bundle \
	-F$(MAX_SDK)/msp-includes -framework MaxAudioAPI \
	@$(MAX_SDK)/max-includes/c74_linker_flags.txt

NAMES = squinewave moogladder2 reverbsc2
MAC = build/macos

all: mac

mac: $(NAMES:%=$(MAC)/pd/%~.pd_darwin) $(foreach n,$(NAMES),$(MAC)/max/$(n)~.mxo/Contents/MacOS/$(n)~)

# name, wrapper, core, defines (same table as scripts/cross.sh)
squinewave_SRC = squinewave~.c core/squinewave.c
moogladder2_SRC = vafilter~.c core/vafilters.c
reverbsc2_SRC = reverbsc~.c core/reverbsc.c
squinewave_DEF =
moogladder2_DEF = -DVA_NAME='"moogladder2"' -DVA_SETUP=moogladder2_tilde_setup
reverbsc2_DEF = -DREVERBSC2

$(MAC)/pd/%~.pd_darwin: core/*.c core/*.h pd/*.c
	mkdir -p $(MAC)/pd
	$(PD_CC) $($*_DEF) -o '$@' pd/$($*_SRC)

define mxo
$(MAC)/max/$(1)~.mxo/Contents/MacOS/$(1)~: core/*.c core/*.h max/*.c max/Info.plist.in
	mkdir -p '$(MAC)/max/$(1)~.mxo/Contents/MacOS'
	$$(MAX_CC) $$($(1)_DEF) -o '$$@' max/$$($(1)_SRC) $$(MAX_SDK)/max-includes/common/commonsyms.c
	sed 's/@NAME@/$(1)/g' max/Info.plist.in > '$(MAC)/max/$(1)~.mxo/Contents/Info.plist'
	printf 'iLaX????' > '$(MAC)/max/$(1)~.mxo/Contents/PkgInfo'
	codesign --force --sign - '$(MAC)/max/$(1)~.mxo'
endef
$(foreach n,$(NAMES),$(eval $(call mxo,$(n))))

# Linux (Pd) and Windows (Pd, Max), needs zig
cross:
	scripts/cross.sh

# overwrites the device saved by Max
patches:
	python3 patches/mood.py && python3 patches/mood_m4l.py

# zips for the GitHub release in dist/
release: mac cross
	scripts/release.sh

clean:
	rm -rf build dist

.PHONY: all mac cross patches release clean
