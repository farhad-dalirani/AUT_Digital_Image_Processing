function dialated_img = binary_dilation(img, st)
    % This function dialates input image with given structing element
    % img = input image, binary image
    % st = structuring element, size of st should be odd 
    
    % rotate structuring element by 180 degree
    st = imrotate(st, 180);
    
    M = size(img,1); N = size(img,2);
    
    % pad input image
    img = padarray(img, [floor(size(st,1)/2)+1, floor(size(st,2)/2)+1], 'both');
    
    % itialize output image
    dialated_img = zeros(size(img));
    
    % do dialation
    for i = floor(size(st,1)/2)+1: floor(size(st,1)/2)+1+M
        for j = floor(size(st,2)/2)+1: floor(size(st,2)/2)+1+N
            
            % check structring element has contact with 
            % at least one true value in image or not, if it is mark center of st as true
            cover_neighbour = sum(sum(img(i-floor(size(st,1)/2):i+floor(size(st,1)/2),...
                                j-floor(size(st,2)/2):j+floor(size(st,2)/2)) .* st));
            
            if cover_neighbour > 0
                dialated_img(i,j) = 1;
            else
                dialated_img(i,j) = 0;
            end
            
                            
        end
    end
    
    % crop padded region
    dialated_img = dialated_img(floor(size(st,1)/2)+1:floor(size(st,1)/2)+1+M,...
        floor(size(st,2)/2)+1:floor(size(st,2)/2)+1+N);
end