% Read Image
img_org = imread('old_friends.jpg');
figure();
imshow(img_org);
title('Input Image');

n = 300;
center = 100;
widths = [20, 80, 120];

for i=1:3
    
    width = widths(i);
    [img_out, filter_fourier] = p6e_func(img_org, n, width, center);

    % Plot filter in frequancy  domain
    figure();
    imshow(filter_fourier);
    title('Filter in Fourier (Frequency) Domain');
    imwrite(filter_fourier, ...
        strcat('p6e_filter_n_', num2str(n), '_width_', num2str(width),'.png'));

    % Plot Reconstructed Image
    figure();
    imshow(img_out);
    title(strcat('reconstruction of image from its Fourier Transform-n-',...
        num2str(n), '-width-', num2str(width)));

    imwrite(img_out, ...
        strcat('p6e_filtered_img_n_', num2str(n), '_width_', num2str(width),'.png'));

end