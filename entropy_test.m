im=imread('C:\Users\azril811116\DesKtop\image\kindize\Xray\101.bmp');
%im=imread('C:\Users\azril811116\Desktop\image\ALRHS\brain.jpg');
[queue,r,p,pp]=AICE(im,3,20,0.5,0.5);
    h=zeros(256,1);
    for i=1:256
        for k=1:r-1
            if p(queue(1,k),queue(2,k))==i
               h(i)=h(i)+1; 
            end
        end
    end
    h=h./(r-1);
    %bar(h);
    
    E=0;
    for i=1:256
       if h(i)~=0
            E=E+h(i)*log2(h(i));
       end
    end
    En=-E;
    %En=entropy(im);
    %imshow(p);


    