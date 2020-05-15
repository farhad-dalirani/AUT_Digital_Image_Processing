% read source file
src = imread('source.png');

% read encrypted file
enc = imread('encrypted.png');

% compare two image
isequal(src, enc)