im=imread('C:\Users\azril811116\DesKtop\image\kindize\ultrasound\601.bmp');
%L=41;H=107;
%function std=PSTDLH(im,L,H)
    %P=adapthisteq(im);
    %[P,L,H]=ALRHS(im,41,107,4);% ALRHS Equalization
    %[P,L,H]=Algorithm_1(im,3,40,0.5,0.5);%Algorithm
    %[P,L,H]=Algorithm_2(im,2,20,0,0);%Algorithm
    %[P,L,H]=Algorithm_3(im,3,40,0.5,0.5);%Algorithm
    [P,L,H,class]=Algorithm_4(im,3,30,0.5,0.5);%Algorithm
    %L=87;H=132;
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
    