%clear;
%g =imread('C:\Users\azril811116\DesKtop\image\kindize\CT\ct1.bmp');
function [p,Lnew,Hnew,RANGE]=PAVHEv2(g,Q,xshift,yshift)
    %xshift=0.5;yshift=0.5;limit=40;Q=2;
    %%[height,width]=size(g);
    h=imhist(g(:));
    [L,H,RANGE]=ROIv2(g,xshift,yshift);
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
    %figure(2),bar(h);
    [p,Lnew,Hnew]=HEv2(g,h,L,H);
    %p=histeq(g);
    %figure,imshow(p);
end