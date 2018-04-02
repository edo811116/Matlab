Im=imread('C:\Users\azril811116\DesKtop\image\kindize\Xray\640.bmp');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
R=zeros(height*width,256);
MODE=zeros(1,256);
last=ones(1,256);%mode last
rast=ones(1,256);%R last
cast=ones(1,256);%change last
[queue,l,P,PP]=AICE(Im,3,20,0.5,0.5);
L=164;H=220;
for I=L+1:H+1
        for J=1:l-1
                if Im(queue(1,J),queue(2,J))==I-1
                    mode(1,last(I),I)=queue(1,J);
                    mode(2,last(I),I)=queue(2,J);
                    last(I)=last(I)+1;
                end
        end
end
for I=L+1:H+1
    for k=1:last(I)-1%same graylevel of pixels
        change(cast(I),I)=P(mode(1,k,I),mode(2,k,I));
        cast(I)=cast(I)+1;
    end
    Mode_test;
    MODE(I)=Mode;
end
for I=L+1:H+1
    for k=1:last(I)-1%same graylevel of pixels
        R(rast(I),I)=P(mode(1,k,I),mode(2,k,I))-MODE(I);
        rast(I)=rast(I)+1;
        if R(1,I)==255-MODE(I)
            R(1,I)=0;
        end
    end
end
rr=sqrt(sum(R(:).^2)/height/width);
%figure,imshow(P);

