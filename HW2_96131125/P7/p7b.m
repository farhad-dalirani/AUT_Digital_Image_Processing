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
saveas(gcf, 'p7b-azadi-hist.png')

% applying gama transformation
gamma = 0.45;
c = 255/(double(max(max(img_tow)))^gamma);
img_tow_gamma = uint8(c * (double(img_tow).^gamma));


% display enhanced image and its histogram
figure();
imshow(img_tow_gamma);
title('log enhanced image-Azadi tower');
imwrite(img_tow_gamma,'p7b-azadi-gama.png');
figure();
imhist(img_tow_gamma);
title('Histogram of gama enhanced image-Azadi tower')
saveas(gcf, 'p7b-azadi-gama-hist.png')


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
saveas(gcf, 'p7b-teh-hist.png')

% applying gama transformation
gamma = 4;
c = 255/(double(max(max(img_tow)))^gamma);
img_teh_gamma = uint8(c * (double(img_teh).^gamma));


% display enhanced image and its histogram
figure();
imshow(img_teh_gamma);
title('gamma enhanced image-tehran');
imwrite(img_teh_gamma,'p7b-teh-gamma.png');
figure();
imhist(img_teh_gamma);
title('Histogram of gamma enhanced image-tehran')
saveas(gcf, 'p7b-teh-gamma-hist.png')


