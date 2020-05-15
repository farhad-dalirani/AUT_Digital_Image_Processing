function flip_img = p2l_func(img, axis)
    
    if axis == 1
       % flip veticaly
       flip_img = img(size(img,1):-1:1, :);   
    elseif axis == 2
       % flip horizontaly
       flip_img = img(:, size(img,2):-1:1);
    end
end