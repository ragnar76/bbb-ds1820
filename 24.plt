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

set mouse
set grid

set xtics border in scale 1,0.5 rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font "Nanosecond Thin,8"
set xtics   ()

set ytics border in scale 1,0.5 rotate by 45 offset character 0, 0, 0 autojustify
set ytics  norangelimit font "Nanosecond Thin,8"
set ytics   ()

# what to to with the data
set xdata time
set timefmt "%d.%m.%Y_%H:%M"
set format x "%d.%m.%Y_%H:%M"
set xrange [*:*]
set yrange [*:*]

set multiplot
plot 'temp_1.log' using 1:2 title " Innen" with lines, 'temp_2.log' using 1:2 title " Aussen" with lines

# Now we set the options for the smaller plot
set size 0.6,0.4
set origin 0.2,0.55

set title ''
set ylabel ''
set xlabel ''

# what to to with the data
set xdata time
set timefmt "%d.%m.%Y_%H:%M"
set format x ""

set xrange [*:*]
set yrange [*:*]
plot "< tail -n48 temp_1.log" using 1:2 title "" with lines, "< tail -n48 temp_2.log" using 1:2 title '' with lines

unset multiplot