clear;
%im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\chest CT with left pleural effusion1.jpg');
im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\ct1.bmp');
%function En=PELH(p,L,H)
%P=adapthisteq(im);
%P = adapthisteq(im,'NumTiles',[8 8],'ClipLimit',0.001);
%[P,Lnew,Hnew]=PAVHE(im,2,0.4,0.7);
%[P,L,H]=ALRHS(im,7,192,4);% ALRHS Equalization
[P,L,H]=Algorithm_1(im,2,40,0.5,0.5);%Algorithm

    L=1;H=256;
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
    for k=L:H
        for i=1:last-1
            if queue(1,i)==k-1
                h(k)=h(k)+1;
            end
        end
    end
    
    h=h./(last-1);
    for i=L:H
       if h(i)~=0
            E=E+h(i)*log2(h(i));
       end
    end
    En=-E;
    %p=imhist(P(:))/numel(P);
    imshow(P);
%end