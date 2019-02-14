%% Question 1

% directory where all the images are stored
image_dir = strcat(pwd,'/photometrics_images/SphereGray5');

% the image channel is set to the default = 1
channel = 1;

% stack the images and load scriptV
[image_stack, scriptV] = load_syn_images(image_dir, channel);

% shadow trick is set to false
shadow_trick = false;

% load the albedo and the surface normal
[albedo, normal] = estimate_alb_nrm(image_stack, scriptV, shadow_trick);
%%