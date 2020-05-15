% read image of sea
sea = imread('sea.jpg');

% read image of surfur
surfer = imread('surfer.jpg');
surfer = imresize(surfer, 0.55);

% display different colors of rgb image surfer
figure();
subplot(1,4,1)
imshow(surfer(:,:,1));
subplot(1,4,2);
imshow(surfer(:,:,2));
subplot(1,4,3);
imshow(surfer(:,:,3));
subplot(1,4,4);
imshow(rgb2gray(surfer));


% make a mask by getting threshold of different colors
% of image
figure();
subplot(1,4,1)
surfer_r = im2bw(surfer(:,:,1), 0.97);
imshow(surfer_r);

subplot(1,4,2);
surfer_g = im2bw(surfer(:,:,2), 0.97);
imshow(surfer_g);

subplot(1,4,3);
surfer_b = im2bw(surfer(:,:,3), 0.97);
imshow(surfer_b);

subplot(1,4,4);
surfer_gray = im2bw(rgb2gray(surfer), 0.97);
imshow(surfer_gray);

% middle of sea image
start_row = floor(size(sea,1)/2)-floor(size(surfer,1)/2);
start_col = floor(size(sea,2)/2)-floor(size(surfer,2)/2);

% pixels which value of mask(surfer_b) are black use
% values of surfer image otherwise use value of sea
% image
new_image = sea;
for i=(start_row):(start_row+size(surfer, 1)-1)
    for j=(start_col):(start_col+size(surfer, 2)-1)
        
        % if mask in the pixel is white use sea color
        if surfer_b(i-start_row+1,j-start_col+1) == 1.0
            continue
        else
            new_image(i, j, :) = surfer(i-start_row+1,j-start_col+1, :);
        end
        
    end
end

figure();
imshow(new_image);
imwrite(new_image, 'p6.png')
