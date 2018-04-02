%p=imread('C:\Users\azril811116\DesKtop\image\ALRHS\brain.bmp');
function [queue,last,Mean]=PMLH(p,L,H)
    %L=25;H=225;
    [height,width]=size(p);
    queue=double(zeros(1,height*width));
    last=1;
    for x=1:height
        for y=1:width
           if (p(x,y)>=L)&&(p(x,y)<=H)
               queue(1,last)=p(x,y);
               last=last+1;
           end
        end
    end
    Mean=sum(queue(:))/last-1;
end