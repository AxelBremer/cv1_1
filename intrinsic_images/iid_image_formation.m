
albedo = double(imread('ball_albedo.png'));
shading = double(imread('ball_shading.png'));
ball = imread('ball.png');
image = ( shading/mean(shading,'all') ).*( albedo/ (mean(albedo,'all')^2) );
figure, imshow(image);
title('constructed image');
figure, imshow(ball);
title('original image')