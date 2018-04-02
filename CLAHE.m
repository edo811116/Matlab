I = rgb2gray(imread('C:\Users\azril811116\DesKtop\image\image6.jpg'));
%I = imread('tire.tif');
%A = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
A = adapthisteq(I);
%figure,imshow(I);
figure,imshow(A);

