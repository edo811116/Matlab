clear;
im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\PELVIS.bmp');
[queue,r,p,pp]=AICE(im,2,40,0.4,0.45);
G=zeros(1,r-1);

for i=1:r-1
    G(i)=double(p(queue(1,i),queue(2,i)));
end
M=sum(G(:))/r;
s=(G-M).^2;
std=sqrt(sum(s(:))/r);

