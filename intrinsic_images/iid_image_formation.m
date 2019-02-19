
albedo = imread('ball_albedo.png');
shading = imread('ball_shading.png');
image = albedo.*shading;
imshow(image);