import time, datetime 

w1="dummy.txt"
w2="dummy-fail.txt"

raw = open(w2, "r").read()
# print(raw)

abbruch = False

while abbruch == False:
    if "YES" in raw:
        print("test ok")
        abbruch = True
        



# ff 07 4b 46 7f ff 01 10 2f : crc=2f No
# ff 07 4b 46 7f ff 01 10 2f t=127937  
