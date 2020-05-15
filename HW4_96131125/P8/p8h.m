% Read Image
img_org = imread('louis_daguerre.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

% turn to double
img = im2double(img_org);

% median filter
filtered_img1 = ordfilt2(img, 4, ones(3,3));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8h_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1);

% sharp filter
filtered_img2 = imsharpen(filtered_img1);

% show filtered image
figure();
imshow(filtered_img2);
imwrite(filtered_img2, 'p8h_filtered_2.png');
title('image after filter 1');
figure();
imhist(filtered_img2);
