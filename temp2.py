#!/usr/bin/env python

import time, datetime

w1="/sys/bus/w1/devices/10-000802bc1696/w1_slave"
w2="/sys/bus/w1/devices/10-000802bc2761/w1_slave"

# w1="dummy.txt"
# w2="dummy-fail.txt"

raw1 = open(w1, "r").read()
raw2 = open(w2, "r").read()

mySuperDuperLine1 = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw1.split("t=")[-1])/1000) + "\n"
mySuperDuperLine2 = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw2.split("t=")[-1])/1000) + "\n"


abbruch = False

while abbruch == False:
    if "YES" in raw1:
        fh=open("temp_1.log", "a")
        fh.write(mySuperDuperLine1)
        fh.close()
        abbruch = True
    
abbruch = False

while abbruch == False:
    if "YES" in raw2:
        fh=open("temp_2.log", "a")
        fh.write(mySuperDuperLine2)
        fh.close()
        abbruch = True
