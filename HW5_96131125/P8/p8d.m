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
imwrite(img_bw, 'p8d-1.png')

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


% group same size images togheter
group_by_size = unique(pixels_cc);

% each ball in which group
balls_in_group = zeros(size(group_by_size,2), 50);
number_of_balls_in_group = zeros(1, size(group_by_size,2));

for i = 1:size(pixels_cc,2)
   for j= 1:size(group_by_size,2)
      
       % if ball belongs to group j
       if  group_by_size(1,j) == pixels_cc(1,i)
           k = 1;
           while(balls_in_group(j,k) ~= 0)
              k = k + 1;
           end
           balls_in_group(j,k) = i;
           number_of_balls_in_group(1,j) = number_of_balls_in_group(1,j) + 1; 
           
       end
   end
end

balls_grouped = zeros(size(img_rgb, 1), size(img_rgb, 2), size(pixels_cc,2));

% put balls with same size in one image
for i = 1:size(balls_in_group,1)
   for j = 1:size(balls_in_group,2)
        if balls_in_group(i,j) == 0
           break; 
        end
        
        balls_grouped(:,:,i) = balls_grouped(:,:,i) | cc(:,:,balls_in_group(i,j)); 
   end 
    
end

group_brand =  [1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1];
group_europe = [0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1];
for i = 1:size(balls_in_group,1)
   figure();
   imshow(img_rgb .* repmat(balls_grouped(:,:,i),[1,1,3]));
   title(strcat('Group ', num2str(i),'Number of balls:', num2str(number_of_balls_in_group(1,i))));
   %imwrite(img_rgb .* repmat(balls_grouped(:,:,i),[1,1,3]), ...
   %    strcat('p8d-Group-', num2str(i),'Number of balls ', num2str(number_of_balls_in_group(1,i)),'.png'))
end

count_brand = 0;
not_addidas_brand = zeros(size(img_rgb, 1), size(img_rgb, 2));
for i=1:size(balls_in_group,1)
   if group_brand(1,i) ~= 1
      % add number of balls in different groups
      count_brand = count_brand + number_of_balls_in_group(1,i);  
      % concat mask of each group
      not_addidas_brand = not_addidas_brand | balls_grouped(:,:,i);
   end
end

figure();
   imshow(img_rgb .* repmat(not_addidas_brand,[1,1,3]));
title(strcat('Not Addidas Brand-','Number of balls:', num2str(count_brand)));
imwrite(img_rgb .* repmat(not_addidas_brand,[1,1,3]), ...
       strcat('p8d-Not-Addidas Brand-','Number of balls ', num2str(count_brand),'.png'))

disp('Number of balls of each type');
disp(number_of_balls_in_group)
disp('Number of ball which do not belong to Adidas')
disp(count_brand)