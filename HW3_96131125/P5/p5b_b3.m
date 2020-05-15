% Read Image
img_org = imread('checker_shadow_illusion.png');
img_size = size(img_org);

%img_org = padarray(img_org,[60,60],0,'both');
figure();
imshow(img_org);
title('Input Image');
img = im2double(img_org);

% Calculate its Fourier Transform and shift origin to center 
img_F_org = fftshift(fft2(img));

% Spectrom and phase angle
img_spectrom = abs(img_F_org);
imwrite(log10(img_spectrom+1), 'p5b_b3_spectrum_of_input.png')
figure();
imshow(log10(img_spectrom+1));
title('Spectrum of input image');

% Phase angle
img_phase = angle(img_F_org);
%imwrite(img_phase, 'p5b_b1_phase_of_input.png')

scales = [0.5, 2];
for i=1:2
    % update spectrum: rotate
    img_F = imresize(img_F_org, scales(i));

    % crop padded region
    %img_spectrom = img_spectrom(20:end, :,:);
    %img_phase = img_phase(20:end, :, :);

    % Spectrom after altering
    img_spectrom = abs(img_F);
    imwrite(log10(img_spectrom+1), ...
        strcat('p5b_b3_spectrum_after_change-scale', num2str(scales(i)),'.png'))

    figure();
    imshow(log10(img_spectrom+1));
    title(strcat('Spectrum after applying change-scale-',num2str(scales(i))));

    % Inverse Fourier zero shift to left top
    % and Inverse Fourier Transform
    F_img = abs(ifft2(ifftshift(img_F)));

    figure()
    imshow(F_img)
    title(strcat('Reconstructed Image degree:', num2str(scales(i))))
    imwrite(F_img, ...
        strcat('p5b_b3_reconstructed_image-degree-', num2str(scales(i)),'.png'));
    
end