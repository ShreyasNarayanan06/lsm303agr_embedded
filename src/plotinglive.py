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

# Enable interactive plotting
plt.ion()
fig, axs = plt.subplots(7, 1, figsize=(13, 8))

# Prepare line objects for live update
x_line, = axs[0].plot([], [], 'r', label='X')
y_line, = axs[1].plot([], [], 'g', label='Y')
z_line, = axs[2].plot([], [], 'b', label='Z')
ovr_line, = axs[3].plot([], [], 'k', label='OVR')
deriv_x_line, = axs[4].plot([], [], 'c', label='X Smoothed Derivative')
deriv_y_line, = axs[5].plot([], [], 'y', label='Y Smoothed Derivative')
deriv_ovr_line, = axs[6].plot([], [], 'm', label='OVR Smoothed Derivative')
axs[4].legend(loc='upper right')
axs[5].legend(loc='upper right')
axs[6].legend(loc='upper right')

# Set axis labels and grids
axs[0].set_ylabel('X (uT)')
axs[1].set_ylabel('Y (uT)')
axs[2].set_ylabel('Z (uT)')
axs[3].set_ylabel('OVR Strength')
axs[4].set_ylabel('X Smoothed Derivative')
axs[5].set_ylabel('Y Smoothed Derivative')
axs[6].set_ylabel('OVR Smoothed Derivative')
axs[6].set_xlabel('Time (s)')

for ax in axs:
    ax.grid()

def compute_lpf(data, alpha=0.25):
    lpf = [0] * len(data)
    if len(data) > 0:
        lpf[0] = data[0]
        for i in range(1, len(data)):
            lpf[i] = alpha * data[i] + (1 - alpha) * lpf[i - 1]
    return lpf

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

            # Show only last 10 seconds of data
            time_window = 10
            min_time = t - time_window
            indices = [i for i, ts in enumerate(timestamps) if ts >= min_time]

            ts_window = [timestamps[i] for i in indices]
            x_window = [x_vals[i] for i in indices]
            y_window = [y_vals[i] for i in indices]
            z_window = [z_vals[i] for i in indices]
            ovr_window = [ovr_vals[i] for i in indices]

            # Recalculate filtered OVR and derivative for window
            ovr_window_lpf = compute_lpf(ovr_window)
            x_window_lpf = compute_lpf(x_window)
            y_window_lpf = compute_lpf(y_window)
            if len(ovr_window_lpf) >= 2:
                smoothed_derivative_ovr = np.gradient(ovr_window_lpf)
            else:
                smoothed_derivative_ovr = [0] * len(ovr_window_lpf)
            if len(x_window_lpf) >= 2:
                smoothed_derivative_x = np.gradient(x_window_lpf)
            else:
                smoothed_derivative_x = [0] * len(x_window_lpf)
            if len(y_window_lpf) >= 2:
                smoothed_derivative_y = np.gradient(y_window_lpf)
            else:
                smoothed_derivative_y = [0] * len(y_window_lpf)

            # Update line data
            x_line.set_data(ts_window, x_window)
            y_line.set_data(ts_window, y_window)
            z_line.set_data(ts_window, z_window)
            ovr_line.set_data(ts_window, ovr_window)
            deriv_x_line.set_data([], [])
            deriv_y_line.set_data([], [])
            deriv_ovr_line.set_data([], [])
            if len(smoothed_derivative_x) == len(ts_window):
                deriv_x_line.set_data(ts_window, smoothed_derivative_x)
            if len(smoothed_derivative_y) == len(ts_window):
                deriv_y_line.set_data(ts_window, smoothed_derivative_y)
            if len(smoothed_derivative_ovr) == len(ts_window):
                deriv_ovr_line.set_data(ts_window, smoothed_derivative_ovr)
            axs[4].legend(loc='upper right')
            axs[5].legend(loc='upper right')
            axs[6].legend(loc='upper right')

            # Rescale axes to fit new data
            for ax, data in zip(axs, [x_window, y_window, z_window, ovr_window, smoothed_derivative_x, smoothed_derivative_y, smoothed_derivative_ovr]):
                ax.relim()
                ax.autoscale_view()

            plt.pause(0.01)

except KeyboardInterrupt:
    print("done")

finally:
    ser.close()
    plt.ioff()
    plt.show()
