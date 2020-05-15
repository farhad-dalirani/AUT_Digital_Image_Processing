% read source file
leo1 = imread('leo1.png');

% read encrypted file
leo2 = imread('leo2.png');

% make an logical image, where two coressponding pixels
% in source and encrypted images are equal set new pixel as
% 1(white) else 0(black)
%different_pixels = (leo1 == leo2);
different_pixels = (leo1 == leo2);

figure();
imshow(different_pixels)
imwrite(different_pixels, 'p4e.png');
