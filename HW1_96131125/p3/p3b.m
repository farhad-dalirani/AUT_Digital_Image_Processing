% Read kitten image
img = imread('kitten.jpg');

% show histogram of image
imhist(img);

img_hist = figure ; bar(imhist(img));
saveas(img_hist ,'p3b.png')
