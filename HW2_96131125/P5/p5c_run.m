% read image and show it
img = imread('leo.jpg');
figure()
imshow(img)
title('Image before histogram equalization')

% show its histogram
figure();
imhist(img);
title('Histogram before equalization')

% applying histogram equalization - my implementation
img_he = histeq_mine(img);
imwrite(img_he, 'p5c-1.png');

% show image after equalization
figure()
imshow(img_he)
title('Image after histogram equalization')

% show its histogram
figure();
imhist(img_he);
title('Histogram after equalization')
saveas(gcf,'p5c-2.png')


