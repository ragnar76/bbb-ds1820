#!/usr/bin/gnuplot -persist

# set default stuff like encoding, terminal and output
set encoding utf8
set terminal svg size 1024,768 fname 'Verdana' fsize 10
set output "/var/www/html/temp-verlauf.svg"
set key box font "Droid Sans Mono,8" spacing 1

# set title, x and y label
set title "Temperaturverlauf" font 'Chicago,12'
set ylabel "Temperatur in Grad/Celsius"
set xlabel "Messzeitpunkt"

set xrange [*:*]
set yrange [*:*]


