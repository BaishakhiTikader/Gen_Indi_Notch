clc
clear

nmax = 300;

cutoffs = [
0 600
600 1200
1200 6000
];

weights = [
1.2
1.0
1.0
];

generate_probability_map('NDJ_example_dataset.txt',nmax,cutoffs,weights)
