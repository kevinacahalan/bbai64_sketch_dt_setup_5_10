
DTC ?= dtc
CPP ?= cpp
KERNEL_VERSION ?= $(shell uname -r)

DTCVERSION = $(shell $(DTC) --version | grep ^Version | sed 's/^.* //g')

MAKEFLAGS += -rR --no-print-directory

ALL_ARCHES := $(patsubst src/%,%,$(wildcard src/*))

PHONY += all
all: $(foreach i,$(ALL_ARCHES),all_$(i))

PHONY += clean
clean: $(foreach i,$(ALL_ARCHES),clean_$(i))

PHONY += install
install: $(foreach i,$(ALL_ARCHES),install_$(i))

# Do not:
# o  use make's built-in rules and variables
#    (this increases performance and avoids hard-to-debug behaviour);
# o  print "Entering directory ...";
MAKEFLAGS += -rR --no-print-directory

# To put more focus on warnings, be less verbose as default
# Use 'make V=1' to see the full commands

ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

DTC_FLAGS += -Wno-unit_address_vs_reg
#http://snapshot.debian.org/binary/device-tree-compiler/
#http://snapshot.debian.org/package/device-tree-compiler/1.4.4-1/#device-tree-compiler_1.4.4-1
#http://snapshot.debian.org/archive/debian/20170925T220404Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.4-1_amd64.deb

ifeq "$(DTCVERSION)" "1.4.5"
	#http://snapshot.debian.org/package/device-tree-compiler/1.4.5-3/#device-tree-compiler_1.4.5-3
	#http://snapshot.debian.org/archive/debian/20171006T213452Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.5-3_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
endif

ifeq "$(DTCVERSION)" "1.4.6"
	#http://snapshot.debian.org/package/device-tree-compiler/1.4.6-1/#device-tree-compiler_1.4.6-1
	#http://snapshot.debian.org/archive/debian/20180426T224735Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.6-1_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
	#Debian: 1.4.6
	DTC_FLAGS += -Wno-avoid_unnecessary_addr_size
	DTC_FLAGS += -Wno-alias_paths
endif

ifeq "$(DTCVERSION)" "1.4.7"
	#http://snapshot.debian.org/package/device-tree-compiler/1.4.7-3/#device-tree-compiler_1.4.7-3
	#http://snapshot.debian.org/archive/debian/20180911T215003Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.7-3_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
	#Debian: 1.4.6
	DTC_FLAGS += -Wno-avoid_unnecessary_addr_size
	DTC_FLAGS += -Wno-alias_paths
	#Debian: 1.4.7-3 (Buster)
	DTC_FLAGS += -Wno-unique_unit_address
endif

ifeq "$(DTCVERSION)" "1.5.0"
	#http://snapshot.debian.org/package/device-tree-compiler/1.5.0-1/#device-tree-compiler_1.5.0-1
	#http://snapshot.debian.org/archive/debian/20190313T032949Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.5.0-1_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
	#Debian: 1.4.6
	DTC_FLAGS += -Wno-avoid_unnecessary_addr_size
	DTC_FLAGS += -Wno-alias_paths
	#Debian: 1.4.7-3 (Buster)
	DTC_FLAGS += -Wno-unique_unit_address
endif

ifeq "$(DTCVERSION)" "1.6.0"
	#http://snapshot.debian.org/package/device-tree-compiler/1.5.0-1/#device-tree-compiler_1.5.0-1
	#http://snapshot.debian.org/archive/debian/20190313T032949Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.5.0-1_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
	#Debian: 1.4.6
	DTC_FLAGS += -Wno-avoid_unnecessary_addr_size
	DTC_FLAGS += -Wno-alias_paths
	#Debian: 1.4.7-3 (Buster)
	DTC_FLAGS += -Wno-unique_unit_address
	DTC_FLAGS += -Wno-avoid_default_addr_size
endif

ifeq "$(DTCVERSION)" "1.6.1"
	#http://snapshot.debian.org/package/device-tree-compiler/1.5.0-1/#device-tree-compiler_1.5.0-1
	#http://snapshot.debian.org/archive/debian/20190313T032949Z/pool/main/d/device-tree-compiler/device-tree-compiler_1.5.0-1_amd64.deb
	#Debian: 1.4.5
	DTC_FLAGS += -Wno-pci_bridge
	DTC_FLAGS += -Wno-simple_bus_reg
	#Debian: 1.4.6
	DTC_FLAGS += -Wno-avoid_unnecessary_addr_size
	DTC_FLAGS += -Wno-alias_paths
	#Debian: 1.4.7-3 (Buster)
	DTC_FLAGS += -Wno-unique_unit_address
	DTC_FLAGS += -Wno-avoid_default_addr_size
	DTC_FLAGS += -Wno-interrupt_provider
endif

# Beautify output
# ---------------------------------------------------------------------------
#
# Normally, we echo the whole command before executing it. By making
# that echo $($(quiet)$(cmd)), we now have the possibility to set
# $(quiet) to choose other forms of output instead, e.g.
#
#         quiet_cmd_cc_o_c = Compiling $(RELDIR)/$@
#         cmd_cc_o_c       = $(CC) $(c_flags) -c -o $@ $<
#
# If $(quiet) is empty, the whole command will be printed.
# If it is set to "quiet_", only the short version will be printed. 
# If it is set to "silent_", nothing will be printed at all, since
# the variable $(silent_cmd_cc_o_c) doesn't exist.
#
# A simple variant is to prefix commands with $(Q) - that's useful
# for commands that shall be hidden in non-verbose mode.
#
#       $(Q)ln $@ :<
#
# If KBUILD_VERBOSE equals 0 then the above command will be hidden.
# If KBUILD_VERBOSE equals 1 then the above command is displayed.

ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif

# If the user is running make -s (silent mode), suppress echoing of
# commands

ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
  quiet=silent_
endif
else					# make-3.8x
ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
  quiet=silent_
endif
endif

export quiet Q KBUILD_VERBOSE

all_%:
	$(Q)$(MAKE) ARCH=$* all_arch

clean_%:
	$(Q)$(MAKE) ARCH=$* clean_all

install_arm:
	$(Q)$(MAKE) ARCH=arm install_arch_arm

install_arm64:
	$(Q)$(MAKE) ARCH=arm64 install_arch_arm64

install_riscv:
	$(Q)$(MAKE) ARCH=riscv install_arch_riscv

ifeq ($(ARCH),)

# Device Tree
ALL_DTS		:= $(shell find src/* -name \*.dts)
ALL_DTB		:= $(patsubst %.dts,%.dtb,$(ALL_DTS))
$(ALL_DTB): ARCH=$(word 2,$(subst /, ,$@))
$(ALL_DTB): FORCE
	$(Q)$(MAKE) ARCH=$(ARCH) $@

# DT overlays
ALL_DTS_OVERLAYS	:= $(shell find src/*/overlays -name \*.dts)
ALL_DTB_OVERLAYS	:= $(patsubst %.dtbo,%.dtb,$(ALL_DTS))
$(ALL_DTB_OVERLAYS): ARCH=$(word 2,$(subst /, ,$@))
$(ALL_DTB_OVERLAYS): FORCE
	$(Q)$(MAKE) ARCH=$(ARCH) $@

else

# Device Tree
ARCH_DTS	:= $(shell find src/$(ARCH) -maxdepth 1 -name \*.dts)
ARCH_DTB	:= $(patsubst %.dts,%.dtb,$(ARCH_DTS))
src			:= src/$(ARCH)
obj			:= src/$(ARCH)
cmd_files 	:= $(wildcard $(foreach f,$(ARCH_DTB),$(dir $(f)).$(notdir $(f)).cmd))

ifneq ($(cmd_files),)
  include $(cmd_files)
endif

$(obj)/%.dtb: $(src)/%.dts FORCE
	$(call if_changed_dep,dtc)

# Overlays
ARCH_DTS_OVERLAYS	:= $(shell find src/$(ARCH)/overlays -name \*.dts)
ARCH_DTB_OVERLAYS	:= $(patsubst %.dts,%.dtbo,$(ARCH_DTS_OVERLAYS))
src_overlays		:= src/$(ARCH)/overlays
obj_overlays		:= src/$(ARCH)/overlays
cmd_files_overlays 	:= $(wildcard $(foreach f,$(ARCH_DTB_OVERLAYS),$(dir $(f)).$(notdir $(f)).cmd))

ifneq ($(cmd_files_overlays),)
  include $(cmd_files_overlays)
endif

$(obj_overlays)/%.dtbo: $(src_overlays)/%.dts FORCE
	$(call if_changed_dep,dtc)


include scripts/Kbuild.include

quiet_cmd_clean    = CLEAN   $(obj) & $(obj_overlays)
      cmd_clean    = rm -f $(__clean-files)

dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)

dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc		\
                 -Iinclude -I$(src) -Isrc -Itestcase-data	\
                 -undef -D__DTS__

quiet_cmd_dtc = DTC     $@
cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
        $(DTC) -O dtb -o $@ -b 0 -@ \
                -i $(src) $(DTC_FLAGS) \
                -d $(depfile).dtc.tmp $(dtc-tmp) ; \
        cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)

PHONY += all_arch
all_arch: $(ARCH_DTB) $(ARCH_DTB_OVERLAYS)
	@:

PHONY += install_arch_arm
install_arch_arm: $(ARCH_DTB) $(ARCH_DTB_OVERLAYS)
	# install Device Tree
	mkdir -p /boot/dtbs/$(KERNEL_VERSION)/overlays/
	cp -v $(obj)/*.dtb /boot/dtbs/$(KERNEL_VERSION)/
	cp -v $(obj_overlays)/*.dtbo /boot/dtbs/$(KERNEL_VERSION)/overlays

PHONY += install_arch_arm64
install_arch_arm64: $(ARCH_DTB) $(ARCH_DTB_OVERLAYS)
	# install Device Tree
	mkdir -p /boot/dtbs/$(KERNEL_VERSION)/ti/overlays/
	cp -v $(obj)/*.dtb /boot/dtbs/$(KERNEL_VERSION)/ti/
	cp -v $(obj_overlays)/*.dtbo /boot/dtbs/$(KERNEL_VERSION)/ti/overlays/
	cp /boot/dtbs/$(KERNEL_VERSION)/ti/k3-*.dtb /boot/firmware/ || true
	cp /boot/dtbs/$(KERNEL_VERSION)/ti/overlays/*.dtbo /boot/firmware/overlays/ || true

PHONY += install_arch_riscv
install_arch_riscv: $(ARCH_DTB) $(ARCH_DTB_OVERLAYS)
	# install Device Tree
	mkdir -p /boot/dtbs/$(KERNEL_VERSION)/thead/overlays/
	mkdir -p /boot/firmware/overlays
	cp -v $(obj)/*.dtb /boot/dtbs/$(KERNEL_VERSION)/thead
	cp -v $(obj_overlays)/*.dtbo /boot/dtbs/$(KERNEL_VERSION)/thead/overlays
	cp /boot/dtbs/$(KERNEL_VERSION)/thead/light-*.dtb /boot/firmware/ || true
	cp /boot/dtbs/$(KERNEL_VERSION)/thead/overlays/*.dtbo /boot/firmware/overlays/ || true

RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
                   -o -name .pc -o -name .hg -o -name .git \) -prune -o

PHONY += clean_all
clean_all: __clean-files = $(ARCH_DTB) $(ARCH_DTB_OVERLAYS)
clean_all : FORCE
	$(call cmd,clean)
	@find . $(RCS_FIND_IGNORE) \
		\( -name '.*.cmd' \
		-o -name '.*.d' \
		-o -name '.*.tmp' \
		\) -type f -print | xargs rm -f

endif

help:
	@echo "Targets:"
	@echo "  all:                   Build all device tree binaries for all architectures"
	@echo "  clean:                 Clean all generated files"
	@echo "  install:               Install all generated files (sudo)"
	@echo ""
	@echo "  all_<ARCH>:            Build all device tree binaries for <ARCH>"
	@echo "  clean_<ARCH>:          Clean all generated files for <ARCH>"
	@echo "  install_<ARCH>:        Install all generated files for <ARCH> (sudo)"
	@echo ""
	@echo "  src/<ARCH>/<DTS>.dtb   Build a single device tree binary"
	@echo ""
	@echo "Architectures: $(ALL_ARCHES)"

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)
