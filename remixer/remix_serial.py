import serial
locations = ["/dev/tty.usbserial-A700fbww"]

for device in locations:
    try:
        arduino = serial.Serial(device, 9600)
    except:
        print "Failed to connect on",device
