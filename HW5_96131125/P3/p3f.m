% read image
img = imread('barcode_grayscale.jpg');
img = im2double(img);

figure();
imshow(img);
title('Input Image');

% structuring element
st =   ones(15, 5);
st = st .* 0.01;

% call erosion
erosion_img = gray_erosion(img, st);

figure();
imshow(erosion_img);
title('Erosion - Image');
imwrite(erosion_img, 'p3f.png');
