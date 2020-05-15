% read source file
src = imread('source.png');

% read encrypted file
enc = imread('encrypted.png');

% make an logical image, where two coressponding pixels
% in source and encrypted images are equal set new pixel as
% 1(white) else 0(black)
different_pixels = (src == enc);
figure();
imshow(different_pixels)
imwrite(different_pixels, 'p4c.png');


% display images
figure();
subplot(1,3,1);
imshow(src);
title('Source Image');
subplot(1,3,2);
imshow(enc);
title('encrypted Image');
subplot(1,3,3);
imshow(different_pixels);
title('Hidden Message');

