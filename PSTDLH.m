clear;
im=imread('C:\Users\azril811116\DesKtop\image\kindize\nmri\mri.bmp');

%L=1;H=256;
y1=0.5898;
x1=0.3359;
%[L,H,RANGE]=ROI(P,10,y1,x1);
%P=adapthisteq(im);
%P = adapthisteq(im,'NumTiles',[8 8],'ClipLimit',0.002);
%[P,L,H,RANGE]=Algorithm_1(im,4,10,y1,x1);%Algorithm
%[P,L,H,RANGE]=Algorithm_3(im,2,y1,x1);
%[P,L,H,RANGE]=PAVHE(im,1.5,y1,x1);
%[P,L,H,RANGE]=PAVHEv2(im,2,y1,x1);

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
    