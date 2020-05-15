% read image
img = imread('iran_map.png');
img = im2bw(img, 0.02);

figure();
imshow(img);
title('Input Image');

img_open = imopen(img, ones(7,7));

figure();
imshow(img_open);
title('Modified Image');
imwrite(img_open, 'p5d.png')