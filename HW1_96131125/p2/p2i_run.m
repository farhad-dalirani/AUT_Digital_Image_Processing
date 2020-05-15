T1 = imread('trump.jpg');
T2 = rgb2gray(T1);

% crop a 50*50 recangle
img_crop = imcrop(T2, [370, 170, 50, 50]);

% crop a 50 * 50 rectangle using function p2i_run
img_crop_me = p2i_func(T2, [170, 370, 50, 50]);

figure();
subplot(1,2,1);
imshow(img_crop);
title('Matlab Crop');

subplot(1,2,2);
imshow(img_crop_me);
title('My Crop');

imwrite(img_crop_me, 'p2i.png');

isequal(img_crop, img_crop_me)
