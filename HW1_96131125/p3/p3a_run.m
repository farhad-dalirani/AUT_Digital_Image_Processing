% Read kitten image
img = imread('kitten.jpg');

% Get threshold of image with 3 different thresholds
img_t1 = p3a_func(img, 75);
img_t2 = p3a_func(img, 150);
img_t3 = p3a_func(img, 225);

% save pictures
imwrite(img_t1, 'p3a-1.png')
imwrite(img_t2, 'p3a-2.png')
imwrite(img_t3, 'p3a-3.png')

% display images
figure();
subplot(2,2,1);
imshow(img);
title('Input Image');
subplot(2,2,2);
imshow(img_t1);
title('Threshold 75');
subplot(2,2,3);
imshow(img_t2);
title('Threshold 150');
subplot(2,2,4);
imshow(img_t3);
title('Threshold 225');