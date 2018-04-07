clear;
%im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\chest CT with left pleural effusion1.jpg');
im=imread('C:\Users\azril811116\DesKtop\image\kindize\nmri\mri.bmp');
%{
[height,width]=size(im);
imshow(im);
hold on;
[x1,y1]=ginput(1);
x1=x1/width;
y1=y1/height;
%}
y1=0.5898;
x1=0.3359;
%[L,H,RANGE]=ROI(P,10,y1,x1);
%function En=PELH(p,L,H)
%P=adapthisteq(im);
%P = adapthisteq(im,'NumTiles',[8 8],'ClipLimit',0.002);
[P,L,H,RANGE]=Algorithm_1(im,4,10,y1,x1);%Algorithm
%[P,L,H,RANGE]=Algorithm_3(im,2,y1,x1);
%[P,L,H,RANGE]=PAVHE(im,1.5,y1,x1);
%[P,L,H,RANGE]=PAVHEv2(im,2,y1,x1);

    
%L=1;H=256;
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
    %%{
    hold on;
    y=[RANGE(1,2),RANGE(1,1),RANGE(1,1),RANGE(1,2),RANGE(1,2)];
    x=[RANGE(2,2),RANGE(2,2),RANGE(2,1),RANGE(2,1),RANGE(2,2)];
    plot(x,y,'r');
    %%}
%end