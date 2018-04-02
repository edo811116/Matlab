function [P,L,H,class]=Algorithm_4(g,Q,limit,xshift,yshift)
%g=imread('C:\Users\azril811116\DesKtop\image\kindize\ultrasound\601.bmp');
[L,H,RANGE]=ROI(g,limit,xshift,yshift);
h=imhist(g);
%L=41;H=107;Q=2;
Gmax=max(h(L:H));
for i=L:H
    if h(i)==0
        h(i)=1000;
    end
end
Gmin=min(h(L:H));
for i=L:H
    if h(i)==1000
        h(i)=0;
    end
end
GL=h(L);
GH=h(H);
for i=L:H
    if h(i)==Gmin
        hmin=i;
        break;
    end
end
for i=L:H
    if h(i)==Gmax
        hmax=i;
        break;
    end
end
if (GH>GL)&&(Gmax<=GH)
    class=1;
elseif (GL>GH)&&(Gmax<=GL)
    class=2;
elseif (Gmax>GL)&&(Gmax>GH)
    class=3;
elseif (Gmin<GL)&&(Gmin<GH)
    class=4;
end
%class=1;
switch class
    case 1
        stretch=linspace(0.5,Q,H-L+1);
        for i=L:H
        h(i)=h(i)*stretch(i-L+1);
        end
    case 2
        stretch=linspace(Q,0.5,H-L+1);
        for i=L:H
        h(i)=h(i)*stretch(i-L+1);
        end
    case 3
        stretch1=linspace(0.5,Q,hmax-L+1);
        stretch2=linspace(Q,0.5,H-hmax+1);
        for i=L:hmax
        h(i)=h(i)*stretch1(i-L+1);
        end
        for i=hmax+1:H
        h(i)=h(i)*stretch2(i-hmax);
        end
    case 4
        stretch1=linspace(Q,0.5,hmin-L+1);
        stretch2=linspace(0.5,Q,H-hmin+1);
        for i=L:hmin
        h(i)=h(i)*stretch1(i-L+1);
        end
        for i=hmin+1:H
        h(i)=h(i)*stretch2(i-hmin);
        end
end

h(1)=0;
P=HEv4(g,h,L,H);
%imshow(P);
end