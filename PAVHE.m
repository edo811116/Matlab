%im=imread('C:\Users\azril811116\DesKtop\image\ALRHS\heart.jpg');
%g=rgb2gray(im);
function p=PAVHE(g,Q,xshift,yshift)
    [height,width]=size(g);
    h=imhist(g(:));
    %Q=3;xshift=0;yshift=0;
    avg=imfilter(g,fspecial('average',[7 7]));
    std=int16(std_test(avg));
    x=int16(height/2+xshift);
    y=int16(width/2+yshift);

    L=int16(g(x,y))-2*std;
    if L<=0
        L=2;
    end
    H=int16(g(x,y))+2*std;
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
    p=HEv2(g,h);
    %p=histeq(g);
    %figure,imshow(g);
end