% Read Image
img_org = imread('farewell.jpg');
figure();
imshow(img_org);
title('Input Image');

n = 260;
widths = [20, 80, 120];

for i=1:3
    
    width = widths(i);
    [img_out, filter_fourier] = p6a_func(img_org, n, width);

    % Plot filter in frequancy  domain
    figure();
    imshow(filter_fourier);
    title('Filter in Fourier (Frequency) Domain');
    imwrite(filter_fourier, ...
        strcat('p6a_filter_n_', num2str(n), '_width_', num2str(width),'.png'));

    % Plot Reconstructed Image
    figure();
    imshow(img_out);
    title(strcat('reconstruction of image from its Fourier Transform-n-',...
        num2str(n), '-width-', num2str(width)));

    imwrite(img_out, ...
        strcat('p6a_filtered_img_n_', num2str(n), '_width_', num2str(width),'.png'));

end