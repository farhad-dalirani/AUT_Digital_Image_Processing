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
saveas(gcf, 'p10a-scanned1-hist.png');

% thresholding
threshold = 90;
img_1_threshold = uint8( (double(img_1) >= threshold)* 255);

% display image and histogram
figure();
imshow(img_1_threshold);
title('scanned1 thresholded');
imwrite(img_1_threshold,'p10-scanned1-thresholded.png');
%figure();
%imhist(img_1_threshold);
%title('histogram-scanned1 thresholded image');
%saveas(gcf, 'p10a-scanned1-thresholded-hist.png');


% read image scanned1.jpg
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
saveas(gcf, 'p10a-scanned2-hist.png');

% thresholding
threshold = 100;
img_2_threshold = uint8( (double(img_2) >= threshold)* 255);

% display image and histogram
figure();
imshow(img_2_threshold);
title('scanned1 thresholded');
imwrite(img_2_threshold,'p10-scanned2-thresholded.png');
%figure();
%imhist(img_2_threshold);
%title('histogram-scanned2 thresholded image');
%saveas(gcf, 'p10a-scanned2-thresholded-hist.png');