im=imread('C:\Users\azril811116\Desktop\2014-07-04-142933.jpg');
b=fspecial('gaussian',[10 10],3);
bim=imfilter(im,b);
%figure, imshow(bim);
imwrite(bim,'blurring.jpg');