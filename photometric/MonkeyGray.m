%% MonkeyGray

dir = strcat(pwd,'/photometrics_images/MonkeyGray/');

[image_stack, scriptV] = load_syn_images(dir);

%image_stack = image_stack(:,:,1:25);

%scriptV = scriptV(1:25,:);

[h, w, n] = size(image_stack);

fprintf('Finish loading %d images.\n\n', n);

disp('Computing surface albedo and normal map...')

[albedo, normals] = estimate_alb_nrm(image_stack, scriptV, false);



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



imshow(albedo)