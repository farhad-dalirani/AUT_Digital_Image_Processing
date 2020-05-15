function mse_map = mse_template(img, img_temp)
    % m = size(img_temp, 1)
    % This function divide image to m*m overlapping blocks
    % then it calculates MSE error of each blocks and template. 
    
    m = size(img_temp, 1);
    
    if mod(m,2) == 0
        img_temp = img_temp(1:m-1, 1:m-1);
        m = m-1;
    end
    
    % Create an image for result
    mse_map = double(ones(size(img,1), size(img,2))*10000000);
    img_temp = double(img_temp);
    
    % Half of length of m
    neighbourhood_half_len = floor(m/2);
    
    % possible location of coin
    point1 = [neighbourhood_half_len+2, neighbourhood_half_len+2];
    point2 = [size(img,1)-neighbourhood_half_len-1, size(img,2)-neighbourhood_half_len-1];
    
    % divide image to overlapping m*m blocks, for each pixel i,j
    % calculate mse error on neighbourhood then update intensity
    % of point i, j with MSE
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))
            
            % m*m neighbourhoof of point (i,j)
            overlap_block = double(img(i-neighbourhood_half_len:i+neighbourhood_half_len, j-neighbourhood_half_len:j+neighbourhood_half_len));
            
            % calculate mse on neighbourhood of point i,j
            mse_block = sum(sum((overlap_block-img_temp).^2))/(m*m);
            
            % assign new intesity to pixel i,j
            mse_map(i, j) = mse_block;
            
        end
    end
    
end