im=imread('C:\Users\azril811116\DesKtop\image\kindize\Xray\101.bmp');
[queue,r,p,pp]=AICE(im,3,20,0.5,0.5);
G=zeros(1,r-1);

for i=1:r-1
    G(i)=double(p(queue(1,i),queue(2,i)));
end
M=sum(G(:))/r;
s=(G-M).^2;
std=sqrt(sum(s(:))/r);

