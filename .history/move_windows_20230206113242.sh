#!/bin/bash

if [ ! -z "$1" ] || [ -z "$2" ]; then
    command=$(wmctrl -l | grep $1 | cut -d" " -f1)

    if [ ! -z "$command" ]; then
        position=$(xrandr | grep "^$2" | cut -d"+" -f2)

        if [ ! -z "$position" ]; then
            for window in $command; do 
               wmctrl -ir $window -b remove,maximized_vert
               wmctrl -ir $window -b remove,maximized_horz 
               wmctrl -ir $window -e 0,$position,0,1920,1080
               wmctrl -ir $window -b add,maximized_vert
               wmctrl -ir $window -b add,maximized_horz 
            done
        else
            echo -e "not found monitor with given name"
        fi
    else
        echo -e "not found windows with given name"
    fi
else
    echo -e "specify window and monitor name;\nmove.sh window-name monitor-name"
fi