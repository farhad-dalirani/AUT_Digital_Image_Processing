function noisy_img = p2d_func(img, a, b)
    % This function adds reyleigh noise to image.
    % img is an image with pixels value in range [0,1]
    % a, 
    % b, 
    
    % generate uniform noise 
    noise = a + raylrnd(b, size(img));

    % add noise to image
    noisy_img = img + noise;
    
    % crop values higher than 1 and lower than 0
    for i=1:size(noisy_img,1)
        for j=1:size(noisy_img,2)
            
            if noisy_img(i, j) > 1
                noisy_img(i, j) = 1;
            else
                if noisy_img(i, j) < 0
                    noisy_img(i, j) = 0;
                end
            end
        end
    end
    
end