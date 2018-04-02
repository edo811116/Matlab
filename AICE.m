%Korg = rgb2gray(imread('C:\Users\azril811116\DesKtop\image\ALRHS\heart.jpg'));
%figure,imshow(Korg);
function [queue,r,P,PP]=AICE(Korg,N,limit,xshift,yshift)
    Korg=double(Korg);
    %N=2;limit=20;xshift=0;yshift=0;
    ave=imfilter(Korg,fspecial('average',[3 3]));
    [height,width]=size(Korg);
    check=zeros(height,width);
    Kroi=Korg;
    Kedt=double(ones(height,width).*255);
    queue=zeros(2,height*width);
    %a=zeros(2,height*width);
    x0=int16(height*xshift);
    y0=int16(width*yshift);
    r=1;%queue right
    l=1;%queue left
    queue(1,r)=x0;
    queue(2,r)=y0;
    r=r+1;
    check(x0,y0)=1;%此點已檢查過
    Kroi(x0,y0)=255;
    if limit>Korg(x0,y0)
        return;
    end
    while l<r
        x=queue(1,l);
        y=queue(2,l);
        %if (x<2)||(x>height-1)||(y<2)||(y>width-1)
        %    break;
        %end
        if x<2
            x=uint16(height*3/4);
        end
        if x>height-1
            x=uint16(height/4);
        end
        if y<2
            y=uint16(width*3/4);
        end
        if y>width-1
            y=uint16(width/4);
        end
         for i=-1:1
            for j=-1:1
                if check(x+i,y+j)==0%此點未檢查過 
                    if abs(Korg(x+i,y+j)-Korg(x0,y0))<limit
                        %Kedt(x+i,y+j)=Korg(x+i,y+j);
                        Kedt(x+i,y+j)=Korg(x0,y0)-N*(Korg(x0,y0)-Korg(x+i,y+j));
                        check(x+i,y+j)=1;%此點已檢查過
                        Kroi(x+i,y+j)=255;
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        
                    elseif abs(ave(x+i,y+j)-Korg(x0,y0))<limit
                        %Kedt(x+i,y+j)=Korg(x+i,y+j);
                        Kedt(x+i,y+j)=Korg(x0,y0)-N*(Korg(x0,y0)-Korg(x+i,y+j));
                        check(x+i,y+j)=1;%此點已檢查過
                        Kroi(x+i,y+j)=255;
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        
                    end
                else
                check(x+i,y+j)=1;%此點已檢查
                end
             end
         end
       l=l+1;
    end
    Kedt=uint8(Kedt);
    Kroi=uint8(Kroi);
    P=Kedt;
    PP=Kroi;
    %h=imhist(Kedt);
    %h(256)=0;
    %PP=h;
    %figure,bar(h);
    %figure,imshow(Kedt);
end
