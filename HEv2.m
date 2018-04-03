function [p,Lnew,Hnew]=HEv2(g,h,RL,RH)
    %im=imread('C:\Users\azril811116\DesKtop\image\image6.jpg');
    %g=rgb2gray(im);
    %figure(1),bar(P);%PDF
    [height,width]=size(g);
    
    P=h/height/width;
    C=zeros(255,1);
    for i=1:255
        for j=1:i
           C(i)=P(j)+C(i);
        end
    end
    %figure(2),bar(C);%CDF
    C=C./max(C);
    H=255*C';
    H=uint8(H);
    %figure(3),bar(H);%HE
    Lnew=H(RL);
    Hnew=H(RH);
    p=g;
    for i=1:255     
        p(g==i)=H(i);
    end
    %figure(4),imshow(p) 
end
