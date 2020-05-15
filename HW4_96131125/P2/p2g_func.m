function img_out = p2g_func(img_in, k)
    % add turbulence effect to image
    % k: power of turbulence

    img_org = img_in;
    
    % RGB to Gray-Scale
    %img = rgb2gray(img_org);
    
    %pad image with zero, append n zero at right and buttom side
    %img = padarray(img_org, [n n], 0, 'post');
    img = img_org;
    img = im2double(img);

    % Calculate its Fourier Transform and shift origin to center 
    img_F = fftshift(fft2(img));    

    % create fourier of turbulence 
    h = zeros(size(img_F, 1), size(img_F, 2));
    for i=1:size(h, 1)
       for j=1:size(h, 2)
           % turbulance function
           h(i, j) = exp((-k)*(((i-floor(size(img_F,1)/2))^2+...
               (j-floor(size(img_F,2)/2))^2)^(5/6))); 
       end
    end
    h_rgb = zeros(size(img_F, 1), size(img_F, 2), 3);
    h_rgb(:,:,1)=h;
    h_rgb(:,:,2)=h; 
    h_rgb(:,:,3) = h;
    h = h_rgb;
 
    % apply degredation by pairwise multiply fourier transform by
    % degradation
    img_F = img_F .* h;

    % Inverse Fourier zero shift to left top
    % and Inverse Fourier Transform
    F_img = ifft2(ifftshift(img_F));
    F_img = abs(F_img);
    
    img_out = F_img;
      
end