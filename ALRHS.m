%g=imread('C:\Users\azril811116\DesKtop\image\ALRHS\lumber.bmp');
%g=rgb2gray(im);
function [p,Lnew,Hnew]=ALRHS(g,L,H,Z)
    %figure(1),imshow(g);
    He=max(g(:));
    Le=min(g(:));
    %Z=4;
    %L=68;
    %H=164;
    Hnew=255+1-(He-H+1)/Z;
    Lnew=(L-Le+1)/Z-1;
    a=uint8((Hnew-Lnew)/(H-L));
    [height,width]=size(g);
    for i=1:height
        for j=1:width
            if g(i,j)<=L
               g(i,j)=(g(i,j)-Le)/Z;
            elseif g(i,j)>=H
               g(i,j)=255-(He-g(i,j))/Z;
            else   
               g(i,j)=(g(i,j)-L)*a-Lnew; 
            end
        end
    end
    p=g;
    %E2=PELH(p,Lnew,Hnew);
end
