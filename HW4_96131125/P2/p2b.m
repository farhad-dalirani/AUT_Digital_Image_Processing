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
pa_array = [0.1, 0.4, 0.1];
pb_array = [0.1, 0.1, 0.4];

for i=1:3
    pa = pa_array(i);
    pb = pb_array(i);
    
    % create noisy image
    img_noisy = p2b_func(img, pa, pb);
    figure();
    imshow(img_noisy);
    title( strcat('pa_',num2str(pa),'_pb_',num2str(pb)));
    imwrite(img_noisy, strcat('p2b_pa_',num2str(pa),'_pb_',num2str(pb),'.png'))
    figure();
    histogram(img_noisy, 255, 'Normalization','probability');
    title( strcat('pb_',num2str(pa),'_pb_',num2str(pb)));
    saveas(gcf,strcat('p2b_hist_pa_',num2str(pa),'_pb_',num2str(pb),'.png'));
    
end