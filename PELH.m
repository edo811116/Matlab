im=imread('C:\Users\azril811116\DesKtop\image\kindize\ultrasound\601.bmp');
%L=15;H=120;
%function En=PELH(p,L,H)
%P=adapthisteq(im);
%[P,L,H]=ALRHS(im,7,192,4);% ALRHS Equalization
%[P,L,H]=Algorithm_1(im,3,40,0.5,0.5);%Algorithm
%[P,L,H]=Algorithm_2(im,3,40,0.5,0.5);%Algorithm
%[P,L,H]=Algorithm_3(im,3,40,0.5,0.5);%Algorithm
[P,L,H,class]=Algorithm_4(im,3,40,0.5,0.5);%Algorithm
    %L=154;H=234;
    [height,width]=size(P);
    queue=zeros(1,height*width);
    h=zeros(256,1);
    E=0;
    last=1;
    for x=1:height
        for y=1:width
           if (P(x,y)>=L-1)&&(P(x,y)<=H-1)
               queue(1,last)=P(x,y);
               last=last+1;
           end
        end
    end
    for k=1:256
        for i=1:last-1
            if queue(1,i)==k-1
                h(k)=h(k)+1;
            end
        end
    end
    
    h=h./(last-1);
    for i=1:256
       if h(i)~=0
            E=E+h(i)*log2(h(i));
       end
    end
    En=-E;
    %p=imhist(P(:))/numel(P);
    %imshow(P);
%end