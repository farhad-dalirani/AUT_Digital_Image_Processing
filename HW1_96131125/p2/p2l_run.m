%read Trump image
T1 = imread('trump.jpg');

% convert rgb to gray scale
T2 = rgb2gray(T1);

% Horizontal Flip
hor = p2l_func(T2, 2);
figure();
imshow(hor);
imwrite(hor, 'p2l-1.png')
title('Horizontal Flip');

% Vertical Flip
ver = p2l_func(T2, 1);
figure();
imshow(ver);
imwrite(ver, 'p2l-2.png')
title('Vertical Flip');

isequal(hor, flipdim(T2, 2))
isequal(ver, flipdim(T2, 1))