% read image and show it
img = imread('beach.jpg');
img = rgb2gray(img);

figure();
imshow(img);
title('Image before histogram equalization');

figure();
imhist(img);
title('Histogram of beach.jpg');
saveas(gcf,'p6a-1-hist.png')

% applying histogram equalization - my implementation
img_he = histeq_mine(img);
imwrite(img_he, 'p6a-1.png');

% show image after equalization
figure()
imshow(img_he)
title('Image after histogram equalization')

% histogram of beach after histogram equalization
figure();
imhist(img_he);
title('Histogram of beach.jpg after histogram equalization');
saveas(gcf,'p6a-1-hist-hist_eq.png')


% read image and show it
img = imread('car.jpg');
img = rgb2gray(img);

figure()
imshow(img)
title('Image before histogram equalization')

% histogram
figure();
imhist(img);
title('Histogram of car.jpg');
saveas(gcf,'p6a-2-hist.png')

% applying histogram equalization - my implementation
img_he = histeq_mine(img);
imwrite(img_he, 'p6a-2.png');

% show image after equalization
figure()
imshow(img_he)
title('Image after histogram equalization')


% histogram of beach after histogram equalization
figure();
imhist(img_he);
title('Histogram of car.jpg after histogram equalization');
saveas(gcf,'p6a-2-hist-hist_eq.png')
