cmd_src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo = cpp -Wp,-MD,src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.d.pre.tmp -nostdinc -Iinclude -Isrc/arm64 -Isrc -Itestcase-data -undef -D__DTS__ -x assembler-with-cpp -o src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.dts.tmp src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dts ; dtc -O dtb -o src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo -b 0 -@ -i src/arm64 -Wno-unit_address_vs_reg -Wno-pci_bridge -Wno-simple_bus_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-unique_unit_address -Wno-avoid_default_addr_size -Wno-interrupt_provider -d src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.d.dtc.tmp src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.dts.tmp ; cat src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.d.pre.tmp src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.d.dtc.tmp > src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.d
BBAI64-P8_37-ehrpwm5_a.o: src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dts
src/arm64/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo: src/arm64/overlays/.BBAI64-P8_37-ehrpwm5_a.dtbo.dts.tmp
