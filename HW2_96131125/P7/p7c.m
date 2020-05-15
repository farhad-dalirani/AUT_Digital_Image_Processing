% read image
img = imread('cat_selfie.jpg');

% show image
imshow(img);
title('Input Image');

% complement
img = 255 - img;
imshow(img);
title('complement Image');

imwrite(img, 'p7c.png');