albedo = imread('ball_albedo.png');
shading = imread('ball_shading.png');
ball = imread('ball.png');

iid_image_formation(albedo,shading,ball);

green_albedo = recoloring(albedo);

iid_image_formation(green_albedo,shading,ball);