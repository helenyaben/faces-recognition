clc; clear all;
%% Read and basic manipulation

% Read the file.txt
X = readtable('results-Alex.txt');

% 
Y = setLabels(X);
P = setLabels(X);
L = setLabels(X);

y = Y.Properties.VariableNames;
p = P.Properties.VariableNames;

Y = Y(1:10,:);
size(Y)
X = X(50:70,:);
size(X)
G = concatTables(Y, X);
size(G)


% Get the 
%[C, ai, ci] = unique(X(:, 'id'));





            
            
            
            