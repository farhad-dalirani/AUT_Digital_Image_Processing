% read image in folder
images = dir('*.png');      
num_files = length(images);

for i=1:num_files
   file_name = images(i).name;
   image = imread(file_name);
   %invert image
   image_inv = p1h(image);

   subplot(2, num_files, i)
   imshow(image);
   subplot(2, num_files, num_files+i)
   imshow(image_inv);
   
   %save results
   imwrite(image_inv,strcat('p1h-',int2str(i),'.jpg'))
   
end