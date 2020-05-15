% load image
img = imread('queiroz.jpg');
img = im2double(img);
figure();
imshow(img);
title('Input Image');

img_erosion = imerode(img, ones(5,5));
img_dilation = imdilate(img, ones(5,5));

% average of dilation and erosion ====> smoothing
img_smooth = (img_erosion+img_dilation)/2;

figure();
imshow(img_smooth);
title('Output Image');
imwrite(img_smooth, 'p7a.png')
