% Read Image
img_org = imread('william_jennings_lightning.jpg');
figure();
imshow(img_org);
figure();
imhist(img_org(:,:,1));
title('Input Image');

% turn to double
img = im2double(img_org);

% a uniform strip of image 
figure();
x = 238;
y = 849;
len = 50;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p8e_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p8e_hist_strip_image.png');

% wiener2 filter
filtered_img1 = wiener2(img,[7,7]);

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8e_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1);

% median filter
filtered_img2 = ordfilt2(filtered_img1,1,ones(3,3));

% show filtered image
figure();
imshow(filtered_img2);
imwrite(filtered_img2, 'p8e_filtered_2.png');
title('image after filter 2');
figure();
imhist(filtered_img2);
