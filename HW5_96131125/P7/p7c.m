% load image
img = imread('jahanbakhsh.jpg');
img = im2double(img);
figure();
imshow(img);
title('Input Image');

img_erosion = imerode(img, ones(5,5));
img_dilation = imdilate(img, ones(5,5));

% 2th derivation
img_der = img - (img_erosion+img_dilation)/2;
img_der = imadjust(img_der);

figure();
imshow(img_der);
title('Output Image');
imwrite(img_der, 'p7c.png')
