% read orginal image
img_org = imread('kids.jpg');
imtool(img_org);

% read filtered image
img_filtered = imread('kids_target5.jpg');
imtool(img_filtered);

% appropriate filter
my_filter = [[-1,0,0];...
             [0,0,0];...
             [0,0,1]];

% apply convolution
my_filtered_image = convo(img_org, my_filter, true, 0);

figure();
imshow(my_filtered_image);
title('image after applying filter');
imwrite(my_filtered_image, 'p4e-filtered-image.png');

isequal(img_filtered, my_filtered_image)