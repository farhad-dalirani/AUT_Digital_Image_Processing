% read image
img = imread('le_gras.jpg');
imtool(img);

% show image
figure();
imshow(img);
title('input');
figure();
imhist(img(:,:,1));
title('histogram of input');
saveas(gcf,'p8a_hist_input_image.png')

% a uniform strip of image
figure();
x = 215;
y = 1121;
len = 50;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p8a_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p8a_hist_strip_image.png');

% median filter
filtered_img1 = ordfilt2(img,115,ones(15,15));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8a_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1(:,:,1));


% hist equalization
filtered_img2 = histeq(filtered_img1);

% show filtered image
figure();
imshow(filtered_img2);
imwrite(filtered_img2, 'p8a_filtered_2.png');
title('image after filter 2');
figure();
imhist(filtered_img2(:,:,1));


% wiener equalization
filtered_img3 = wiener2(filtered_img2,[7,7]);

% show filtered image
figure();
imshow(filtered_img3);
imwrite(filtered_img3, 'p8a_filtered_3.png');
title('image after filter 3');
figure();
imhist(filtered_img3(:,:,1));

