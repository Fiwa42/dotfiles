#!/bin/sh

# Number of updates with checkupdates
output1=$(checkupdates | wc -l)

# Number of updates with yay -Qua
output2=$(yay -Qua | wc -l)

# Add both together
sum=$((output1 + output2))

# Write sum
echo "$sum"
