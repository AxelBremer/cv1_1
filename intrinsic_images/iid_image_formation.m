function plot_iid = iid_image_formation(albedo, shading, original_image)

image = ( shading/mean(shading,'all') ).*( albedo/ (mean(albedo,'all')^2) );

figure,
subplot(2,2,1), imshow(original_image), title("original");
subplot(2,2,2), imshow(image), title("constructed");
subplot(2,2,3), imshow(uint8(albedo)), title("albedo");
subplot(2,2,4), imshow(uint8(shading)), title("shading");

end