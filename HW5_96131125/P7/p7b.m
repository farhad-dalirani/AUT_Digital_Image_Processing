% load image
img = imread('queiroz.jpg');
img = im2double(img);
figure();
imshow(img);
title('Input Image');

img_open = imopen(img, ones(5,5));
img_close = imclose(img, ones(5,5));

% average of dilation and erosion ====> smoothing
img_smooth = (img_open+img_close)/2;

figure();
imshow(img_smooth);
title('Output Image');
imwrite(img_smooth, 'p7b.png')
