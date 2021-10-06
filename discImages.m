function [X, Im_deleted] = discImages(X)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% Get your current directori 
cdir = fileparts(mfilename('fullpath'));
% Specify where are the images on your directory 
folder_path = fullfile(cdir, '/Other/Outliers-mixed-data');
% Specify the directory
im_folder = dir(folder_path);
% Get the filenames from that specific dir
fnames = {im_folder.name};
% Drop non interested files names and transpose 
fnames = fnames(3:end)';
% Create a vector with the locations of the filesnames. 1 indicates that
% has that image, 0 indicates that not contains
toDelete = contains(X.file_ext,fnames);
% Table of deleted rows (outliers)
Im_deleted = X(toDelete, :);
% Table without outliers.
X(toDelete, :) = [];



end

