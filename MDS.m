Im=imread('C:\Users\azril811116\DesKtop\image\kindize\NUmagnetic\ct1.bmp');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
mds=zeros(2,256);
last=ones(1,256);%mode last
cast=ones(1,256);%change last
msast=ones(1,256);%mdg last
Max=0;
Min=0;
%P=adapthisteq(Im);
%[P,L,H]=ALRHS(Im,164,220,4);% ALRHS Equalization
%P=PAVHE(Im,2,0,0);%PAVHE Equalization
%P=HEv2(Im,imhist(g(:)));%HE
%[P,L,H]=Algorithm_1(Im,3,20,0.5,0.5);%Algorithm
%P=Algorithm_2(Im,3,50,0.5,0.5);%Algorithm
%[P,L,H]=Algorithm_3(Im,3,20,0.5,0.5);%Algorithm
[P,L,H,class]=Algorithm_4(Im,3,40,0.5,0.5);%Algorithm
%L=164;H=220;
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

