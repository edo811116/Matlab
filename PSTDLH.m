clear;
im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\ct1.bmp');
%L=41;H=107;
%function std=PSTDLH(im,L,H)
    %P=adapthisteq(im);
    P = adapthisteq(im,'NumTiles',[8 8],'ClipLimit',0.005);
    %[P,L,H]=Algorithm_1(im,2,40,0.3,0.45);%Algorithm
   
    L=7;H=247;
    [height,width]=size(P);
    queue=double(zeros(1,height*width));
    last=1;
    for x=1:height
        for y=1:width
           if (P(x,y)>=L)&&(P(x,y)<=H)
               queue(1,last)=P(x,y);
               last=last+1;
           end
        end
    end
    M1=sum(queue(:))/last-1;
    
    
    mean=ones(1,height*width).*M1;
    s=queue-mean;
    std=sqrt(sum(s(1:last-1).^2)/(last-1));
    %imshow(P);
%end 
    