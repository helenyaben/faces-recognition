function [X] = setLabels(X, varargin)
%SETLABELS changes the labels of out table. 
%   X--> Table. Must be prrovided.
%   If no labels are given it sets default labels.
    switch nargin 
        case 0
            error('Insufficient inputs')
        case 1
            att = {'id', 'photo', 'file_ext', 'GuesCat', 'time'};
            X.Properties.VariableNames = att;
        case 2
            att = varargin{1};
            X.Properties.VariableNames = att;
        otherwise
            error('Unexpected inputs')
    end
end