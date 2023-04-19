import numpy as np
from scipy import interpolate
import matplotlib.pyplot as plt

# Define the x and y coordinates of the data points
x_data = np.array([0, 0.25, 0.5, 0.75])
y_data = np.array([0, 1, 0.25, 0])


y_data = np.minimum(y_data, 1)

# Compute the cubic spline coefficients
tck = interpolate.splrep(x_data, y_data, k=3)

# Evaluate the spline at 1000 points between 0 and 1
x_eval = np.linspace(0, 1, 1000)
y_eval = interpolate.splev(x_eval, tck)

# Plot the spline
plt.plot(x_data, y_data, 'o', label='Data Points')
plt.plot(x_eval, y_eval, label='Cubic Spline')
plt.legend()
plt.show()

