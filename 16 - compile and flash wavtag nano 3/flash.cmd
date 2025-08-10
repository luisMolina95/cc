@echo off
avrdude ^
    -C"C:\Program Files (x86)\Arduino\hardware\tools\avr/etc/avrdude.conf" ^
    -v -patmega328p -carduino -PCOM7 -b57600 -D ^
    -Uflash:w:blink.hex:i