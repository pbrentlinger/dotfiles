#!/bin/bash
# Outputs a clock emoji for the current hour

emojis=( "🕛" "🕐" "🕑" "🕒" "🕓" "🕔" "🕕" "🕖" "🕗" "🕘" "🕙" "🕚" )
hour=$(date +%-I) # 1-12, no leading zero
# echo $hour
idx=$((hour % 12))
emoji=${emojis[$idx]}
# echo ${emoji}
time=$(date +"%H:%M")
# echo ${emojis[5]}
# echo "{\"text\": \"$emoji $time\"}"
# echo "{\"text\": \"$emoji\"}"
#
# time_str=$(date +"%I:%M")
# chars=$(echo "$time_str" | fold -w1 | paste -sd "\n" -)
# echo "{\"text\": $chars}"
# echo "$time_str" | fold -w1
# echo "{\"text\": \"$(echo "$time_str" | fold -w1)\"}"
# echo "{\"text\": \"0\n1\n1\n5\"}"
#
time_str=$(date +%I%M%p)
# test four digit times and pm
# time_str=$(date +%I%M%p --date=12:00)
# test am 
# time_str=$(date +%I%M%p --date=2:00)
i=1
for char in $(echo "$time_str" | fold -w1); do
    eval "num$i='$char'"
    i=$((i+1))
done

if [ "$num5" == "P" ]; then
    num5="Ⓟ"
fi

if [ "$num5" == "A" ]; then
    num5="Ⓐ"
fi

# output vertically
if [[ " $* " == *" vert "* ]]; then
    # Output, skipping num1 if it's 0
    if [ "$num1" == "0" ]; then
        echo "{\"text\": \" $num2\n ܅\n $num3\n $num4\n$num5\"}"
    else
        # using unicode char: 0x0705 for sideways colon
        echo "{\"text\": \" $num1\n $num2\n ܅\n $num3\n $num4\n$num5\"}"
    fi
# output horizontally
else
    if [ "$num1" == "0" ]; then
        echo "{\"text\": \"$num2:$num3$num4 $num5\"}"
    else
        echo "{\"text\": \"$num1$num2:$num3$num4 $num5\"}"
    fi
fi

