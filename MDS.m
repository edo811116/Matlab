clear;
Im=imread('C:\Users\azril811116\DesKtop\image\kindize\CT\640.bmp');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
mds=zeros(2,256);
last=ones(1,256);%mode last
cast=ones(1,256);%change last
msast=ones(1,256);%mdg last
Max=0;
Min=0;
y1=0.5898;
x1=0.3359;
%L=10;H=126;
%P = adapthisteq(Im,'NumTiles',[8 8],'ClipLimit',0.002);
[P,L,H,RANGE]=Algorithm_1(Im,1.5,20,y1,x1);%Algorithm
for i=L+1:H+1
    for x=1:height
        for y=1:width
            if P(x,y)==i-1
                mode(1,last(i),i)=x;
                mode(2,last(i),i)=y;
                last(i)=last(i)+1;
            end
        end
    end
end
for i=L+1:H+1
    for k=1:last(i)-1%same graylevel of pixels
        if Im(mode(1,k,i),mode(2,k,i))~=i-1
            change(cast(i),i)=Im(mode(1,k,i),mode(2,k,i));
            cast(i)=cast(i)+1;
        end  
    end
    for k=1:cast(i)-1%same graylevel of pixels
        if change(k,i)==0
            change(k,i)=i-1;
        end 
    end
end
for i=L+1:H+1
    if cast(i)~=1
            Max=max(change(1:cast(i)-1,i));
            Min=min(change(1:cast(i)-1,i));
            mds(msast(i),i)=Max-Min;
            msast(i)=msast(i)+1;
            Max=0;Min=0;
    end
end
Mds=max(mds(:));

