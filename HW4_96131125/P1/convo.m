function filtered_imgage = convo(img, filt, rot, pad_value)
    % This function gets an gray-scale image and a filter, then
    % it does convolution on input image.
    % if 'rot' be false, it means the filter is symmetric and rotation
    % isn't necessary.
    % it pads input image with gray level value 'pad_value'
    
    img = double(img);
    
    % size of filter must be odd
    if mod(size(filt,1),2)==0
       error('==> Filter size must be odd!') 
    end
    
    % if filter isn't symmetric,do rotation.
    if rot == true
       filt = imrotate(filt, 180); 
    end
        
    % Half of length of filter
    filt_half_len = floor(size(filt, 1)/2);
    
    % pad image with specific value
    % pad left and right size
    img = [ones(size(img,1), filt_half_len)*pad_value, img,ones(size(img,1), filt_half_len)*pad_value];
    % pad above and down 
    img = [ones(filt_half_len, size(img,2))*pad_value; img;ones(filt_half_len, size(img,2))*pad_value];
    
    % Create an image for result of convolution
    filtered_imgage = img;
    
    % location of input image inside padded image
    point1 = [filt_half_len+1, filt_half_len+1];
    point2 = [size(img,1)-filt_half_len, size(img,2)-filt_half_len];
    
    % Apply filter, 
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))
            
            % pair-wise multiply of filter and neighbourhood
            % of point (i,j)
            pair_mult = filt .* img(i-filt_half_len:i+filt_half_len, j-filt_half_len:j+filt_half_len);
            
            % sum of produncts
            sum_of_product =  sum(sum(pair_mult, 1),2);
            
            % assign new intesity to pixel i,j
            filtered_imgage(i, j) = uint8(sum_of_product);
            
        end
    end
    
    % eliminate padding
    filtered_imgage = uint8(filtered_imgage(point1(1,1):point2(1,1),point1(1,2):point2(1,2)));
            
end