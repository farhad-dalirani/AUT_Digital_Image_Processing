% read input image
img = imread('bald_trump.png');

% convert to double and range [0,1]
img = im2double(img);

% display noise free image and its histogram
figure();
imshow(img);
title('Input Image')
figure();
histogram(img, 255,'Normalization','probability');
title('Input Image');
saveas(gcf,'p2_bald_trump_hist.png')

% different settings
a_array = [0, 0, 0];
b_array = [0.03,   0.06,  0.09];

for i=1:3
    a = a_array(i);
    b = b_array(i);
    
    % create noisy image
    img_noisy = p2d_func(img, a, b);
    figure();
    imshow(img_noisy);
    title( strcat('a_',num2str(a),'_b_',num2str(b)));
    imwrite(img_noisy, strcat('p2d_a_',num2str(a),'_b_',num2str(b),'.png'))
    figure();
    histogram(img_noisy, 255, 'Normalization','probability');
    title( strcat('a_',num2str(a),'_b_',num2str(b)));
    saveas(gcf,strcat('p2d_hist_a_',num2str(a),'_b_',num2str(b),'.png'));
    
end