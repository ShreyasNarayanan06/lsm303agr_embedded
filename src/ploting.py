import serial
import matplotlib.pyplot as plt
import time
import numpy as np

serialPort = '/dev/tty.usbmodem0010506828001'
baudRate = 115200

ser = serial.Serial(serialPort, baudRate, timeout=1)

timestamps = []
x_vals = []
y_vals = []
z_vals = []
ovr_vals = []


try:
    start_time = time.time()
    while True:
        line = ser.readline().decode('utf-8').strip()

        if line.startswith("X:"):
            x = int(line.split(":")[1])
            y = int(ser.readline().decode('utf-8').strip().split(":")[1])
            z = int(ser.readline().decode('utf-8').strip().split(":")[1])
            ovr = int(ser.readline().decode('utf-8').strip().split(":")[1])
            
            t = time.time() - start_time

            timestamps.append(t)
            x_vals.append(x)
            y_vals.append(y)
            z_vals.append(z)
            ovr_vals.append(ovr)

            print(f"{t:.2f}s -> X: {x}, Y: {y}, Z: {z}, OVR: {ovr}")

except KeyboardInterrupt:
    print("done")

finally:
    ser.close()


ovr_vals_lpf = [0] * len(ovr_vals) 
ovr_vals_lpf[0] = ovr_vals[0]
a = 0.25

for i in range(1, len(ovr_vals)):
    ovr_vals_lpf[i] = a * ovr_vals[i] + (1-a) * ovr_vals_lpf[i-1]

ovr_lpf_np = np.array(ovr_vals_lpf)

smoothed_derivative = []

smoothed_derivative = np.gradient(ovr_lpf_np)
    
plt.figure(figsize=(12, 10))

plt.subplot(5, 1, 1)
plt.plot(timestamps, x_vals, label='X', color='r')
plt.ylabel('X (uT)')
plt.grid()

plt.subplot(5, 1, 2)
plt.plot(timestamps, y_vals, label='Y', color='g')
plt.ylabel('Y (uT)')
plt.grid()

plt.subplot(5, 1, 3)
plt.plot(timestamps, z_vals, label='Z', color='b')
plt.ylabel('Z (uT)')
plt.grid()

plt.subplot(5, 1, 4)
plt.plot(timestamps, ovr_vals, label='OVR', color='k')
plt.xlabel('Time (s)')
plt.ylabel('OVR Strength')
plt.grid()

plt.subplot(5, 1, 5)
plt.plot(timestamps, smoothed_derivative, label='Smoothed Derivative', color='m')
plt.xlabel('Time (s)')
plt.ylabel('OVR Smoothed Derivative')
plt.grid()

plt.tight_layout()
plt.show()