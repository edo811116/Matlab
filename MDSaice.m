Im=imread('C:\Users\azril811116\DesKtop\image\kindize\Xray\640.bmp');
%Im = imread('C:\Users\azril811116\DesKtop\image\ALRHS\brain.jpg');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
mds=zeros(2,256);
last=ones(1,256);%mode last
cast=ones(1,256);%change last
msast=ones(1,256);%mdg last
Max=0;
Min=0;
[queue,r,P,PP]=AICE(Im,3,30,0.5,0.5);
L=157;H=228;
for i=L+1:H+1
    for J=1:r-1
            if P(queue(1,J),queue(2,J))==i-1
                mode(1,last(i),i)=queue(1,J);
                mode(2,last(i),i)=queue(2,J);
                last(i)=last(i)+1;
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

