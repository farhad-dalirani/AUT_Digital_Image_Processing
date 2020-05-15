% read image
img = imread('squares_and_circles.png');

figure();
imshow(img);
title('Input Image');

% convert to binary image, yellow is zero, others are ones
% yellow mask ([255, 242, 0])
yellow_mask = ones(size(img,1),size(img,2));
for i=1:size(img,1)
   for j=1:size(img,2)
      if img(i,j,1) == 255 && img(i,j,2) == 242 && img(i,j,3) == 0
         yellow_mask(i,j,1) = 0; img(i,j,2) = 0; img(i,j,3) = 0;
      end
   end
end
bin_img = yellow_mask;

figure();
imshow(yellow_mask);
title('Binary Image');

% structuring element
st = strel('arbitrary', ones(3,3));

% boundary detection
boundary = bin_img - imerode(bin_img, st);

figure();
imshow(boundary);
title('Boundary');

% number of white pixels
boundary_pixels = sum(sum(boundary));
disp('Number of bouncary pixels:')
disp(boundary_pixels)

imwrite(bin_img, 'p5a-bw.png');
imwrite(boundary, 'p5a.png');



