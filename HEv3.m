function p=HEv3(g,h,RL,RH)
    %im=imread('C:\Users\azril811116\DesKtop\image\image4.jpg');
    %g=rgb2gray(im);
    %RL=60;RH=158;
    P=h/numel(g);
    C=zeros(255,1);
    N=zeros(1,256);
    W=zeros(1,256);
    lost=0;
    nast=1;%N last
    wast=1;%W last
    for i=1:255
        for j=1:i
           C(i)=P(j)+C(i);
        end
    end

    C=C./max(C);
    H=255*C';
    H=uint8(H);
    for i=1:255
        if (H(i)-lost)>0
            lost=lost+1;
            while H(i)~=lost
                N(nast)=lost;
                lost=lost+1;
                nast=nast+1;
            end
        end
    end
   for i=1:3:nast
       for j=0:1:2
        W(i)=N(i+j)+W(i);
       end
       W(i)=W(i)/3;
   end
    W(W==0)=[];
    
    for i=1:254
        if W(i)>RL
            LL=i-1;
            break;
        end
    end
    for i=1:254
        if W(i)>RH
            HH=i;
            break;
        end
    end
    
    for i=1:254
        if (H(i+1)-H(i))==0
            H(i)=W(wast);
            wast=wast+1;
            if wast==LL
                wast=HH;
            end
            if wast>nast/2
                break;
            end
        end
    end
    
    H=sort(H);
    p=g;
    for i=1:255     
        p(g==i)=H(i);
    end
    
end
