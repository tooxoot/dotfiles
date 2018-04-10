import serial


# Read command file. Commands should be in seperate lines.
commands = open('input').readlines()

# Initialize with path, baudrate, bytesize, and parity
ser = serial.Serial('/dev/ttyUSB0', 9600, 8, 'O', timeout=1000)  # open serial port
for command in commands:
    ser.write(command.encode())     # write a string