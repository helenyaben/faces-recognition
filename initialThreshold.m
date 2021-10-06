function [T, T_deleted] = initialThreshold(T, max,min)
%INITIALTHRESHOLD Set max and min values respectively to delete outliers.
%default values. max--> 3, min--> 0.2
%   Get rid of the outliers before normalizing the data
%   Delate the rows that are above or below the max and min values
%   respectively. Store them in a separated table.
if nargin < 2
    max = 3;
    min = 0.2;
elseif nargin < 3
    min = 0.2;
else
    %Do nothing
end


% Binary array, 1 where fulfills the next statement
toDelete = T.time > max | T.time < min;
% Table of deleted rows (outliers)
T_deleted = T(toDelete, :);
% Table without outliers.
T(toDelete, :) = [];

end

