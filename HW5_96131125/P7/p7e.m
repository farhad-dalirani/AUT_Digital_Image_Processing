% load image
img = imread('jahanbakhsh.jpg');
img = im2double(img);
figure();
imshow(img);
title('Input Image');

img_open = imopen(img, ones(5,5));
img_close = imclose(img, ones(5,5));
img_erode = imerode(img, ones(5,5));
img_dilate = imdilate(img, ones(5,5));

% 2th derivation
img_der = img-((img_close-img_dilate)/2 + (img_open+img_erode)/2);
img_der = imadjust(img_der);

figure();
imshow(img_der);
title('Output Image');
imwrite(img_der, 'p7e.png')
