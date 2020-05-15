function adaptive_thre_img = adaptive_thresholding_non_overlapping(img, m, threshold_ratio)
    % This function divide image to m*m non-overlapping blocks
    % then it applies histogram equalization on each one.
    
    % initial image
    adaptive_thre_img = img;
    
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
            
            non_overlap_block = img(x(1,1):x(1,2),y(1,1):y(1,2));
            min_hood = min(min(non_overlap_block));
            max_hood = max(max(non_overlap_block));
            block_threshold = uint8( floor((double(non_overlap_block) >= (min_hood+threshold_ratio*(max_hood-min_hood))))* 255);
            
            
            % apply histogram equalization on block
            adaptive_thre_img(x(1,1):x(1,2),y(1,1):y(1,2)) = block_threshold;
            
        end
    end
    
end