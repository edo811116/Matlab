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
%[P,L,H]=PAVHE(im,3,0.1,0.5);
%x1=0.78;y1=0.66;
[P,L,H,RANGE]=PAVHEv2(im,2,y1,x1);
for i=RANGE(1,2):RANGE(1,1)
    P(i,RANGE(2,1))=255;
    P(i,RANGE(2,2))=255;
end
for i=RANGE(2,2):RANGE(2,1)
    P(RANGE(1,1),i)=255;
    P(RANGE(1,2),i)=255;
end
figure,imshow(P);