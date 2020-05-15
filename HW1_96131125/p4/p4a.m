% read source file
src = imread('source.png');

% read encrypted file
enc = imread('encrypted.png');

% display images
figure();
subplot(1,2,1);
imshow(src);
title('Source Image');
subplot(1,2,2);
imshow(enc);
title('encrypted Image');
