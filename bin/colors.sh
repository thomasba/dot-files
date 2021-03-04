#!/bin/bash

echo -e "\e[32;1mSet\e[0m"
echo -ne       "\e[1m   1: Bold          \e[0m"
echo -ne       "\e[2m   2: Dim           \e[0m"
echo -ne       "\e[3m   3: Italic        \e[0m"
echo -ne       "\e[4m   4: Underlined    \e[0m"
echo
echo -ne       "\e[5m   5: Blink         \e[0m"
echo -ne       "\e[6m   6: Overline      \e[0m"
echo -ne       "\e[7m   7: Invert        \e[0m"
echo -ne       "   8: Invert        "
echo
echo -ne       "\e[9m   9: Strikeout     \e[0m"
echo
echo

echo -e "\e[32;1mReset\e[0m"
echo -ne      "\e[0m   0: Reset all     \e[0m"
echo -ne     "\e[21m  21: Bold/bright   \e[0m"
echo -ne     "\e[22m  22: Dim           \e[0m"
echo -ne     "\e[24m  24: Underlined    \e[0m"
echo
echo -ne     "\e[25m  25: Blink         \e[0m"
echo -ne     "\e[27m  27: Reverse       \e[0m"
echo -ne     "\e[28m  28: Hidden        \e[0m"
echo
echo

echo -e "\e[32;1mForeground (text);"
echo -ne     "\e[39m  39: Default       \e[0m"
echo -ne "\e[30;107m  30: Black         \e[0m"
echo -ne     "\e[31m  31: Red           \e[0m"
echo -ne     "\e[32m  32: Green         \e[0m"
echo
echo -ne     "\e[33m  33: Yellow        \e[0m"
echo -ne     "\e[34m  34: Blue          \e[0m"
echo -ne     "\e[35m  35: Magenta       \e[0m"
echo -ne     "\e[36m  36: Cyan          \e[0m"
echo
echo -ne     "\e[37m  37: Light Gray    \e[0m"
echo -ne     "\e[90m  90: Dark Gray     \e[0m"
echo -ne     "\e[91m  91: Light Red     \e[0m"
echo -ne     "\e[92m  92: Light Green   \e[0m"
echo
echo -ne     "\e[93m  93: Light Yellow  \e[0m"
echo -ne     "\e[94m  94: Light Blue    \e[0m"
echo -ne     "\e[95m  95: Light Magenta \e[0m"
echo -ne     "\e[96m  96: Light Cyan    \e[0m"
echo
echo -ne     "\e[97m  97: White         \e[0m"
echo
echo

echo -e "\e[32;1mBackground\e[0m"
echo -ne     "\e[49m  49: Default       \e[0m"
echo -ne     "\e[40m  40: Black         \e[0m"
echo -ne     "\e[41m  41: Red           \e[0m"
echo -ne     "\e[42m  42: Green         \e[0m"
echo
echo -ne     "\e[43m  43: Yellow        \e[0m"
echo -ne     "\e[44m  44: Blue          \e[0m"
echo -ne     "\e[45m  45: Magenta       \e[0m"
echo -ne     "\e[46m  46: Cyan          \e[0m"
echo
echo -ne "\e[30;47m  47: Light Gray    \e[0m"
echo -ne "\e[30;100m 100: Dark Gray     \e[0m"
echo -ne "\e[30;101m 101: Light Red     \e[0m"
echo -ne "\e[30;102m 102: Light Green   \e[0m"
echo
echo -ne "\e[30;103m 103: Light Yellow  \e[0m"
echo -ne "\e[30;104m 104: Light Blue    \e[0m"
echo -ne "\e[30;105m 105: Light Magenta \e[0m"
echo -ne "\e[30;106m 106: Light Cyan    \e[0m"
echo
echo -ne "\e[30;107m 107: White         \e[0m"
echo

