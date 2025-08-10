@echo off
avrdude ^
    -C"D:\Program Files (x86)\Arduino\hardware\tools\avr/etc/avrdude.conf" ^
    -v -patmega328p -carduino -PCOM -b57600 -D ^
    -Uflash:w:"build\blink.hex":i