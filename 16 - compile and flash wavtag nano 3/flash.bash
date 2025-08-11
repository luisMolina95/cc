avrdude \
    -C"/etc/avrdude.conf" \
    -v -patmega328p -carduino -PCOM -b57600 -D \
    -Uflash:w:"build\blink.hex":i