import numpy as np
import scipy.linalg as la


### Problem 1

### Jacobi and Gauss Seidel Iteration functions
### Create your functions here
### Both functions will need two outputs and three inputs
### The code within the function will be very similar to
### Week 4 coding lecture 2




### Once you have created your functions initialize your matrix A and RHS b




### Use your Jacobi and Gauss-Seidel functions to find A1 through A4.





### Problem 2
###  Initialize your Day 0 vector x



###  Part 1: without a vaccine
###  Make sure to have p = 0
###  Initialize the SIR matrix M, and save it as A5




###  Create a loop to find the day that the number of infected
###  individuals hits 50% and another loop for the steady state of the
###  infected population
###  There is away to put everything under one loop if you make clever use
###  of conditionals




### Save the days and steady state in a row vector A6




###  Reinitialize your Day 0 vector x




###  Part 2: with a vaccine
###  Make sure to have p = 2/1000
###  Initialize the SIR matrix M, and save it as A7





###  Create a loop to find the day that the number of infected
###  individuals hits 50% and another loop for the steady state of the
###  infected population
###  There is a way to put everything under one loop if you make clever use
###  of conditionals




### Save the days and steady state in a row vector A8



### Problem 3

###  Initialize your 114x114 tridiagonal matrix A




###  Initialize your 114x1 RHS column vector rho




###  Create a column vector phi that contains the exact solution given in
###  the assignment file




###  Implement Jacobi's method for this system.
###  Don't use the function you created before because that was designed for
###  a specific task, and will not work here.

### Matrix Iteration Function -- students don't have to use a function for this








###  Save the difference of the Jacobi solution and the exact solution as
###  A13.  Use the maximal entry in absolute value to calculate this error.




###  Implement Gauss-Seidel for this system.
###  Don't use the function you created before because that was designed for
###  a specific task, and will not work here.




###  Save the difference of the Gauss-Seidel solution and the exact solution as
###  A16.  Use the maximal entry in absolute value to calculate this error.

