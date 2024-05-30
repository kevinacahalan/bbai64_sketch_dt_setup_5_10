
### Setup install
Your custom overlays should be placed in `./arm64/overlays`. The script `../scripts/setup_device_trees_deb12.sh`
should take care of compile and install. You may then need to power cycle the board a few times.

This device tree setup was tested with BeagleboneAI64 firmware bbai64-debian-12.2-minimal-arm64-2023-10-07-6gb.img.xz.
In general this setup should work with any recent firmware version using kernel 5.10. 

### What's working and tested (from an R5 core)
- GPIO
- SPI 6 and 7
- EPWM4 which is on pin P9-25
- EQEP encoders 0 and 1
- 16MB of memory shared with linux at address 0x90000000

### Random notes
This setup is pretty sketch. The file `/arm64/overlays/my_main.dts` is the main custom overlay. Read the comments in it.
The overlay `/arm64/overlays/my_pwm.dts` does not work. It should but does not, and is thus not used. In the
future `my_pwm.dts` should be figured out. For rn, PWM is setup from `my_main.dts`, and it depends on ecap stuff. The
overlays in this repo depend on random custom edits in the main device tree. This whole setup is derived from a setup that
https://github.com/gitklindsayjr put together for his PRU work.


The `show-pins.pl` script in this repo is greatly useful for checking pin muxing status.


https://forum.beagleboard.org/t/arm64-debian-12-x-bookworm-monthly-snapshots-2023-10-07/35565 has the test BeagleBone firmware.

