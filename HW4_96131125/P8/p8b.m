% Read Image
img_org = imread('still_life_in_studio.jpg');
figure();
imshow(img_org);
title('Input Image');

%img = rgb2gray(img_org);
img = im2double(img_org);

% min filter
filtered_img1 =  ordfilt2(img,1,ones(3,3));

% show filtered image
figure();
imshow(filtered_img1);
imwrite(filtered_img1, 'p8b_filtered_1.png');
title('image after filter 1');
figure();
imhist(filtered_img1(:,:,1));

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(filtered_img1));    
 
% Spectrom and phase angle
img_spectrom = abs(img_F);
 
% Phase angle
img_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
figure();
imshow(log10(img_spectrom/300+1))
title('Spectrum')
imwrite(log10(img_spectrom/300+1), 'p8b_spectrum.png');

% create filter for all peaks- notch reject
filt = ones(size(img_F, 1), size(img_F, 2));

% location of impusle peak
u0 = -306;
v0 = -414;
% radius of Notch
D0 = 25;
for i=1:size(filt,1)
    for j=1:size(filt,2)
        % distance from two impulses 
        D1 = sqrt((i-floor(size(filt,1)/2)-u0)^2 + (j-floor(size(filt,2)/2)-v0)^2);
        D2 = sqrt((i-floor(size(filt,1)/2)+u0)^2 + (j-floor(size(filt,2)/2)+v0)^2);
        
        if D1 <= D0 || D2 <= D0
            filt(i, j) = 0;
        else
            filt(i, j) = 1;
        end
    end
end

% location of impusle peak
u0 = 300;
v0 = -418;
% radius of Notch
D0 = 25;
for i=1:size(filt,1)
    for j=1:size(filt,2)
        % distance from two impulses 
        D1 = sqrt((i-floor(size(filt,1)/2)-u0)^2 + (j-floor(size(filt,2)/2)-v0)^2);
        D2 = sqrt((i-floor(size(filt,1)/2)+u0)^2 + (j-floor(size(filt,2)/2)+v0)^2);
        
        if D1 <= D0 || D2 <= D0
            filt(i, j) = 0;
        end
    end
end


% create filter - horizontal and vertical notch band reject
width = 10;
center_margin = 45;
for i=1:size(filt, 1)
   for j=1:size(filt, 2)
       if (i >= size(filt, 1)/2 - width) && (i <= size(filt, 1)/2 + width)
           if (j < size(filt, 2)/2 - center_margin) || (j > size(filt, 2)/2 + center_margin)
               filt(i, j) = 0;
           end
       end
       if (j >= size(filt, 2)/2 - width) && (j <= size(filt, 2)/2 + width)
           if (i < size(filt, 1)/2 - center_margin) || (i > size(filt, 1)/2 + center_margin)
               filt(i, j) = 0;
           end
       end
   end
end

figure();
imshow(filt);
title(filt);
imwrite(filt, 'p8b__fourier_filter.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* filt;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img);

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p8b_filtered_2.png')
title('image after filter 2')
