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
