% read image
img = imread('nasir_smoking_hookah.jpg');
imtool(img);

% show image
figure();
imshow(img);
title('input');
figure();
imhist(img(:,:,1));
title('histogram of input');
saveas(gcf,'p3b_hist_input_image.png')

% a uniform strip of image
figure();
x = 121;
y = 104;
len = 20;
imshow(img(x:x+len, y:y+len,:));
title('a uniform strip of input image');
imwrite(img(x:x+len, y:y+len,:), 'p3b_strip.png');
figure();
histogram(img(x:x+len, y:y+len, 1),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p3b_hist_strip_image.png');

% apply filter
filtered_img =  ordfilt2(img,5,ones(3,3));

% show filtered image
figure();
imshow(filtered_img);
imwrite(filtered_img, 'p3b_filtered_img.png');
title('filtered image');
figure();
imhist(filtered_img(:,:,1));
title('histogram of filtered image');
saveas(gcf,'p3b_hist_filtered_image.png')


