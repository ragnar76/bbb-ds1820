#!/usr/bin/env python

import time, datetime

w1="/sys/bus/w1/devices/10-000802bc1696/w1_slave"
w2="/sys/bus/w1/devices/10-000802bc2761/w1_slave"
w3="/sys/bus/i2c/drivers/bmp085/1-0077/pressure0_input"

# w1="dummy.txt"
# w2="dummy-fail.txt"

raw1 = open(w1, "r").read()
raw2 = open(w2, "r").read()
raw3 = open(w3, "r").read()

mySuperDuperLine1 = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw1.split("t=")[-1])/1000) + "\n"
mySuperDuperLine2 = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw2.split("t=")[-1])/1000) + "\n"
pressure = str(datetime.datetime.now().strftime("%d.%m.%Y_%H:%M")) + " " + str(float(raw3)/100) + "\n"

# print mySuperDuperLine1;
# print mySuperDuperLine2;
# print pressure;

fh=open("/media/usb/pressure.log", "a")
fh.write(pressure)
fh.close()

abbruch = False
while abbruch == False:
    if "YES" in raw1:
        fh=open("/media/usb/temp_1.log", "a")
        fh.write(mySuperDuperLine1)
        fh.close()
        abbruch = True
    
abbruch = False
while abbruch == False:
    if "YES" in raw2:
        fh=open("/media/usb/temp_2.log", "a")
        fh.write(mySuperDuperLine2)
        fh.close()
        abbruch = True
