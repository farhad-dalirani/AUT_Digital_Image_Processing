% read image and show it
img = imread('car_plate.jpg');
img = rgb2gray(img);

figure()
imshow(img)
title('Image before histogram equalization')

% applying histogram equalization - my implementation
img_he = histeq_mine(img);
imwrite(img_he, 'p5f.png');

% show image after equalization
figure()
imshow(img_he)
title('Image after histogram equalization')


