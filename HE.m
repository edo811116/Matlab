im=imread('C:\Users\azril811116\Desktop\image2.jpg');
PS=rgb2gray(im);
figure,imshow(PS);
[m,n]=size(PS);                            %?�q?���ؤo??
P=zeros(1,256);                           %??�ئs��ǫץX?���v���V�q
for k=0:255    
    P(k+1)=length(find(PS==k))/(m*n);     %?��C?�ǫץX?�����v�A?��s�JGP����?��m
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
    PA(PS==i)=S3(i+1);               %?�U?����?�@�ƦZ���ǫ׭�????����
end
figure,imshow(PA) 


    
