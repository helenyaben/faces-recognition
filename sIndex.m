function [Hap, Sad] = sIndex(X)
%SIND Creates a continuous strength index from the time responeses.
%   Detailed explanation goes here

% Delete unecessary info
X(:,2:end-1) = [];
% Obtain the real categories using the f_ext
X = realCateg(X);
% Split The Data into two tables, Happy and Sad, so we can make our
% strencgth index. 
Hap = X(ismember(X.RealCat, 'R-Happy'),:);
Sad = X(ismember(X.RealCat, 'R-Sad'),:);
% Delete unecesary columns
Hap(:,'RealCat') = [];
Sad(:,'RealCat') = [];


% Calculate sigma and standard deviations: Calculated with the happy and
% sad matrices. It can also be calculated as a hole. From X 
% Mean and std from Happy
mu = mean(Hap.mean);
sigma = std(Hap.mean);
% Add the columns to the table 
Hap.mu = ones(length(Hap.mean),1)*mu;
Hap.sigma = ones(length(Hap.mean),1)*sigma;
% Mean and std from Sad
mu = mean(Sad.mean);
sigma = std(Sad.mean);
% Add the columns to the table
Sad.mu = ones(length(Sad.mean),1)*mu;
Sad.sigma = ones(length(Sad.mean),1)*sigma;





end

