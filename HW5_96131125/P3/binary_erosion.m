function erosion_img = binary_erosion(img, st)
    % This function erosions input image with given structing element
    % img = input image, binary image
    % st = structuring element, size of st should be odd 
    
    M = size(img,1); N = size(img,2);
    
    % pad input image
    img = padarray(img, [floor(size(st,1)/2)+1, floor(size(st,2)/2)+1], 1, 'both');
    
    % itialize output image
    erosion_img = zeros(size(img));
    
    % number of ones in structring elemnt
    st_ones = sum(sum(st)); 
    
    % do dialation
    for i = floor(size(st,1)/2)+1: floor(size(st,1)/2)+1+M
        for j = floor(size(st,2)/2)+1: floor(size(st,2)/2)+1+N
            
            % check structring element has full contact with 
            % true values in image or not, if it is mark center of st as true
            cover_neighbour = sum(sum(img(i-floor(size(st,1)/2):i+floor(size(st,1)/2),...
                                j-floor(size(st,2)/2):j+floor(size(st,2)/2)) .* st));
            
            if cover_neighbour == st_ones
                erosion_img(i,j) = 1;
            else
                erosion_img(i,j) = 0;
            end
            
                            
        end
    end
    
    % crop padded region
    erosion_img = erosion_img(floor(size(st,1)/2)+1:floor(size(st,1)/2)+1+M,...
        floor(size(st,2)/2)+1:floor(size(st,2)/2)+1+N);
end