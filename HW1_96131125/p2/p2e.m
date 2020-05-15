%read Trump image
T1 = imread('trump.jpg');

% convert rgb to gray scale
T2 = rgb2gray(T1);

%scale by factor 0.5
scale_half = imresize(T2, 0.5);
figure();
imshow(scale_half);
title('Scale 0.5');
imwrite(scale_half, 'p2e-1.png')

%scale by factor 2
scale_two = imresize(T2, 2);
figure();
imshow(scale_two);
title('Scale 2');
imwrite(scale_two, 'p2e-2.png')