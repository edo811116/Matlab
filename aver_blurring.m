im=rgb2gray(imread('C:\Users\azril811116\Desktop\image\image1.jpg'));
%b = fspecial('average',[3 3]); %��w�@��20*20�������o�i
%bim1 = imfilter(im,b); %�N�����o�i�[�J��Ƕ��Ϥ��A�Ϲ��ܼҽk
%%%%%%%%%%%%%%%%%%%%%%%%
%%{
[height,width]=size(im);
b=ones(3,3)./9;
filt=zeros(height+2,width+2);
bim1=zeros(height,width);
for x=1:height
    for y=1:width
        filt(x+1,y+1)=im(x,y);
    end
end
for x=1:height
    for y=1:width
        bim1(x,y)=int16(sum(sum(filt(x:x+2,y:y+2).*b)));
    end
end
%%}
%%%%%%%%%%%%%%%%%%%%%%%%


figure,imshow(im);
figure,imshow(uint8(bim1))

