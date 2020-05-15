% Read Image
img_org = imread('love_x-ray.png');
figure();
imshow(img_org);
title('Input Image');

img = rgb2gray(img_org);
img = im2double(img);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img));    
 
% Spectrom and phase angle
img_spectrom = abs(img_F);
 
% Phase angle
img_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
%figure();
%imshow(log10(img_spectrom+1))
%title('Spectrom')
figure();
imshow(log10(img_spectrom/100+1))
title('Spectrum')
figure();
imshow(img_phase)
title('Phase')
imwrite(log10(img_spectrom/100+1), 'p7c_spectrum.png');
imwrite(img_phase, 'p7c_phase.png');

% create filter for all peaks- notch reject
filt = ones(size(img_F, 1), size(img_F, 2));

% where noth is needed
x_count = 0;
locs = [];
%for p = 10:124:floor(size(img_F,1)/2)+30
%    x_count = x_count+1;
%    % don't select origin of frequency domain
%	if x_count ~= 5
%        %[x_count, y_count]
%        locs = [locs; [p, 429]];
%    end
%end
locs = [74, 232; 178, 141; 281, 49; 27, 875; 128, 784; 231, 692]; 

width = 100;
for pairs = 1:size(locs,1)
    loc = [locs(pairs,1), locs(pairs,2)];
    
    for i=max(loc(1)-floor(width/2),1):min(loc(1)+floor(width/2), size(img_F,1))
        for j=max(loc(2)-floor(width/2),1):min(loc(2)+floor(width/2), size(img_F,2))
            
            % Dk(u, v) = [(u-M/2-uk)^2 + (v-N/2-vk)^2]^0.5
            dist_k = sqrt((i-loc(1))^2 + (j-loc(2))^2);
            
            value_filt = 1;
            if dist_k <= width/2
                value_filt = 0;
            end
            
            filt(i, j) = filt(i, j) * value_filt;
            filt(size(img_F,1)-i, size(img_F,2)-j) = filt(size(img_F,1)-i, size(img_F,2)-j) * value_filt;
        end
    end
end


figure();
imshow(filt);
title(filt);
imwrite(filt, 'p7c_filter.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* filt;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img);

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p7c_filtered_image.png')
title('reconstruction of image from its Fourier Transform')