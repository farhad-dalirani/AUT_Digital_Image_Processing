% azadi tower
% read azadi tower image
img_tow = imread('azadi_tower.jpg');
img_tow = rgb2gray(img_tow);

% display and store image and its histogram
figure();
imshow(img_tow);
title('Input image-Azadi tower'); 
figure();
imhist(img_tow);
title('Histogram of input image-Azadi tower')
saveas(gcf, 'p7a-azadi-hist.png')

% applying logarithm transformation
c = 255/log10(1+double(max(max(img_tow))));
img_tow_log = uint8(c * log10(1+double(img_tow)));


% display enhanced image and its histogram
figure();
imshow(img_tow_log);
title('log enhanced image-Azadi tower');
imwrite(img_tow_log,'p7a-azadi-log.png');
figure();
imhist(img_tow_log);
title('Histogram of log enhanced image-Azadi tower')
saveas(gcf, 'p7a-azadi-log-hist.png')


% tehran
% read tehran image
img_teh = imread('tehran.jpg');
img_teh = rgb2gray(img_teh);

% display and store image and its histogram
figure();
imshow(img_teh);
title('Input image-Tehran'); 
figure();
imhist(img_teh);
title('Histogram of input image-tehran')
saveas(gcf, 'p7a-teh-hist.png')

% applying logarithm transformation
c = 255/log10(1+double(max(max(img_teh))));
img_teh_log = uint8(c * log10(1+double(img_teh)));


% display enhanced image and its histogram
figure();
imshow(img_teh_log);
title('log enhanced image-tehran');
imwrite(img_teh_log,'p7a-teh-log.png');
figure();
imhist(img_teh_log);
title('Histogram of log enhanced image-tehran')
saveas(gcf, 'p7a-teh-log-hist.png')



% tehran
% read tehran image
img_teh = imread('tehran.jpg');
img_teh = rgb2gray(img_teh);

% applying inverse-logarithm transformation
%c = 255/log10(1+double(max(max(img_teh))));
c = double(max(max(img_teh)))/log10(256);
img_teh_log_inv = uint8(10.^(double(img_teh)/c)-1);

% display enhanced image and its histogram
figure();
imshow(img_teh_log_inv);
title('log inverse enhanced image-tehran');
imwrite(img_teh_log_inv,'p7a-teh-log-inv.png');
figure();
imhist(img_teh_log_inv);
title('Histogram of log inverse enhanced image-tehran')
saveas(gcf, 'p7a-teh-log-inv-hist.png')