% read image
img = imread('sleep_to_dream.png');
img = im2bw(img, 0.02);
img = 1-img;

% read image
img_e = imread('letter_e.png');
img_e = im2bw(img_e, 0.02);
img_e = 1-img_e;
% erode character e, because it's not completly what in the image 
img_e_eroded = imerode(img_e, ones(3,3));

figure();
imshow(img);
title('Input Image');
figure();
imshow(img_e);
title('character e');
figure();
imshow(img_e_eroded);
title('character e after erosion');

img_erode = imerode(img, img_e_eroded);
figure();
imshow(img_erode);
title('Modified Image');
imwrite(img_erode, 'p5e.png');

disp('number of e:')
disp(sum(sum(img_erode)));




