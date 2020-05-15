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
a_array = [0.01, 0.05, 0.1];

for i=1:3
    a = a_array(i);
    
    % create noisy image
    img_noisy = p2f_func(img, a);
    figure();
    imshow(img_noisy);
    title( strcat('a_',num2str(a)));
    imwrite(img_noisy, strcat('p2f_a_',num2str(a),'.png'))
    figure();
    histogram(img_noisy, 255, 'Normalization','probability');
    title( strcat('a_',num2str(a)));
    saveas(gcf,strcat('p2f_hist_a_',num2str(a),'.png'));
    
end
