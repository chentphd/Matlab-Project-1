# AMS595_Project1
Brief Documentation – AMS 595 Project 1
GitHub Repository: https://github.com/TonyChenSBU/AMS595_Project1
Q1. Base Converter
`BaseConverter.m`
Description: This script prompts the user for three inputs: an integer `n` (where 2 ≤ n ≤ 10), a number in base-n, and an integer `m` (where 2 ≤ m ≤ 10). It then converts the user's number from base-n to base-m and prints the result.
Usage:
1. Run the script `BaseConverter.m`.
2. Follow the prompts to input `n`, the number in base-n, and `m`.
3. The script will convert the number and display the result.

Q2. Gaussian Elimination
`GaussElim.m`
Description: This function, `GaussElim(A, b)`, performs Gaussian elimination to solve a system of linear equations of the form `Ax = b`, where `A` is a square matrix and `b` is a vector.
Usage:
1. Run the script `BaseConverter.m`.
2. Follow the prompts to input n x n matrix A and n x 1 vector 
3. The script will display solution vector, x.
- `A` is an n × n matrix.
- `b` is an n × 1 vector.
- `x` is the solution vector.

Q3. Approximating π
`MontePi.m`
Description: This function, `MontePi(n)`, approximates π using a Monte Carlo algorithm. It generates `n` random points and calculates the ratio of points inside a quarter circle to the total points, providing an approximation of π.
Usage:
[piApprox, absError, relError] = MontePi(n);
- `n` is the total number of points.
- `piApprox` is the estimated value of π.
- `absError` is the absolute error from the true value of π.
- `relError` is the relative error as a ratio.

 `MontePiPlots.m`
Description:
This script constructs three plots for analyzing the Monte Carlo algorithm:
1. Execution time vs. number of points.
2. Absolute error vs. number of points.
3. A graphical display of random points generated.
Usage:
1. Run the script `MontePiPlots.m`.
2. Follow the prompts to input the matrix `A` and vector `b`.
3. The script will generate the plots.

