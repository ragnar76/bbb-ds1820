#!/usr/bin/env python

import time, datetime

w1="/sys/bus/w1/devices/10-000802bc1696/w1_slave"
w2="/sys/bus/w1/devices/10-000802bc2761/w1_slave"

raw = open(w1, "r").read()
mySuperDuperLine = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw.split("t=")[-1])/1000) + "\n"
fh=open("/media/usb/temp_1.log", "a")
fh.write(mySuperDuperLine )
fh.close()

raw = open(w2, "r").read()
fh=open("/media/usb/temp_2.log", "a")
fh.write(str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M"))+" "+str(float(raw.split("t=")[-1])/1000)+"\n")
fh.close()
