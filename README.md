# Gen_Indi_Notch
Code for the paper "Early Detection of Sudden Transitions in Notch signaling", 2026.
# Probability Density and Free Energy Surface Generator

This repository provides a MATLAB implementation to compute a
2D probability density distribution and corresponding free-energy
surface (-log P) from simulation or experimental datasets.

The code is designed to be flexible and reusable:
- Any column in the dataset can be selected as variables
- Custom cutoff ranges and statistical weights can be defined
- Adjustable bin resolution
- Generates contour maps for visualization

## Method

The algorithm:
1. Reads numerical data from a text file
2. Bins two selected variables
3. Computes weighted probability distribution
4. Normalizes the distribution
5. Converts probability to free-energy surface using

F = -log(P)

6. Generates a contour plot

## Repository Structure

src/ – MATLAB source code  
examples/ – example dataset and test script  
docs/ – method explanation  
figures/ – example output plots  

## Usage

Example:

cutoffs = [
0 800
800 2200
2200 6000
];

weights = [1.2 1.0 1.0];

probability_map('example_data.txt','probability.out',2,3,300,cutoffs,weights)

## Input Format

The input file should contain numerical columns, for example:

col1 col2 col3 col4

Users specify which columns correspond to the variables of interest.

## Output

- Probability distribution file
- Free-energy contour plot

## Repository Structure

src/ – MATLAB source code  
examples/ – example dataset and script  
docs/ – method description  

## Author

Baishakhi Tikader
Indian Institute of Science Bangalore India
