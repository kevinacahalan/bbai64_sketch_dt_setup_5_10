cmd_src/arm64/k3-j721e-common-proc-board-infotainment.dtb = cpp -Wp,-MD,src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.d.pre.tmp -nostdinc -Iinclude -Isrc/arm64 -Isrc -Itestcase-data -undef -D__DTS__ -x assembler-with-cpp -o src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.dts.tmp src/arm64/k3-j721e-common-proc-board-infotainment.dts ; dtc -O dtb -o src/arm64/k3-j721e-common-proc-board-infotainment.dtb -b 0 -@ -i src/arm64 -Wno-unit_address_vs_reg -Wno-pci_bridge -Wno-simple_bus_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-unique_unit_address -Wno-avoid_default_addr_size -Wno-interrupt_provider -d src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.d.dtc.tmp src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.dts.tmp ; cat src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.d.pre.tmp src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.d.dtc.tmp > src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.d
k3-j721e-common-proc-board-infotainment.o: \
 src/arm64/k3-j721e-common-proc-board-infotainment.dts \
 include/dt-bindings/gpio/gpio.h \
 include/dt-bindings/interrupt-controller/irq.h \
 include/dt-bindings/pinctrl/k3.h
src/arm64/k3-j721e-common-proc-board-infotainment.dtb: src/arm64/.k3-j721e-common-proc-board-infotainment.dtb.dts.tmp
