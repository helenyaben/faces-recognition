function Io = HistStrech(I, min_out, max_out)
%HistStrech Returns an image where the pixel values in the input image
% are stretched to be in the interval [0-255]
%   
% Transform into a double data. This is done since Matlab cannot calculate
% fractions using integers such as the uint8 format
Itemp = double(I);

% Originals vax and min values from the image.
Pmax = max(max(Itemp));
Pmin = min(min(Itemp));

Io = uint8(((max_out - min_out)/(Pmax-Pmin))*(Itemp-Pmin) + min_out);

end

