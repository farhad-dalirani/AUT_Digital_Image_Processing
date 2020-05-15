function rotated_img = p2j_func(img, degree)
    if degree == 90
        % if rotation is 90
        rotated_img = flipdim(transpose(img),1);
    elseif degree == 180
        % if rotation is 180
        rotated_img = flipdim(flipdim(img,2),1);
    elseif degree == 270
        % if rotation is 270
        rotated_img = flipdim(transpose(img),2);
    end
        
end