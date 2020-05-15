function filtered_imgage = overlapping_hist_eq(img, m)
    % This function divide image to m*m overlapping blocks
    % then it applies histogram equalization on each 
    % m*m neighbourhood of each pixel, it does padding.
    
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
    filtered_imgage = img;
    
    % location of input image inside padded image
    point1 = [neighbourhood_half_len+1, neighbourhood_half_len+1];
    point2 = [size(img,1)-neighbourhood_half_len, size(img,2)-neighbourhood_half_len];
    
    % divide image to overlapping m*m blocks, for each pixel i,j
    % apply histogram equalization on neighbourhood then update intensity
    % of point i, j with new value
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))
            
            % m*m neighbourhoof of point (i,j)
            overlap_block = img(i-neighbourhood_half_len:i+neighbourhood_half_len, j-neighbourhood_half_len:j+neighbourhood_half_len);
            
            % do histogram equalization on neighbourhood of point i,j
            hist_eq_overlap_block = histeq_mine(overlap_block);
            
            % assign new intesity to pixel i,j
            filtered_imgage(i, j) = hist_eq_overlap_block(floor(m/2), floor(m/2));
            
        end
    end
    
    % eliminate padding
    filtered_imgage = uint8(filtered_imgage(point1(1,1):point2(1,1),point1(1,2):point2(1,2)));
            
end