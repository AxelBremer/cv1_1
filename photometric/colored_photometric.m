%% Colored photometric
dir = strcat(pwd,'/photometrics_images/SphereColor/');

albedos_per_channel = cell(1,3);
normals_per_channel = cell(1,3);
imgs_per_channel = cell(1,3);


for i = 1:3

    [image_stack, scriptV] = load_syn_images(dir, i);

    [h, w, n] = size(image_stack);
    
    fprintf('Finish loading %d images.\n\n', n);
    
    disp('Computing surface albedo and normal map...')
    
    [albedo, normals] = estimate_alb_nrm(image_stack, scriptV, true);
    albedos_per_channel{i} = albedo;
    normals_per_channel{i} = normals;
    imgs_per_channel{i} = image_stack;
end

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?

normals = normals_per_channel{3};
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

return

albedo = cat(3, albedos_per_channel{1}, albedos_per_channel{2}, albedos_per_channel{3});

%% Convert images to grayscale for normals
image_stack = cat(4, imgs_per_channel{1}, imgs_per_channel{2}, imgs_per_channel{3});
image_stack = permute(image_stack, [1 2 4 3]);
g_image_stack = zeros(h,w);
for i = 1:n
   im = image_stack(:,:,:,i);
   im = rgb2gray(im);
   g_image_stack = cat(3, g_image_stack, im);
end
g_image_stack = g_image_stack(:,:,2:end);
disp(size(g_image_stack));
disp(size(scriptV));
[joe, normals] = estimate_alb_nrm(g_image_stack, scriptV, true);
normals = (normals_per_channel{1} + normals_per_channel{2} + normals_per_channel{3});

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?

disp('Integrability checking')

[p, q, SE] = check_integrability(normals);

threshold = 0.005;

SE(SE <= threshold) = NaN; % for good visualization

fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));
%% compute the surface height
height_map = construct_surface( p, q, 'column');

[x_end, y_end, ~] = size(height_map);
x = 1:16:x_end;
y = 1:16:y_end;
quiver3(x, y, height_map(1:16:end, 1:16:end), normals(1:16:end,1:16:end,1), normals(1:16:end,1:16:end,2), normals(1:16:end,1:16:end,3))

show_results(albedo, normals, SE);

show_model(albedo, height_map);
