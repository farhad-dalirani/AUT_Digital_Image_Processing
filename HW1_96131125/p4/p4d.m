% read source file
slm1 = imread('salam1.png');

% read encrypted file
slm2 = imread('salam2.png');

% make an logical image, where two coressponding pixels
% in source and encrypted images are equal set new pixel as
% 1(white) else 0(black)
different_pixels = (slm1 == slm2);
figure();
imshow(different_pixels)
imwrite(different_pixels, 'p4d.png');
