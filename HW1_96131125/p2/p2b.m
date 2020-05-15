T1 = imread('trump.jpg');
T2 = rgb2gray(T1);
imshow(T2);
title('Trump Gray Scale');

imwrite(T2, 'p2b.png')