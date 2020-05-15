function adaptive_he_img = non_overlapping_block_hist_eq(img, m)
    % This function divide image to m*m non-overlapping blocks
    % then it applies histogram equalization on each one.
    
    % initial image
    adaptive_he_img = img;
    
    % number of block in x axis and y axis 
    num_row_block = ceil(size(img,1)/m);
    num_col_block = ceil(size(img,2)/m);
    
    % divide image to m*m non-overlaping block
    for i=1:num_row_block
        for j=1:num_col_block
            
            % separate blocks 
            
            % block range in x axis
            x=[m*(i-1)+1, m*i];
            if x(1,2) > size(img,1)
                x(1,2) = size(img,1);
            end
            
            % block range in y axis
            y=[m*(j-1)+1, m*j];
            if y(1,2) > size(img,2)
                y(1,2) = size(img,2);
            end
        
            % apply histogram equalization on block
            adaptive_he_img(x(1,1):x(1,2),y(1,1):y(1,2)) = histeq_mine(img(x(1,1):x(1,2),y(1,1):y(1,2)));
            
        end
    end
    
end