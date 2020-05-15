% Read Image
img_org = imread('robert_cornelius_selfie.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

img = im2double(img_org);

% wiener2 filter
filtered_img0 = img;
filtered_img0(:,:,1) =  wiener2(img(:,:,1),[7,7]);
filtered_img0(:,:,2) =  wiener2(img(:,:,2),[7,7]);
filtered_img0(:,:,3) =  wiener2(img(:,:,3),[7,7]);

% show filtered image
figure();
imshow(filtered_img0);
imwrite(filtered_img0, 'p8d_filtered_0.png');
title('image after filter 0');
figure();
imhist(filtered_img0(:,:,1));

% min filter
filtered_img1 = filtered_img0;
filtered_img1(:,:,1) =  ordfilt2(filtered_img0(:,:,1),3,ones(4,4));
filtered_img1(:,:,2) =  ordfilt2(filtered_img0(:,:,2),3,ones(4,4));
filtered_img1(:,:,3) =  ordfilt2(filtered_img0(:,:,3),3,ones(4,4));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8d_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1(:,:,1));

% histeq filter
% filtered_img2 = filtered_img1;
% filtered_img2(:,:,1) =  histeq(filtered_img1(:,:,1).^1.5);
% filtered_img2(:,:,2) =  histeq(filtered_img1(:,:,2).^1.5);
% filtered_img2(:,:,3) =  histeq(filtered_img1(:,:,3).^1.5);

% show filtered image
% figure();
% imshow(filtered_img2);
% imwrite(filtered_img2, 'p8d_filtered_2.png');
% title('image after filter 2');
% figure();
% imhist(filtered_img2(:,:,1));

