im=imread('C:\Users\azril811116\Desktop\image2.jpg');
PS=rgb2gray(im);
figure,imshow(PS);
[m,n]=size(PS);                            %?量?像尺寸??
P=zeros(1,256);                           %??建存放灰度出?概率的向量
for k=0:255    
    P(k+1)=length(find(PS==k))/(m*n);     %?算每?灰度出?的概率，?其存入GP中相?位置
end
%figure,bar(P*m*n);
%P=imhist(im(:));

w=zeros(1,256);
for i=1:255
   w(i+1)=P(i)+w(i);
end
S2=round(w*256);   
%figure,bar(w);
z=zeros(1,256);
for i=1:256
   z(i)=(256-i)*w(i);
end

S3=round(z*2.3575);
%figure,bar(S3);
PA=PS;
for i=0:255     
    PA(PS==i)=S3(i+1);               %?各?像素?一化后的灰度值????像素
end
figure,imshow(PA) 


    
