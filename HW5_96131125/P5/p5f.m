% read image
img = imread('shahnameh.jpg');
img = im2bw(img, 0.9);
% negative image
img = 1-img;

figure();
imshow(img);
title('Input Image');

img_close = imclose(img, [0, 0, 1; 0, 1, 0; 1, 0, 0]);
img_close = imclose(img_close, [1; 1; 1]);


figure();
imshow(1-img_close);
title('Modified Image');
imwrite(1-img_close, 'p5f.png');
