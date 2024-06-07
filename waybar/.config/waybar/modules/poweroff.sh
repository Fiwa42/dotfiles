#!/bin/bash
case $(wofi -d -L 8 -l 3 -W 150 -x -110 -y 18 \
    -D dynamic_lines=true << EOF | sed 's/^ *//'
    Shutdown
    Reboot
    Sleep
    Lock
    Cancel
EOF
) in
    "Shutdown")
        shutdown now
        ;;
    "Reboot")
        shutdown -r
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Lock")
        hyprlock
        ;;
esac
