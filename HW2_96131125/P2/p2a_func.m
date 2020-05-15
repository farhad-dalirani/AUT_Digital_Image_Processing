function censored = p2a_func(img_RGB, point1, point2, k_size)
    % This function  gets an RGB image and it censors a region that
    % specified by point1 and point2. It uses smoothing for censoring.
    % k_size is kernel size of smoothing filter, should be an odd number.
    
    img = double(img_RGB);
    
    if mod(k_size, 2) == 0
        error('Filter size should be an odd number!')
    end
    
    % Create smoothing filter, an average(Mean) filter, 3D
    % dimention is for RGB image, for vectorizing.
    filt = (1.0/(k_size^2)) * ones(k_size, k_size, 3);
    
    % Half of length of filter
    filt_half_len = floor(k_size/2);
    
    % Create an image for result of convolution
    censored = img_RGB;
    
    % Apply filter, the filter is symetric so it doesn't need rotating
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))
            
            % pair-wise multiply of filter and neighbourhood
            % of point (i,j)
            pair_mult = filt .* img(i-filt_half_len:i+filt_half_len, j-filt_half_len:j+filt_half_len,:);
            
            % sum of produncts
            sum_of_product =  sum(sum(pair_mult, 1),2);
            
            % assign new intesity after bluring to image
            censored(i, j, :) = uint8(sum_of_product);
            
        end
    end
    
end