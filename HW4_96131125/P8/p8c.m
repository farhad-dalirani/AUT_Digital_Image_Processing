% Read Image
img_org = imread('boulevard_du_temple.jpg');
figure();
imshow(img_org);
title('Input Image');

%img = rgb2gray(img_org);
img = im2double(img_org);

% max filter
filtered_img1 =  ordfilt2(img,9,ones(3,3));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8c_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1(:,:,1));

% gaussian filter
filtered_img2 =  imgaussfilt(filtered_img1,0.8);

% show filtered image
figure();
imshow(filtered_img2);
imwrite(filtered_img2, 'p8c_filtered_2.png');
title('image after filter 2');
figure();
imhist(filtered_img2(:,:,1));


