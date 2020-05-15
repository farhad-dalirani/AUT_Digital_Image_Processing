%read Trump image
T1 = imread('trump.jpg');

% convert rgb to gray scale
T2 = rgb2gray(T1);

% Horizontal Flip
T3 = flipdim(T2, 2);
figure();
imshow(T3);
imwrite(T3, 'p2f-1.png')
title('Horizontal Flip');

% Vertical Flip
ver = flipdim(T2, 1);
figure();
imshow(ver);
imwrite(ver, 'p2f-2.png')
title('Vertical Flip');