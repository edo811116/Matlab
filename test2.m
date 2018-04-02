I=rgb2gray(imread('C:\Users\azril811116\DesKtop\image\ALRHS\heart.jpg'));

p = imhist(I(:));
p(p==0) = [];
p = p ./ numel(I);
E = -sum(p.*log2(p));