% read noise free image 
img_target = imread('tiny_trump.jpg');

% SNR of images average
snr_averages = zeros(1,20);

% calculate averages
for i=1:20
    % read image i th
    img_i =  imread(strcat('tiny_trump-',num2str(i),'.jpg'));
    
    % sum of images
    if i == 1
         sum = double(img_i);
    else
         sum = sum + double(img_i);
    end
     
    % calculate average of i th images
    average = uint8(sum/i);
    
    % calculate snr
    snr_averages(1,i) = p9_snr(average, img_target);
end

disp(snr_averages)
figure();
plot(1:20, snr_averages,'bo-');
title('SNR for average of first i images. (1<=i<=20)');
saveas(gcf, 'p9b-snr-plot.png')
