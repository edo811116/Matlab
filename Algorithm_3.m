%im=imread('C:\Users\azril811116\DesKtop\image\ALRHS\heart.jpg');
%g=rgb2gray(im);
%figure,imshow(g);
function [p,L,H]=Algorithm_3(g,Q,limit,xshift,yshift)%Algorithm_1(gorg,Q,limit,xshift,yshift)
    %Q=3;limit=50;xshift=0;yshift=0;
    [L,H,RANGE]=ROI(g,limit,xshift,yshift);%[Pedt,L,H,range,last]=ROI(gorg,limit,xshift,yshift)
    h=imhist(g(:));
    othernum1=0;
    othernum2=0;
    otherGrayscaleNum=L-1+255-H;
    for i=1:L-1
        othernum1=h(i)+othernum1;
    end
    for i=H:255
        othernum2=h(i+1)+othernum2;
    end
    othernumAll=othernum1+othernum2;
    otherAvg=othernumAll/double(otherGrayscaleNum);
    localnum=0;
    localGrayscaleNum=H-L+1;
    for i=L:H
        localnum=h(i)+localnum;
    end
    localAvg=localnum/double(localGrayscaleNum);
    N=Q*otherAvg/localAvg;

    for i=1:L-1
        if h(i)>otherAvg
            h(i)=otherAvg;
        end
    end
    for i=L:H
        if h(i)>N*localAvg
            h(i)=N*localAvg;
        else
            h(i)=N*localAvg+h(i);
        end
    end
    for i=H:255
        if h(i+1)>otherAvg
            h(i+1)=otherAvg;
        end
    end

    %figure,bar(h);
    p=HEv4(g,h,L,H);
    %HEv4;
    %ph=imhist(p);
    %figure,bar(ph);
    %print range
  %{
        for i=RANGE(1,2):RANGE(1,1)
            p(i,RANGE(2,1))=0;
            p(i,RANGE(2,2))=0;
        end
        for i=RANGE(2,2):RANGE(2,1)
            p(RANGE(1,1),i)=0;
            p(RANGE(1,2),i)=0;
        end
  %}  
    %figure,imshow(p);
    %E=entropy(p);
end
