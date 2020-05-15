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
var_array = [0.001, 0.002, 0.001];
mu_array = [0, 0, 0.2];

for i=1:3
    var = var_array(i);
    mu = mu_array(i);
    
    % create noisy image
    img_noisy = p2a_func(img, mu, var);
    figure();
    imshow(img_noisy);
    title( strcat('var_',num2str(var),'_mean_',num2str(mu)));
    imwrite(img_noisy, strcat('p2a_var_',num2str(var),'_mean_',num2str(mu),'.png'))
    figure();
    histogram(img_noisy, 255, 'Normalization','probability');
    title( strcat('var_',num2str(var),'_mean_',num2str(mu)));
    saveas(gcf,strcat('p2a_hist_var_',num2str(var),'_mean_',num2str(mu),'.png'));
    
end