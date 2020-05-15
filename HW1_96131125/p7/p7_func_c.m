function new_img = p7_func_c(img, p_size)
%img: input image
%p_size: number of color we want quantize image

%convert image to RGB pixels 
X = reshape(img, size(img,1)*size(img,2), 3);
X = double(X);

%do kmeans for finding colors in palette
[idx,C] = kmeans(X,p_size);

%reshape idx to its size becomes same as input image 
img_cluster = reshape(idx, size(img,1), size(img,2));

%make a new image and fill each pixel by its corresponding cluster(palette
%color)
new_img = img;
for i=1:size(new_img,1)
    for j=1:size(new_img,2)
        new_img(i, j, :) = C(img_cluster(i, j),:);
    end
end

end