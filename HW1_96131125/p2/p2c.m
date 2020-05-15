T1 = imread('trump.jpg');
T2 = rgb2gray(T1);

% crop a 50*50 recangle
img_crop = imcrop(T2, [370, 170, 50, 50]);

imshow(img_crop);
title('A 50*50 part from Trump Gray Scale');

imwrite(img_crop, 'p2c.png')