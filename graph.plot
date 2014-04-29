#!/usr/bin/gnuplot -persist

# set default stuff like encoding, terminal and output
set encoding utf8
set terminal png
set output "/var/www/html/temp-verlauf.png"
set key box

# set title, x and y label
set title "Temperaturverlauf"
set ylabel "Temperatur in Grad/Celsius"
set xlabel "Messzeitpunkt"

set grid

# what to to with the data
set xdata time
set timefmt "%d.%m.%Y_%H:%M"
set format x "%H:%M"
set yrange [*:*]

plot '/media/usb/temp_1.log' using 1:2 title "innen" with lines, '/media/usb/temp_2.log' using 1:2 title "außen" with lines
