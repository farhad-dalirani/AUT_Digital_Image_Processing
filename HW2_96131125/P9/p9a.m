% read trump images and sum them togheter

number_of_pictures = [2, 5, 10, 20];
for k = 1:4
    for i=1:number_of_pictures(k)
       img = imread(strcat('tiny_trump-',num2str(i),'.jpg'));

       if i == 1
          sum = double(img);
       else
          sum = sum + double(img);
       end
    end

    %average
    ave = uint8(sum / number_of_pictures(k));
    
    figure();
    imshow(ave);
    title(strcat('average- ', num2str(number_of_pictures(k))));
    imwrite(ave, strcat('p9a-tiny_trump-average-', num2str(number_of_pictures(k)), '.png'));
end

