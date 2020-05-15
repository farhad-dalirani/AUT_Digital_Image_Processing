function opened_img = gray_opening(img, st)
    % this function calculated opening of an image
    % structuring elemnt
    
    % erosion of image
    eroted_img = gray_erosion(img, st);
    
    % dialarion on erosion
    dilated_eroted_img = gray_dilation(eroted_img, st);
    
    opened_img = dilated_eroted_img;
    
end