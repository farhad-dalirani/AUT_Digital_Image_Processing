% Read Image
img_org = imread('tartan_ribbon.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

% turn to double
img = im2double(img_org);

% a uniform strip of image 
figure();
x = 720;
y = 19;
len = 50;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p8j_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p8j_hist_strip_image.png');

% wiener2 filter
filtered_img1 = img;
filtered_img1(:,:,1) = wiener2(img(:,:,1),[7,7]);
filtered_img1(:,:,2) = wiener2(img(:,:,2),[7,7]);
filtered_img1(:,:,3) = wiener2(img(:,:,3),[7,7]);

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8j_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1(:,:,1));


