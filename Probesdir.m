clc; clear all;
cdir = fileparts(mfilename('fullpath'));
image_folder = fullfile(cdir, '/Stimulus/stimuli');

arr = {'AF01HAS.JPG', 'AF01SAS.JPG'};
y = length(arr);

image = fullfile(image_folder, 'AF01HAS.JPG');

A = imread(image);
I = rgb2gray(A);

image2 = fullfile(image_folder, 'AF01SAS.JPG');
B  = imread(image2);

[M,N,~] =  size(B);
x = M*N;
M = zeros(x, y);
p = [1, 1];


for i = 1:y
    % Specify the image path
    im_path = fullfile(image_folder, arr{i});
    % read the image
    im = imread(im_path);
    % Transform the rgb image to gray scale
    bim = rgb2gray(im);
    % Initializiate the class with that specific image 
    I = PatchTranf(bim, p);
    % Vectorize the image
    I_vec = I.vectorize;
    % Add vectorized image 
    M(:,i) = I_vec;
end




%{

for i = 1:n
    impath = fullfile(image_folder, arr{i});
    im = imread(impath);
    bim = rgb2gray(im);
    C{i} = bim;
end
    
    
    

   

image = fullfile(image_folder, 'AF01HAS.JPG')

A = imread(image);

image2 = fullfile(image_folder, 'AF01SAS.JPG')
B = imread(image2);

C = {A B};



% To go to the array we can C{1}

%}
