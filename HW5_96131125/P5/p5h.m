% read image
img = imread('pills.jpg');
%imtool(img);

% make image black and white, slice intensity 120, 233
img = rgb2gray(img);
for i=1:size(img,1)
   for j=1:size(img,2)
       if img(i,j) > 120 && img(i,j) < 233
           img(i,j) = 255;
       else
           img(i,j) = 0;
       end
   end
end

img = im2bw(img, 0.5);
figure();
imshow(img);
title('Input Image');
imwrite(img,'p5h-0.png')

% erode image, for separating pills 
se = strel('disk', 22);
im_erode = imerode(img, se);
figure();
imshow(im_erode);
title('Image after erosion');
imwrite(im_erode,'p5h-1.png')

% dilate image for eliminating separations between pixels
% which blongs to one pill
se = strel('disk', 9);
im_dilate = imdilate(im_erode, se);
figure();
imshow(im_dilate);
title('Image after dilate');
imwrite(im_dilate,'p5h-2.png')

% connected component
img_org = im_dilate;
count = 0;

for i=1:size(img_org,1)
   for j=1:size(img_org,2)
       
       if img_org(i,j) == 0
           continue;
       end
       
       % sxtraction of connected component
       img = zeros(size(img_org));
       img_pre = img;
       img(i,j) = 1;
       while(isequal(img_pre, img) == 0)
           img_pre = img;
           img = imdilate(img, [0,1,0;1,1,1;0,1,0;]) & img_org;    
       end
       
       % extract connected component from image
       img_org = img_org - img;
       % count number of connected component
       count = count + 1;
       
   end 
end


disp('Connected Component:');
disp(count);

