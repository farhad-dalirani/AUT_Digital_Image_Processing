% read input image
img = imread('trump_bearded.jpg');

count_intensity = zeros(1, 256);

% count number of each intensity
for i = 1:size(img,1)
    for j = 1:size(img,2)
        count_intensity(1, img(i,j)+1) = count_intensity(1, img(i,j)+1) + 1; 
    end
end

format long;

% probabilty of each intensity
prob = count_intensity ./ double(size(img,1) * size(img,2));

% calculate entropy
entropy_img = 0;
for i=1:256
   if prob(1,i) ~= 0
       entropy_img = entropy_img + prob(1,i)*log2(prob(1,i));
   end
end
entropy_img = -entropy_img;

disp('Entropy:');
disp(entropy_img);


