cmd_src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo = cpp -Wp,-MD,src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.d.pre.tmp -nostdinc -Iinclude -Isrc/arm64 -Isrc -Itestcase-data -undef -D__DTS__ -x assembler-with-cpp -o src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.dts.tmp src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dts ; dtc -O dtb -o src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo -b 0 -@ -i src/arm64 -Wno-unit_address_vs_reg -Wno-pci_bridge -Wno-simple_bus_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-unique_unit_address -Wno-avoid_default_addr_size -Wno-interrupt_provider -d src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.d.dtc.tmp src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.dts.tmp ; cat src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.d.pre.tmp src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.d.dtc.tmp > src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.d
BBAI64-DSI-RPi-7inch-panel.o: \
 src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dts \
 include/dt-bindings/gpio/gpio.h \
 include/dt-bindings/interrupt-controller/irq.h \
 include/dt-bindings/pinctrl/k3.h
src/arm64/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo: src/arm64/overlays/.BBAI64-DSI-RPi-7inch-panel.dtbo.dts.tmp
