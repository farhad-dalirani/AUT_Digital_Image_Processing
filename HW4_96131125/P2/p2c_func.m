function noisy_img = p2c_func(img, a, b)
    % This function adds uniform noise to image.
    % img is an image with pixels value in range [0,1]
    % a, start of uniform distribution
    % b, end of uniform distribution
    
    % generate uniform noise 
    noise = unifrnd(a, b, size(img));

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