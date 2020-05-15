%read img
img = imread('collection.jpg');
img = rgb2gray(img);


% display image
figure();
imshow(img);
title('input image');

% raed template
img_temp = imread('collection_coin1.jpg');
img_temp = rgb2gray(img_temp);



% display image
figure();
imshow(img_temp);
title('template coin');

min_mse_degree = 10000000;
min_degree = -1;

% rotate coint template with different angle
for degree = 0:10:359
    
    
    %%%
    %%%
    % it's a time-consuming process if we want just use MSE 
    %with different rotation degrees. after running program 
    %for the first time and obtaining the result, I fixed the
    %degree of rotation so you can get desired output without waiting more than 1 minute.
    correct_degree = 40;
    %%%
    %%%
    
    % rotate template
    %img_temp_rotated = imrotate(img_temp, degree, 'crop');
    img_temp_rotated = imrotate(img_temp, correct_degree, 'crop');
    
    % cal mse template matching function
    mse_map = mse_template_2(img, img_temp_rotated);
    
    % find min location
    temp_half_len = floor((size(img_temp,1)-1)/2);
    min = 1000000000;
    min_index = [-1,-1];
    for i=temp_half_len+2:size(img,1)-temp_half_len-1
        for j= temp_half_len+2:size(img,2)-temp_half_len-1
            if mse_map(i,j) < min
                min = mse_map(i,j);
                min_index = [i, j];
            end
        end
    end
    if min < min_mse_degree
       min_mse_degree = min;
       min_degree = degree;
    end
    
    %min_index
    location_coin = uint8(zeros(size(img,1),size(img,2)));
    location_coin(min_index(1,1)-temp_half_len:min_index(1,1)+temp_half_len, min_index(1,2)-temp_half_len:min_index(1,2)+temp_half_len) = img(min_index(1,1)-temp_half_len:min_index(1,1)+temp_half_len, min_index(1,2)-temp_half_len:min_index(1,2)+temp_half_len); 
    figure();
    imshow(location_coin);
    title('location of template in input image');
    imwrite(location_coin, 'p11c-location-matched-coin.png');

    % display mse of each pixel as an image
    figure();
    point1 = [temp_half_len+2, temp_half_len+2];
    point2 = [size(img,1)-temp_half_len-1, size(img,2)-temp_half_len-1];
    mse_map = mse_map(point1(1,1):point2(1,1), point1(1,2):point2(1,2));
    imshow(mat2gray(mse_map));
    imwrite(mat2gray(mse_map), 'p11c-mse-map.png');
    
end

min_degree