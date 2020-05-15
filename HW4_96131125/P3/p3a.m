% read image
img = imread('nasir_and_wives.jpg');
imtool(img);

% show image
figure();
imshow(img);
title('input');
figure();
imhist(img(:,:,1));
title('histogram of input');
saveas(gcf,'p3a_hist_input_image.png')

% a uniform strip of image
figure();
x = 373;
y = 205;
len = 50;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p3a_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p3a_hist_strip_image.png');

% apply filter
filtered_img = imgaussfilt(img, 1.1);

% show filtered image
figure();
imshow(filtered_img);
imwrite(filtered_img, 'p3a_filtered_img.png');
title('filtered image');
figure();
imhist(filtered_img(:,:,1));
title('histogram of filtered image');
saveas(gcf,'p3a_hist_filtered_image.png')


