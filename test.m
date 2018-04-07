im=imread('C:\Users\azril811116\DesKtop\image\kindize\Xray\640.bmp');
[height,width]=size(im);
imshow(im);
hold on;
[x1,y1]=ginput(1);
x1=x1/height;
y1=y1/width;
%[P,L,H]=Algorithm_3(im,3,30,0.5,0.5);%Algorithm
%[P,L,H,class]=Algorithm_4(im,2,30,0.5,0.5);
%P = adapthisteq(im,'NumTiles',[8 8],'ClipLimit',0.02);
%P = adapthisteq(im);
%[P,L,H,RANGE]=PAVHE(im,1.5,y1,x1);
%[P,L,H,RANGE]=PAVHEv2(im,2,y1,x1);
[P,L,H,RANGE]=Algorithm_3(im,2,x1,y1);
imshow(P);
hold on;
y=[RANGE(1,2),RANGE(1,1),RANGE(1,1),RANGE(1,2),RANGE(1,2)];
x=[RANGE(2,2),RANGE(2,2),RANGE(2,1),RANGE(2,1),RANGE(2,2)];
plot(x,y,'r');