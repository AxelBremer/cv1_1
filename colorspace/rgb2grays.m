function [output_image] = rgb2grays(input_image)
% converts an RGB into grayscale by using 4 different methods


R = double(input_image(:,:,1));


G = double(input_image(:,:,2));


B = double(input_image(:,:,3));

% lightness method
ma = max(R,G);
ma = max(ma,B);
mi = min(R,G);
mi = min(mi,B);
light = (ma+mi)/2;
size(light);

% average method
avg = (R+G+B)/3;

% luminosity method
lum = 0.21*R + 0.72*G + 0.07*B;

% built-in MATLAB function 
blt = rgb2gray(input_image);

output_image = cat(4, light, avg, lum, blt);
 
end

