function visualize(input_image)

if size(input_image,3) == 3
    
    R = double(input_image(:,:,1));
    G = double(input_image(:,:,2));
    B = double(input_image(:,:,3));
            
    subplot(2,2,1);    
    imshow(R);    
    subplot(2,2,2);    
    imshow(G);    
    subplot(2,2,3);    
    imshow(B);    
    subplot(2,2,4);    
    imshow(input_image);
    
else
    
    R = double(input_image(:,:,1));
    G = double(input_image(:,:,2));
    B = double(input_image(:,:,3));
    Q = double(input_image(:,:,4));    
    
    subplot(2,2,1);
    
    imshow(R);
    
    subplot(2,2,2);
    
    imshow(G);
    
    subplot(2,2,3);
    
    imshow(B);
    
    subplot(2,2,4);
    
    imshow(Q);
    
end

