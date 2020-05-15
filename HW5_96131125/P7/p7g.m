% load image
img = imread('ghoddos.jpg');
img = im2double(img);
figure();
imshow(img);
title('Input Image');

img_open = imopen(img, ones(5,5)); % gama
img_close = imclose(img, ones(5,5)); % phi
img_erode = imerode(img, ones(5,5)); % epsilon
img_dilate = imdilate(img, ones(5,5)); %delta

% gradient
img_gra = img_close-img_open;
%img_gra = imadjust(img_gra);

figure();
imshow(img_gra);
title('Output Image');
imwrite(img_gra, 'p7g.png')
