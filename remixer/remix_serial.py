import serial
locations = ['/dev/ttyUSB0','/dev/ttyUSB1','/dev/ttyUSB2','/dev/ttyUSB3',  
'/dev/ttyS0','/dev/ttyS1','/dev/ttyS2','/dev/ttyS3']

for device in locations:  
    try:  
        arduino = serial.Serial(device, 9600)  
    except:  
        print "Failed to connect on",device  
