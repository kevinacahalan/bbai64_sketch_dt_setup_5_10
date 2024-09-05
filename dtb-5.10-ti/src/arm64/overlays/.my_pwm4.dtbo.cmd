cmd_src/arm64/overlays/my_pwm4.dtbo = cpp -Wp,-MD,src/arm64/overlays/.my_pwm4.dtbo.d.pre.tmp -nostdinc -Iinclude -Isrc/arm64 -Isrc -Itestcase-data -undef -D__DTS__ -x assembler-with-cpp -o src/arm64/overlays/.my_pwm4.dtbo.dts.tmp src/arm64/overlays/my_pwm4.dts ; dtc -O dtb -o src/arm64/overlays/my_pwm4.dtbo -b 0 -@ -i src/arm64 -Wno-unit_address_vs_reg -Wno-pci_bridge -Wno-simple_bus_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-unique_unit_address -Wno-avoid_default_addr_size -Wno-interrupt_provider -d src/arm64/overlays/.my_pwm4.dtbo.d.dtc.tmp src/arm64/overlays/.my_pwm4.dtbo.dts.tmp ; cat src/arm64/overlays/.my_pwm4.dtbo.d.pre.tmp src/arm64/overlays/.my_pwm4.dtbo.d.dtc.tmp > src/arm64/overlays/.my_pwm4.dtbo.d
my_pwm4.o: src/arm64/overlays/my_pwm4.dts \
 include/dt-bindings/pinctrl/k3.h \
 include/dt-bindings/board/k3-j721e-bone-pins.h \
 include/dt-bindings/soc/ti,sci_pm_domain.h
src/arm64/overlays/my_pwm4.dtbo: src/arm64/overlays/.my_pwm4.dtbo.dts.tmp
