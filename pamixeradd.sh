#!/bin/bash
if [ $1 == "-" ]; then
    pamixer --allow-boost --set-volume  $(($(pamixer --get-volume) - $2))
elif [ $1 == "+" ]; then
    pamixer --allow-boost --set-volume  $(($(pamixer --get-volume) + $2))
fi

