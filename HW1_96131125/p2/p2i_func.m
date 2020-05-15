function crop_img = p2i_func(img, rec)
    crop_img = img(rec(1):(rec(3)+rec(1)),rec(2):(rec(4)+rec(2)));
end