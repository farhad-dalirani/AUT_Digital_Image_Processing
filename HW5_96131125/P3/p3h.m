% read image
img = imread('barcode_grayscale.jpg');
img = im2double(img);

figure();
imshow(img);
title('Input Image');

% structuring element
st =   ones(15,3);
st = st .* 1;

% call closing
closing_img = gray_closing(img, st);

figure();
imshow(closing_img);
title('Closinging - Image');
imwrite(closing_img, 'p3h.png');

