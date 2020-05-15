% read img
img = imread('vintage_mario.jpg');
imshow(img)

blur_size = 31;
% create a blur filter-gaussian
blur = ones([blur_size,blur_size,3]);
blur_len = floor(size(blur,1)/2);

sum = 0;
for i = 1:size(blur,1)
    for j = 1:size(blur,2)
        blur(i, j, 1) = (1/2*pi*169)*exp(((i-blur_len-1)^2+(j-blur_len-1)^2)/(-2*169));
        sum = sum + blur(i, j, 1);
    end
end
blur(:,:,1) = blur(:,:,1) / sum;
blur(:,:,2) = blur(:,:,1);
blur(:,:,3) = blur(:,:,1);



% create a  image with equal size to input image
img_b = ones(size(img)) * 255;

% start and end point of where that filter should apply
x = [1+blur_len, size(img,1)-blur_len];
y = [1+blur_len, size(img,2)-blur_len];

% apply filter
for i = x(1,1):x(1,2)
    for j = y(1,1):y(1,2)
        
        % region of image that we want apply filter
        region = double(img(i-blur_len:i+blur_len, j-blur_len:j+blur_len, :));
        
        % convolution
        % conv_img = zeros(size(region));
        conv_img = region .* blur;
        
        % sum of convolution area
        sum_conv_img = [0.0, 0.0, 0.0];
        for p=1:size(conv_img, 1)  
            for q=1:size(conv_img, 2)
            	value = conv_img(p,q,:);
            	value = transpose(value(:));
            	sum_conv_img = sum_conv_img + double(value);
            end
        end
        
        img_b(i, j, :) = floor(sum_conv_img);
        
    end 
end

% size of filter is large, it takes 2 MINs
img_b = uint8(img_b);
imshow(img_b)
imwrite(img_b, 'gaussian_31_31_div_13_blur.png')

