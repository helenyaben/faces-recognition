function [X_out, output] = featureNorm(X,max, min)
%TIMENORM Normalized the time respone for each person.
%   X is the original results table
%   min--> Threshhold. Below min value we'll consider a point an
%   outlier.
%   max-->min--> Threshhold. Above max value we'll consider a point an
%   outlier.
if nargin < 2
    max = 3;
    min = 0.2;
elseif nargin < 3
    min = 0.2;
else
    %Do nothing
end


% Delate the rows that are above or below the max and min values
% respectively.
toDelate = X.time > max | X.time < min;
X(toDelate, :) = [];


% Now we can calculate the mean and the standard deviation for the
% different persons
% Search for unique id's
[C, ~, ci] = unique(X(:, 'id'));
% Calculte the mean for each different id.
mu = accumarray(ci, X.time, [], @mean);
% Calculate the standard deviation
s = accumarray(ci, X.time, [], @std);
% Create a table with the means and standard deviation for each id
output = [C num2cell([mu s])];
% Set the variable names of the table
output.Properties.VariableNames = {'id', 'mean', 'std'};

% Create a inner join to add for each row the correspondent mu and sigma
% and standard deviation.
X_out = innerjoin(X,output);

% Create a new column with the normalized time
X_out.norm = (X_out.time-X_out.mean);
X_out.norm = X_out.norm./X_out.std;

% Remove variables we no longer need
X_out = removevars(X_out,{'mean' , 'std'});


% We can now check if there are some outliers with the standard deviation.
% Depends on which is our confindece interval. s, 2s, or 3s. 
% Rememeber that on our discretization of the data qe'll have to use some
% rule for the discratization.


end





