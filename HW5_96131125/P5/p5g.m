% read image
img = imread('apples.png');
img_rgb = im2double(img);
img = im2bw(img, 0.9);

% negative image
img = 1-img;

% correct logo
img_logo = img(204:462,122:371);

figure();
imshow(img);
title('Input Image');
figure();
imshow(img_logo);
title('logo template');

% erode template
img_logo = imerode(img_logo, ones(2,2));
figure();
imshow(img_logo);
title('logo template eroded');

% open orginal image by template to delete defected ones
img_open = imopen(img, img_logo);

figure();
imshow(img_open);
title('Image after opening');


defected = img - img_open;
figure();
imshow(defected);
title('defected');
imwrite(defected, 'p5g-bw.png');

img_rgb(:,:,1) = img_rgb(:,:,1) .*  defected;
img_rgb(:,:,2) = img_rgb(:,:,2) .*  defected;
img_rgb(:,:,3) = img_rgb(:,:,3) .*  defected;
figure();
imshow(img_rgb);
title('defected-rgb');
imwrite(img_rgb, 'p5g-rgb.png');


