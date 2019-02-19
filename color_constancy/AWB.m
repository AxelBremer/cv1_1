function color_corrected_img = AWB()
original_img = imread('awb.jpg');

reshaped_img = reshape(original_img, [], 3);
avgRGB = mean(reshaped_img, 1);

gray = [128, 128, 128];

vonKriesCoef = gray./avgRGB;

red = vonKriesCoef(1) * reshaped_img(:,1);
green = vonKriesCoef(2) * reshaped_img(:,2);
blue = vonKriesCoef(3) * reshaped_img(:,3);

color_corrected_img = reshape([red, green, blue], 320, 256, 3);

subplot(1,2,1);
imshow(original_img);
title("Original image");
subplot(1,2,2);
imshow(color_corrected_img);
title("Color corrected image");
end