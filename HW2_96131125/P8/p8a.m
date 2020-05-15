% read image
img = imread('hobbiton.jpg');

% plot histogram and show image
figure();
imshow(img);
title('input image');
figure();
imhist(img);
title('Histogram of input image');
saveas(gcf, 'p8a-input-hist.png');

% slide histogram 25 percent to right
img_slide_right = img + 64;
% plot histogram and show image
figure();
imshow(img_slide_right);
title('image - histogram slided 25 percent to right');
imwrite(img_slide_right, 'p8a-slide-right.png');
figure();
imhist(img_slide_right);
title('Histogram of slided image to right');
saveas(gcf, 'p8a-image-slided-right.png');

% slide histogram 25 percent to left
img_slide_left = img - 64;
% plot histogram and show image
figure();
imshow(img_slide_left);
title('image - histogram slided 25 percent to left');
imwrite(img_slide_left, 'p8a-slide-left.png');
figure();
imhist(img_slide_left);
title('Histogram of slided image to left');
saveas(gcf, 'p8a-image-slided-left.png');
