% Read Image
img_org = imread('berkowski_solar_eclipse.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

% turn to double
img = im2double(img_org);

% a uniform strip of image 
figure();
x = 21;
y = 225;
len = 50;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p8g_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p8g_hist_strip_image.png');

% wiener2 filter
filtered_img1 = wiener2(img,[7,7]);

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8g_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1);
