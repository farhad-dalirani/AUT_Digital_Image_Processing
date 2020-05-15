%read Trump image
T1 = imread('trump.jpg');
size(T1)
% convert rgb to gray scale
T2 = rgb2gray(T1);

% convert rgb to gray scale
T2_mine = p2h_func(T1);

figure();
subplot(1,2,1);
imshow(T2);
title('Matlab rgb2gray');
subplot(1,2,2);
imshow(T2_mine);
imwrite(T2_mine, 'p2h.png');
title('My rgb2gray 1');

isequal(T2, T2_mine)