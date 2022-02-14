import numpy as np
import scipy.interpolate
import scipy.linalg as la

### Problem 1
data = np.genfromtxt('lynx.csv', delimiter=',')
t = data[0, :]
pop = data[1, :]
### Don't delete the lines above when submitting to gradescope

### Replace the value of the population for the years given in the assignment file and save it as A1


### Calculate the value of the cubic spline interpolation of the data at t = 24.5 using the interp1d function.  Save this as A2.


### Use polyfit to calculate the coefficients for A3, A5, and A7
### Use norm to calculate the error for A4, A6, and A8



### Problem 2
data = np.genfromtxt('CO2_data.csv', delimiter=',')
t = data[0, :]
co2 = data[1, :]
### Don't delete the lines above when submitting to gradescope

### Use polyfit to calculate the coefficients for A9
### Use norm to calculate the error for A10


### Fit the exponential


### Fit the sinusoidal
### There are a few different ways to do this, and we will refrain from giving away the answer to this part.  The class has been doing loops for a while now, so this part should be doable, albeit a little tricky.  We can however check to see if there are any bugs that we can spot.
