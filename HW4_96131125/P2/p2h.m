% read input image
img = imread('trump_hair.jpg');

% display input image
figure();
imshow(img);
title('Input Image')

% different settings of turbulence 
a_array = [0.08, 0, 0.08];
b_array = [0, 0.08, 0.08];

for i=1:3
    a = a_array(i);
    b = b_array(i);
    
    % create turbulence effect in image
    img_degraded = p2h_func(img, a, b, 1.0);
    figure();
    imshow(img_degraded);
    title( strcat('a_',num2str(a),'_b_', num2str(b)));
    imwrite(img_degraded, strcat('p2h_a_',num2str(a),'_b_', num2str(b),'.png'))
 
end
