clear
clc

cutoffs = [
0 500
500 1500
1500 3000
];

weights = [1.2 1.0 1.0];

probability_map('../data/example_data.txt',...
                'probability.out',...
                2,3,200,...
                cutoffs,...
                weights)
