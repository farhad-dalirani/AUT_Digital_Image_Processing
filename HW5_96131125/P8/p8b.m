% read image
img = imread('worldcup_balls.png');
img_rgb = im2double(img);

figure();
imshow(img);
title('Input Image');

% balls and background
img_bw = im2bw(img, 0.9999);
img_bw = 1-img_bw;
img_bw = imclose(img_bw, ones(3,3));
img_bw = imerode(img_bw, ones(2,2));
figure();
imshow(img_bw );
title('Black and White Input Image');
imwrite(img_bw, 'p8b-1.png')

% connected component
img_org = img_bw;
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
       % count number of connected component
       count = count + 1;
       
       % extract connected component from image
       img_org = img_org - img;
           
   end 
end

disp('Number of Balls:');
disp(count);
