% read image
img = imread('leo.jpg');

% show its histogram
imhist(img);
saveas(gcf,'p5a.png')

min(min(img))
max(max(img))
median(median(img))

