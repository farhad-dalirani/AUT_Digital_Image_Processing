function gray = p2h_func(img)
    % calculate gray scale by using this relation
    % gray scale image = (red+green+blue)/3
    gray = uint8((uint32(img(:,:,1))+uint32(img(:,:,2))+uint32(img(:,:,3)))/3);
    %gray = (img(:,:,1)*0.2126+img(:,:,2)*0.7152+img(:,:,3)*0.0722)/3;
end