# set default stuff like encoding, terminal and output
set encoding utf8
set terminal svg size 1024,768 fname 'Verdana' fsize 10 name "Wetterverlauf"
set output "/var/www/html/temp-verlauf.svg"
set key box font "Verdana,8" spacing 1

set xtics border in scale 1,0.5 nomirror rotate by -45  offset character 0, 0, 0 autojustify
set xtics  norangelimit font "Verdana,8"
set xtics   ()

set ytics border in scale 1,0.5 nomirror rotate by 45 offset character 0, 0, 0 autojustify
set ytics  norangelimit font "Verdana,8"
set ytics   ()

set grid

set xdata time
set timefmt "%d.%m.%Y_%H:%M"
set format x "%d.%m.%Y_%H:%M"
set xrange [*:*]
set yrange [*:*]

set multiplot layout 3, 1 title "Wetterverlauf" font 'Verdana,14'
	set tmargin 2

	set title "Temperaturverlauf" font 'Verdana,12'
	unset key
	set key autotitle column
        set boxwidth 0.8
	plot '/media/usb/temp_1.log' using 1:2 title " inside" with lines, '/media/usb/temp_2.log' using 1:2 title " outside" with lines

	set title "Temperaturverlauf der letzten 8 Stunden" font 'Verdana,12'
	unset key
        set key autotitle column
        set boxwidth 0.8   
	plot "< tail -n75 /media/usb/temp_1.log" using 1:2 title " letzten 8 Stunden Innen " with lines, "< tail -n75 /media/usb/temp_2.log" using 1:2 title " letzten 8 Stunden Außen" with lines
	
	set title "Luftdruckverlauf" font 'Verdana,12'
	plot '/media/usb/pressure.log' using 1:2 title " Luftdruck" with lines linecolor rgb "blue"
unset multiplot
