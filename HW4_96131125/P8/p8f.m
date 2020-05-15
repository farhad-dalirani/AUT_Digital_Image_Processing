% Read Image
img_org = imread('john_quincy_adams.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

% turn to double
img = im2double(img_org);

% median filter 
filtered_img1 = img;
filtered_img1(:,:,1) = ordfilt2(img(:,:,1),8,ones(4,4));
filtered_img1(:,:,2) = ordfilt2(img(:,:,2),8,ones(4,4));
filtered_img1(:,:,3) = ordfilt2(img(:,:,3),8,ones(4,4));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8f_filtered_1.png');
title('image after filter 1');




