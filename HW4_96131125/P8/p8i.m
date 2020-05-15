% Read Image
img_org = imread('self_portrait_as_a_drowned_man.jpg');
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
imwrite(img(x:x+len, y:y+len,:), 'p8i_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p8i_hist_strip_image.png');

% median filter
filtered_img1 = ordfilt2(img, 4, ones(3,3));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8i_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1);

% wiener2 filter
filtered_img2 = wiener2(filtered_img1,[3,3]);

% show filtered image
figure();
imshow(filtered_img2);
imwrite(filtered_img2, 'p8i_filtered_2.png');
title('image after filter 2');
figure();
imhist(filtered_img2);

