function plot_iid = iid_image_formation(albedo, shading, original_image)

image = uint16(albedo).*uint16(shading);

figure,
subplot(2,2,1), imshow(original_image), title("original");
subplot(2,2,2), imshow(image), title("constructed");
subplot(2,2,3), imshow(albedo), title("albedo");
subplot(2,2,4), imshow(shading), title("shading");

end