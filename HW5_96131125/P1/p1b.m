clc; clear;

% read image
img = imread('trump_un.bmp');

% show image
imshow(img);
title('Input image');

% convert to double
img = im2double(img);

%output, add a col to image, so it can be divide by 4
comp_img = zeros(size(img,1), size(img,2)+1, size(img,3));

% for different channel
for channel = 1:3
    I = img(:, :, channel);
    % add a col to image, so it can be divide by 4
    I = [I, zeros(size(I,1), 1)];

    % divide image to 4*4 blocks and calculate DCT terms for each
    T = dctmtx(4);
    dct = @(block_struct) T * block_struct.data * T';
    B = blockproc(I,[4 4],dct);

    % ignore 75% of dct terms
    mask = [1   1   0   0
            1   0   0   0
            1   0   0   0
            0   0   0   0];

    B2 = blockproc(B,[4 4],@(block_struct) mask .* block_struct.data);  

    % reconstruct image
    invdct = @(block_struct) T' * block_struct.data * T;
    I2 = blockproc(B2,[4 4],invdct);
    
    comp_img(:,:,channel) = I2; 
   
end

% delete extra column that was added
comp_img = comp_img(:,1:size(comp_img,2)-1,:);
% show image
figure();
imshow(comp_img);
title('Reconstructed Image');
imwrite(comp_img, 'p1b.png')
disp('PSNR:'); disp(psnr(comp_img, img))
