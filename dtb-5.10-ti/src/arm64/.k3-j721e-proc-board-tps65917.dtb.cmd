cmd_src/arm64/k3-j721e-proc-board-tps65917.dtb = cpp -Wp,-MD,src/arm64/.k3-j721e-proc-board-tps65917.dtb.d.pre.tmp -nostdinc -Iinclude -Isrc/arm64 -Isrc -Itestcase-data -undef -D__DTS__ -x assembler-with-cpp -o src/arm64/.k3-j721e-proc-board-tps65917.dtb.dts.tmp src/arm64/k3-j721e-proc-board-tps65917.dts ; dtc -O dtb -o src/arm64/k3-j721e-proc-board-tps65917.dtb -b 0 -@ -i src/arm64 -Wno-unit_address_vs_reg -Wno-pci_bridge -Wno-simple_bus_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-unique_unit_address -Wno-avoid_default_addr_size -Wno-interrupt_provider -d src/arm64/.k3-j721e-proc-board-tps65917.dtb.d.dtc.tmp src/arm64/.k3-j721e-proc-board-tps65917.dtb.dts.tmp ; cat src/arm64/.k3-j721e-proc-board-tps65917.dtb.d.pre.tmp src/arm64/.k3-j721e-proc-board-tps65917.dtb.d.dtc.tmp > src/arm64/.k3-j721e-proc-board-tps65917.dtb.d
k3-j721e-proc-board-tps65917.o: \
 src/arm64/k3-j721e-proc-board-tps65917.dts \
 src/arm64/k3-j721e-common-proc-board.dts src/arm64/k3-j721e-som-p0.dtsi \
 src/arm64/k3-j721e.dtsi include/dt-bindings/interrupt-controller/irq.h \
 include/dt-bindings/interrupt-controller/arm-gic.h \
 include/dt-bindings/pinctrl/k3.h \
 include/dt-bindings/soc/ti,sci_pm_domain.h \
 src/arm64/k3-j721e-thermal.dtsi include/dt-bindings/thermal/thermal.h \
 src/arm64/k3-j721e-main.dtsi include/dt-bindings/phy/phy.h \
 include/dt-bindings/mux/mux.h include/dt-bindings/mux/ti-serdes.h \
 src/arm64/k3-j721e-mcu-wakeup.dtsi include/dt-bindings/gpio/gpio.h \
 include/dt-bindings/input/input.h \
 include/dt-bindings/input/linux-event-codes.h \
 include/dt-bindings/net/ti-dp83867.h \
 include/dt-bindings/phy/phy-cadence.h
src/arm64/k3-j721e-proc-board-tps65917.dtb: src/arm64/.k3-j721e-proc-board-tps65917.dtb.dts.tmp