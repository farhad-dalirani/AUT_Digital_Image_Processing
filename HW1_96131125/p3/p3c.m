% Read kitten image
img = imread('kitten.jpg');

% show histogram of image
figure();
imhist(img);

% thresholding
img_threshold = p3a_func(img, 150);

% display image
figure();
imshow(img_threshold);

% save image
imwrite(img_threshold, 'p3c.png')