% read input image
img = imread('trump_tower.jpg');

% display input image
figure();
imshow(img);
title('Input Image')

% different settings of turbulence [Severe, Mild, Low]
k_array = [0.0025, 0.001, 0.00025];

for i=1:3
    k = k_array(i);
    
    % create turbulence effect in image
    img_degraded = p2g_func(img, k);
    figure();
    imshow(img_degraded);
    title( strcat('k_',num2str(k)));
    imwrite(img_degraded, strcat('p2g_k_',num2str(k),'.png'))
    
end
