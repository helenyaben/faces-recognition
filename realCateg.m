function [T_out] = realCateg(T)
%REALCATEG Looks into the file_extension and finds the real category for
%the data.
%   T is a table with the file_extension variable.
%   We get the real categories from that variable, we have 3:
%   *SAS.JPG --> Sad category
%   *HAS.JPG --> Happy Category
%   *NES.JPG --> Neutral Category

% We create patterns to recognize the real categories in our data set.
% Sad Pattern
s_patt = 'SAS.JPG';
% Happy Pattern
h_patt = 'HAS.JPG';
% Neutral pattern
nsad_patt = '_SAS.JPG';
nhap_patt = '_HAP.JPG';

% We need the categories that decided 


% We create a binary vectors, 1 if the files contains the pattern 0
% otherwise. 
% Sad binary vector
s_vec = contains(T.file_ext,s_patt);
% Happy "binary" vector, 2 if the files contains the pattern 0
% otherwise. 
h_vec = contains(T.file_ext,h_patt)*2;
% Neutral "binary" vector, 3 if the files contains the pattern 0
% otherwise. 
nsad_vec = contains(T.file_ext,nsad_patt)*3;

nhap_vec = contains(T.file_ext,nhap_patt)*4;

% We create a vector as the sum of the others
Input = s_vec + h_vec + nsad_vec + nhap_vec;

% Create two vectors to map each value with the corresponedent category
V = [1 2 3 4];
Cat = {'R-Sad', 'R-Happy', 'R-Sad', 'R-Happy'};
% Create a cell array all with unknown values.
StrOut = repmat({'Unknown'}, size(Input));
% Get the unique values and indexes to create the unique vector if unique
% values
[tf, idx] = ismember(Input, V);
StrOut(tf) = Cat(idx(tf));

% Create a new column and set the real category values 
T.RealCat = StrOut;

T_out = T;

% Remove variables we no longer need
T_out = removevars(T_out,{'file_ext'});

% Reorder variables
T_out =  [T_out(:,1:2) T_out(:,6) T_out(:,4:5) T_out(:,3)];

% We could create a dictionary with the other files extensions and we could
% select them with some inputs 
% https://se.mathworks.com/help/matlab/matlab_prog/creating-a-map-object.html
end

