% Create a 400*400 matrix which at beginnig all elements
% have value 255
img = ones(400, 400)*255;

% Create a equilateral triangle at the center of image
% corners of equilateral triangle with length 100
for x = 1:400
   for y = 1:400
       % if point(x, y) is inside the triangle then 
       % set intensity of pixel as 0(black)
       
       % position of point related to sides of the triangle
       position_of_point = [0, 0, 0];
       
       % left side of triangle
       x_on_line = ((142-229)/(200-150)) * (y-200)+ 142; 
       sign1 = (x_on_line - x);
       
       % right side of triangle
       x_on_line = ((142-229)/(200-250)) * (y-200)+ 142; 
       sign2 = (x_on_line - x);
       
       % bottom side of triangle
       x_on_line = ((229-229)/(150-250)) * (y-250)+ 229; 
       sign3 = (x_on_line - x);
       
       if sign1 <= 0 && sign2 <= 0 && sign3 >= 0
          img(x, y) = 0;
       end
       
   end
end

% Convert elements of matrix to unsigned integer 8
img = uint8(img);

% Show image
imshow(img);

% save image
imwrite(img, 'p1g.png');

