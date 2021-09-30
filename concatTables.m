function [X] = concatTables(X,varargin)
%CONCATTABLE concatenates two or more tables. They can be normalized or not
% All Tables MUST be the same type (norm or not). 
%   At least it must be provided 1 Table, your original table.
%   Function used in case we have more than 1 results.txt and we have
%   already start working with it. 

switch nargin
    case 0 
        error('No input arguments');
    case 1
        disp('Output is the same as input')
    otherwise
        x = string(X.Properties.VariableNames);
        for i = 1:length(varargin)
            y = string(varargin{i}.Properties.VariableNames);
            if x ~= y
                Y = setLabels(varargin{i});
                X = [X; Y];
            else
                X = [X; varargin{i}];           
            end
        end
       
        
end

