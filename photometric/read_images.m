folder = strcat(pwd,'\photometrics_images\SphereGray5');

filePattern = fullfile(folder, '*.png');
pngFiles = dir(filePattern)
disp(pngFiles(1))
for k = 1:length(pngFiles)
    baseFileName = pngFiles(k).name;
    fullFileName = fullfile(folder, baseFileName);
    %fprintf(1, 'Now reading %s\n', fullFileName);
    imageArray = imread(fullFileName);
    imshow(imageArray);  % Display image.
    %drawnow; % Force display to update immediately.
end