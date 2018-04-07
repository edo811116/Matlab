%clear;
%Korg =imread('C:\Users\azril811116\DesKtop\image\kindize\CT\ct1.bmp');
function [L,H,RANGE]=ROIv2(Korg,xshift,yshift)
    limit=10;
    Korg=double(Korg);
    ave=imfilter(Korg,fspecial('average',[3 3]));
    [height,width]=size(Korg);
    check=zeros(height,width);
    queue=zeros(2,height*width);
    range=zeros(2,height*width);
    last=1;%last point of range
    %xshift=0.5;yshift=0.5;
    x0=int16(height*xshift);
    y0=int16(width*yshift);
    r=1;%queue right
    l=1;%queue left
    queue(1,r)=x0;
    queue(2,r)=y0;
    r=r+1;
    range(1,last)=x0;
    range(2,last)=y0;
    last=last+1;
    check(x0,y0)=1;%此點已檢查過
    L=Korg(x0,y0);
    H=Korg(x0,y0);
    if limit>Korg(x0,y0)
        aaaa=1;
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
                        if Korg(x+i,y+j)>H
                            H=Korg(x+i,y+j);
                        elseif Korg(x+i,y+j)<L
                            L=Korg(x+i,y+j);
                        end
                        check(x+i,y+j)=1;%此點已檢查過
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        range(1,last)=x+i;
                        range(2,last)=y+j;
                        last=last+1;
                    elseif abs(ave(x+i,y+j)-Korg(x0,y0))<limit  
                        if Korg(x+i,y+j)>H
                            H=Korg(x+i,y+j);
                        elseif Korg(x+i,y+j)<L
                            L=Korg(x+i,y+j);
                        end
                        check(x+i,y+j)=1;%此點已檢查過
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        range(1,last)=x+i;
                        range(2,last)=y+j;
                        last=last+1;
                    else
                        check(x+i,y+j)=1;%此點已檢查
                    end
                end
             end
         end
       l=l+1;
    end
    RANGE=[max(range(1,1:last-1)) min(range(1,1:last-1));max(range(2,1:last-1)) min(range(2,1:last-1))];
end