@echo off
echo Detecting libraries used...
avr-g++ ^
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics ^
    -w -x c++ -E -CC -mmcu=atmega328p ^
    -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\cores\lgt8f" ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\variants\lgt8fx8e" ^
    blink.cpp ^
    -o detected.cpp
echo Generating function prototypes...
mkdir "preproc"
avr-g++ ^
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics ^
    -w -x c++ -E -CC -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\cores\lgt8f" ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\variants\lgt8fx8e" ^
    blink.cpp ^
    -o ".\preproc\ctags_target_for_gcc_minus_e.cpp"
ctags ^
    -u --language-force=c++ -f - --c++-kinds=svpf --fields=KSTtzns ^
    --line-directives ".\preproc\ctags_target_for_gcc_minus_e.cpp" ^
    > ctags.h
echo Compiling sketch...
avr-g++ ^
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics ^
    -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\cores\lgt8f" ^
    -I"C:\Program Files (x86)\Arduino\hardware\WAV\avr\variants\lgt8fx8e" ^
    blink.cpp ^
    -o blink.cpp.o
echo Compiling libraries...
@REM Compiling core...
call core.cmd
echo Linking everything together...
avr-gcc -w -Os -Wl,--gc-sections -mmcu=atmega328p -o blink.elf blink.cpp.o "./core/core.a" -L"./" -lm
avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 blink.elf blink.eep
avr-objcopy -O ihex -R .eeprom blink.elf blink.hex
avr-size -A blink.elf > size.txt
echo Done!