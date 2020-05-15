function [palette, dominant] = p7_func(img, p_size)
%img: input image
%p_size: number of color we want quantize image

%convert image to RGB pixels 
X = reshape(img, size(img,1)*size(img,2), 3);
X = double(X);

%do kmeans for finding colors in palette
[idx,C] = kmeans(X,p_size);

%find dominant color
count = zeros(1, p_size);
for i = 1:size(X,1)
   count(idx(i,1)) = count(idx(i,1)) + 1; 
end
[M,I] = max(count);

dominant = uint8(C(I,:));
palette = uint8(C);

end