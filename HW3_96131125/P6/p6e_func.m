function [img_out, filter_fourier] = p6e_func(img_in, n, width, center)
    % Ideal Low Pass Filter
    % n: size of filter
    % width: cut-off
    % center: distance from origin
	
    img_org = img_in;
    
    % RGB to Gray-Scale
    %img = rgb2gray(img_org);
    
    %pad image with zero, append n zero at right and buttom side
    img = padarray(img_org, [n n], 0, 'post');
    img = im2double(img);

    % Calculate its Fourier Transform and shift origin to center 
    img_F = fftshift(fft2(img));    

    % Spectrom and phase angle
    %img_spectrom = abs(img_F);

    % Phase angle
    %img_phase = angle(img_F);

    % Plot Spectrom and Phase Angle
    %figure();
    %imshow(log10(img_spectrom+1))
    %title('Spectrom')
    %figure();
    %imshow(histeq(log10(img_spectrom+1)))
    %title('Spectrum')
    %figure();
    %imshow(img_phase)
    %title('Phase')
    % imwrite(histeq(log10(img_spectrom+1)), 'p5a_spectrum.png');
    % imwrite(img_phase, 'p5a_phase.png');

    % create filter - Gaussain Low-Pass Filter
    filt = zeros(size(img_F, 1), size(img_F, 2));
    for i=1:size(filt, 1)
       for j=1:size(filt, 2)
           % distance from center
           dis = sqrt((i-floor(size(img_F, 1)/2))^2+(j-floor(size(img_F, 2)/2))^2);
           
           filt(i, j) = exp(-((dis^2-center^2)/(dis*width))^2);
           
       end
    end
    
    %figure();
    %imshow(filt);
    %title(filt);
    %imwrite(filt, strcat('p5a_filter_n_', num2str(n), '_width_', num2str(width),'.png'))

    % apply filter by pairwise multiply fourier transform by filter
    img_F = img_F .* filt;

    % Inverse Fourier zero shift to left top
    % and Inverse Fourier Transform
    F_img = ifft2(ifftshift(img_F));
    F_img = abs(F_img);
    
    % filter in spatial: Inverse Fourier zero shift to left top
    % and Inverse Fourier Transform
    %F_filt = ifft2(ifftshift(filt));
    %F_filt = abs(F_filt);
    
    % Plot Reconstructed Image
    %figure()
    %imshow(F_img)
    % imwrite(F_img, 'p5a_filtered_image.png')
    %title('reconstruction of image from its Fourier Transform')
    
    img_out = F_img(1:size(img_in, 1), 1:size(img_in, 2));
    filter_fourier = filt(floor(size(F_img,1)/2)-floor(n/2):floor(size(F_img,1)/2)+floor(n/2),...
        floor(size(F_img,2)/2)-floor(n/2):floor(size(F_img,2)/2)+floor(n/2));
    
end