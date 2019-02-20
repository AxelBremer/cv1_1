close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
% image_dir = './SphereGray5/'   % TODO: get the path of the script
image_dir = strcat(pwd,'/photometrics_images/SphereGray25');
% image_ext = '*.png';

[image_stack, scriptV] = load_syn_images(image_dir);
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);

% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV, true);

%% Show albedo and normal
figure(1)
imshow(albedo)
figure(2)
imshow(normals)

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q, 'average' );

%%
%surf(height_map);
[x_end, y_end, ~] = size(height_map);
x = 1:6:x_end;
y = 1:6:y_end;
quiver3(x, y, height_map(1:6:end, 1:6:end), normals(1:6:end,1:6:end,1), normals(1:6:end,1:6:end,2), normals(1:6:end,1:6:end,3))

%% Display
show_results(albedo, normals, SE);
show_model(albedo, height_map);

%% Face
face_dir = strcat(pwd,'/photometrics_images/yaleB02/');
[image_stack, scriptV] = load_face_images(face_dir);
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);
disp('Computing surface albedo and normal map...')
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV, true);

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q, 'column');

show_results(albedo, normals, SE);
show_model(albedo, height_map);

