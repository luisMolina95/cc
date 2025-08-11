echo Detecting libraries used...
mkdir -p "build/nul"
avr-g++ \
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics \
    -w -x c++ -E -CC -mmcu=atmega328p \
    -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR \
    -I"hardware/WAV/avr/cores/lgt8f" \
    -I"hardware/WAV/avr/variants/lgt8fx8e" \
    blink.cpp \
    -o "build/nul/detected.cpp"
echo Generating function prototypes...
mkdir -p "build/preproc"
avr-g++ \
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics \
    -w -x c++ -E -CC -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR \
    -I"hardware/WAV/avr/cores/lgt8f" \
    -I"hardware/WAV/avr/variants/lgt8fx8e" \
    blink.cpp \
    -o "build/preproc/ctags_target_for_gcc_minus_e.cpp"
ctags \
    -u --language-force=c++ -f - --c++-kinds=svpf --fields=KSTtzns \
    --line-directives "build/preproc/ctags_target_for_gcc_minus_e.cpp" \
    > "build/nul/ctags.h"
echo Compiling sketch...
avr-g++ \
    -c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics \
    -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_LARDU_328E -DARDUINO_ARCH_AVR \
    -I"hardware/WAV/avr/cores/lgt8f" \
    -I"hardware/WAV/avr/variants/lgt8fx8e" \
    blink.cpp \
    -o "build/blink.cpp.o"
echo Compiling libraries...
# Compiling core...
if [ -e "build/core/core.a" ]; then
    echo "Core found in build/core/core.a"
else
    source core.bash
fi
echo Linking everything together...
avr-gcc -w -Os -Wl,--gc-sections -mmcu=atmega328p -o "build/blink.elf" "build/blink.cpp.o" "build/core/core.a" -L"build/" -lm
avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 "build/blink.elf" "build/blink.eep"
avr-objcopy -O ihex -R .eeprom "build/blink.elf" "build/blink.hex"
avr-size -A "build/blink.elf" > "build/nul/size.txt"
echo Done!