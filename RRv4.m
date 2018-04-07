clear;
%Im = rgb2gray(imread('C:\Users\azril811116\DesKtop\image\ALRHS\lumber.jpg'));
Im=imread('C:\Users\azril811116\DesKtop\image\kindize\nmri\mri.bmp');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
R=zeros(height*width,256);
MODE=zeros(1,256);
last=ones(1,256);%mode last
rast=ones(1,256);%R last
cast=ones(1,256);%change last
y1=0.5898;
x1=0.3359;
%L=0;H=255;
%P = adapthisteq(Im,'NumTiles',[8 8],'ClipLimit',0.002);
[P,L,H,RANGE]=Algorithm_1(Im,1.5,20,y1,x1);%Algorithm


for I=L+1:H+1
        for x=1:height
            for y=1:width
                if Im(x,y)==I-1
                    mode(1,last(I),I)=x;
                    mode(2,last(I),I)=y;
                    last(I)=last(I)+1;
                end
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
    end
end
rr=sqrt(sum(R(:).^2)/height/width);
%figure,imshow(P);

