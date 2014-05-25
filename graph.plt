#!/usr/bin/gnuplot -persist

# set default stuff like encoding, terminal and output
set encoding utf8
set terminal svg size 800,600 fname 'Verdana' fsize 10
set output "/var/www/html/temp-verlauf.svg"
set key box font "Droid Sans Mono,8" spacing 1

# set title, x and y label
set title "Temperaturverlauf" font 'Chicago,12'
set ylabel "Temperatur in Grad/Celsius"
set xlabel "Messzeitpunkt"

set grid

set xtics border in scale 1,0.5 nomirror rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font "Nanosecond Thin,8"
set xtics   ()

set ytics border in scale 1,0.5 nomirror rotate by 45 offset character 0, 0, 0 autojustify
set ytics  norangelimit font "Nanosecond Thin,8"
set ytics   ()

# what to to with the data
set xdata time
set timefmt "%d.%m.%Y_%H:%M"
set format x "%d.%m.%Y_%H:%M"
set xrange [*:*]
set yrange [*:*]

plot '/media/usb/temp_1.log' using 1:2 title " Innen" with lines, '/media/usb/temp_2.log' using 1:2 title " Außen" with lines
