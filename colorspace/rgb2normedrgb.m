function [output_image] = rgb2normedrgb(input_image)
% converts an RGB image into normalized rgb
R = double(input_image(:,:,1));
G = double(input_image(:,:,2));
B = double(input_image(:,:,3));
r = R./(R+G+B);
g = G./(R+G+B);
b = B./(R+G+B);
output_image = cat(3,r,g,b);end