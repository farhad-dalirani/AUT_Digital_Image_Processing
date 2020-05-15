%read Trump image
T1 = imread('trump.jpg');

% convert rgb to gray scale
T2 = rgb2gray(T1);

% Horizontal Flip
T3 = flipdim(T2, 2);

%concat two images T2 and T3
T2T3 = [T2, T3];
imshow(T2T3);
imwrite(T2T3, 'p2g.png');