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
imwrite(img_bw, 'p8a-1.png')

% connected component
img_org = img_bw;
count = 0;

% number of pixels in each connected component
pixels_cc = [];
% each connected component
cc = zeros(size(img_bw,1),size(img_bw,2), 100);

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
       
       % number of pixel in connected component
       pixels_cc = [pixels_cc, sum(sum(img))];
       % connected component for later use
       cc(:,:,count) = img;
       
       % extract connected component from image
       img_org = img_org - img;
       
       
   end 
end


% find bigest ball(highest number of pixel) and smallest ball(lowest number of pixel)
min_pixels = min(pixels_cc);
max_pixels = max(pixels_cc);

bigest_balls = zeros(size(img_bw,1),size(img_bw,2));
smallest_balls = zeros(size(img_bw,1),size(img_bw,2));
for i = 1:size(pixels_cc,2)
    if pixels_cc(i) == max_pixels
       bigest_balls = bigest_balls | cc(:,:,i);  
    end
    
    if pixels_cc(i) == min_pixels
       smallest_balls = smallest_balls | cc(:,:,i);  
    end
end

% show smallest and biggest balls
figure();
biggest = img_rgb .* repmat(bigest_balls,[1,1,3]);
imshow(biggest);
title('biggest balls');
imwrite(biggest, 'p8a-2.png')

figure();
smallest = img_rgb .* repmat(smallest_balls,[1,1,3]);
imshow(smallest);
title('smallest balls');
imwrite(smallest, 'p8a-3.png')


