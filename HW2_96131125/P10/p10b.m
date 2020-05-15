% read image scanned1.jpg
img_1 = imread('scanned1.jpg');
img_1 = rgb2gray(img_1);
imtool(img_1)

% display image and histogram
figure();
imshow(img_1);
title('scanned1');
figure();
imhist(img_1);
title('histogram-scanned1 image');
saveas(gcf, 'p10b-scanned1-hist.png');

% thresholding
threshold_ratio = 0.20;
m = 51;
img_1__adap_threshold = adaptive_thresholding_non_overlapping(img_1, m, threshold_ratio);

% display image and histogram
figure();
imshow(img_1__adap_threshold);
title('scanned1 thresholded');
imwrite(img_1__adap_threshold,'p10b-scanned1-adaptive-thresholded.png');




% read image scanned2.jpg
img_2 = imread('scanned2.jpg');
img_2 = rgb2gray(img_2);
imtool(img_2)

% display image and histogram
figure();
imshow(img_2);
title('scanned2');
figure();
imhist(img_2);
title('histogram-scanned2 image');
saveas(gcf, 'p10b-scanned2-hist.png');

% thresholding
threshold_ratio = 0.30;
m = 171;

img_2__adap_threshold = adaptive_thresholding_non_overlapping(img_2, m, threshold_ratio);

% display image and histogram
figure();
imshow(img_2__adap_threshold);
title('scanned2 adaptive thresholded');
imwrite(img_2__adap_threshold,'p10b-scanned2-adaptive-thresholded.png');
