function adaptive_thresholded_image = adaptive_thresholding(img, m, threshold_ratio)
    % This function divide image to m*m overlapping blocks
    % then it applies thresholding on each 
    % m*m neighbourhood of each pixel.(it does padding).
    
    % pad image by this value
    pad_value = 127;
    
    % size of m must be odd
    if mod(m, 2)==0
       error('==> Filter size must be odd!') 
    end
        
    % Half of length of m
    neighbourhood_half_len = floor(m/2);
    
    % pad image with specific value
    % pad left and right size
    img = [ones(size(img,1), neighbourhood_half_len)*pad_value, img,ones(size(img,1), neighbourhood_half_len)*pad_value];
    % pad above and down 
    img = [ones(neighbourhood_half_len, size(img,2))*pad_value; img;ones(neighbourhood_half_len, size(img,2))*pad_value];
    
    % Create an image for result
    adaptive_thresholded_image = img;
    
    % location of input image inside padded image
    point1 = [neighbourhood_half_len+1, neighbourhood_half_len+1];
    point2 = [size(img,1)-neighbourhood_half_len, size(img,2)-neighbourhood_half_len];
    
    % divide image to overlapping m*m blocks, for each pixel i,j
    % apply thresholding on neighbourhood then update intensity
    % of point i, j with new value
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))
            
            % m*m neighbourhoof of point (i,j)
            overlap_block = img(i-neighbourhood_half_len:i+neighbourhood_half_len, j-neighbourhood_half_len:j+neighbourhood_half_len);
            
            % do thresholding on neighbourhood of point i,j
            min_neighborhood = min(min(overlap_block));
            max_neighborhood = max(max(overlap_block));
            block_threshold = uint8( floor((double(overlap_block) >= (min_neighborhood+threshold_ratio*(max_neighborhood-min_neighborhood))))* 255);
            
            % assign new intesity to pixel i,j
            adaptive_thresholded_image(i, j) = block_threshold(floor(m/2), floor(m/2));
            
        end
    end
    
    % eliminate padding
    adaptive_thresholded_image = uint8(adaptive_thresholded_image(point1(1,1):point2(1,1),point1(1,2):point2(1,2)));
            
end