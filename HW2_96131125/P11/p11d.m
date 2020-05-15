%read img
img = imread('mario_bonus.jpg');

% display image
figure();
imshow(img);
title('input image');

% raed template
img_temp = imread('mario_coin.jpg');

% display image
figure();
imshow(img_temp);
title('template coin');

% call mse template matching function
mse_map = mse_template_3(img, img_temp);

% find minimum MSE
temp_half_len = floor((size(img_temp,1)-1)/2);
min_mse = 1000000000;
for i=temp_half_len+2:size(img,1)-temp_half_len-1
    for j= temp_half_len+2:size(img,2)-temp_half_len-1
        if mse_map(i,j) < min_mse
            min_mse = mse_map(i,j);
        end
    end
end

% number of coins. minimum mse and close values to it 
% determine coins
num_coins = sum(sum(mse_map<=min_mse+0.01*min_mse));
fprintf('Number of coins: %i\n', num_coins)

% hilight coins
coin_pos = mse_map<=min_mse+0.01*min_mse;
img_hilight = uint8(zeros(size(img,1),size(img,2)));
for i=1:size(img_hilight,1)
    for j = 1:size(img_hilight,2)
        if coin_pos(i,j) == 1
            img_hilight(i-size(img_temp,1):i+size(img_temp,1),...
                j-size(img_temp,2)+10:j+size(img_temp,2)-10) = 255;
        end
    end
end
figure();
imshow(img_hilight);
title('Position of coins');
imwrite(img_hilight, 'p11d-position-coins.png');

% display mse of each pixel as an image
figure();
point1 = [temp_half_len+2, temp_half_len+2];
point2 = [size(img,1)-temp_half_len-1, size(img,2)-temp_half_len-1];
mse_map = mse_map(point1(1,1):point2(1,1), point1(1,2):point2(1,2));
imshow(mat2gray(mse_map));
imwrite(mat2gray(mse_map), 'p11d-mse-map.png');
