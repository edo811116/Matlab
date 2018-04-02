%Korg = rgb2gray(imread('C:\Users\azril811116\DesKtop\image\ALRHS\lumber.jpg'));
function [L,H,RANGE]=ROI(Korg,limit,xshift,yshift)
    Korg=double(Korg);
    ave=imfilter(Korg,fspecial('average',[3 3]));
    [height,width]=size(Korg);
    check=zeros(height,width);
    Kedt=double(ones(height,width).*255);
    queue=zeros(2,height*width);
    range=zeros(2,height*width);
    last=1;%last point of range
    %xshift=0;yshift=0;Q=3;limit=20;
    x0=int16(height*xshift);
    y0=int16(width*yshift);
    r=1;%queue right
    l=1;%queue left
    uz=0;% unzero number
    queue(1,r)=x0;
    queue(2,r)=y0;
    r=r+1;
    range(1,last)=x0;
    range(2,last)=y0;
    last=last+1;
    check(x0,y0)=1;%此點已檢查過
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
                        Kedt(x+i,y+j)=Korg(x+i,y+j);
                        check(x+i,y+j)=1;%此點已檢查過
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        range(1,last)=x+i;
                        range(2,last)=y+j;
                        last=last+1;
                        
                     elseif abs(ave(x+i,y+j)-Korg(x0,y0))<limit
                        Kedt(x+i,y+j)=Korg(x+i,y+j);
                        check(x+i,y+j)=1;%此點已檢查過
                        queue(1,r)=x+i;
                        queue(2,r)=y+j;
                        r=r+1;
                        range(1,last)=x+i;
                        range(2,last)=y+j;
                        last=last+1;
                        
                     end
                else
                check(x+i,y+j)=1;%此點已檢查
                end
             end
         end
       l=l+1;
    end
    Kedt=uint8(Kedt);
    %figure,imshow(Kedt);
    %figure,imshow(Korg);
    %P=Kedt;
    p=imhist(Kedt);
    p(256)=0;
    %figure,bar(p);
    
    RANGE=[max(range(1,1:last-1)) min(range(1,1:last-1));max(range(2,1:last-1)) min(range(2,1:last-1))];
    for i=1:256  %find L of ROI
        if p(i)~=0
            uz=uz+1;
        end
        if uz>1
            L=i;
            uz=0;
            break;
        end
    end
    for i=256:-1:L  %find H of ROI
        if p(i)~=0
            uz=uz+1;
        end
        if uz>1
            H=i;
            break;
        end
    end
end