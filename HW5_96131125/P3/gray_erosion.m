function erosion_img = gray_erosion(img, st)
    % This function erotates input image with given structing element
    % img = input image
    % st = structuring element, size of st should be odd 
        
    M = size(img,1); N = size(img,2);
    
    % pad input image
    img = padarray(img, [floor(size(st,1)/2)+1, floor(size(st,2)/2)+1], 1, 'both');
    
    % itialize output image
    erosion_img = zeros(size(img));
    
    % do erosion
    for i = floor(size(st,1)/2)+1: floor(size(st,1)/2)+1+M
        for j = floor(size(st,2)/2)+1: floor(size(st,2)/2)+1+N
            
            % min(f(x+z)-k(z))
            max_in_neighbourhood = min(min(img(i-floor(size(st,1)/2):i+floor(size(st,1)/2),...
                                j-floor(size(st,2)/2):j+floor(size(st,2)/2)) - st));
            
            erosion_img(i,j) = max_in_neighbourhood;
            
                            
        end
    end
    
    % crop padded region
    erosion_img = erosion_img(floor(size(st,1)/2)+1:floor(size(st,1)/2)+1+M,...
        floor(size(st,2)/2)+1:floor(size(st,2)/2)+1+N);
end