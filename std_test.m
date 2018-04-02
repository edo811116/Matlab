%g=imread('C:\Users\azril811116\DesKtop\image\ALRHS\brain.bmp');
function std=std_test(g)
M=mean_test(g);
[height,width]=size(g);
X=double(ones(height,width)*M);
g=double(g);
s=(g-X);

std=sqrt(sum(s(:).^2)/height/width);
end

