% read image
img = imread('trump_g7.jpg');

% show image
imshow(img);
title('RGB');

% matrix that convert ycbcr to rgb
ycbcr_to_rgb_convertor = [1.0, 0.0, 1.403; 1.0, -0.344, -0.714; 1.0, 1.773, 0.0];
% matrix that convert rgb to ycbcr
rgb_to_ycbcr_convertor = inv(ycbcr_to_rgb_convertor);

% covert every rgb pixel to YCbCr
img_ycbcr = img;
for i=1:size(img,1)
    for j=1:size(img,2)
       
       point_rgb = [double(img(i, j, 1)); double(img(i, j, 2)); double(img(i, j, 3))];
       point_ycbcr = rgb_to_ycbcr_convertor * point_rgb;
       point_ycbcr = [point_ycbcr(1,1), point_ycbcr(2,1)+128, point_ycbcr(3,1)+128];
       img_ycbcr(i, j, :) = point_ycbcr; 
       
    end
end


% show image
figure();
imshow(img_ycbcr);
title('YCrCy');
imwrite(img_ycbcr, 'p1a.png');
