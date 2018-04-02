%Im = rgb2gray(imread('C:\Users\azril811116\DesKtop\image\ALRHS\lumber.jpg'));
Im=imread('C:\Users\azril811116\DesKtop\image\kindize\ultrasound\7.bmp');
[height,width]=size(Im);
mode=zeros(2,height*width,256);
change=ones(height*width,256).*1000;
R=zeros(height*width,256);
MODE=zeros(1,256);
last=ones(1,256);%mode last
rast=ones(1,256);%R last
cast=ones(1,256);%change last
%P=adapthisteq(Im);
%[P,L,H]=ALRHS(Im,164,220,4);% ALRHS Equalization
%P=PAVHE(Im,3,0,0);%PAVHE Equalization
%P=HEv2(Im,imhist(Im(:)));%HE
%[P,L,H]=Algorithm_1(Im,3,20,0.5,0.5);%Algorithm
%P=Algorithm_2(Im,3,50,0.5,0.5);%Algorithm
%[P,L,H]=Algorithm_3(Im,3,30,0.5,0.5);%Algorithm
[P,L,H,class]=Algorithm_4(Im,3,40,0.5,0.5);%Algorithm
%L=164;H=220;
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

