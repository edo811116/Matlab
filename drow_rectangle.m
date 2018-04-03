I =imread('C:\Users\azril811116\DesKtop\image\kindize\CT\ct1.bmp');
imshow(I)  
% axis([0 1000 0 1000]);  
hold on  
fid = fopen('wgb_2.txt','wt');  
[x1,y1]=ginput(1);  
plot(x1,y1,'+');  
[x2,y2]=ginput(1);  
plot(x2,y2,'+');  
[x3,y3]=ginput(1);  
plot(x3,y3,'+');  
[x4,y4]=ginput(1);  
plot(x4,y4,'+');  
% plot([x1 x2],[y1 y2]);  
wgb = [[x1,y1];[x2,y2];[x3,y3];[x4,y4]];  
[row, col] = size(wgb);  
for i = 1:row  
    for j = 1:col  
        fprintf(fid, '%g\t', wgb(i,j));  
    end  
    fprintf(fid, '\n');  
end  
fclose(fid);  
vertColor = 'r';  
horizColor ='g';  
rectPts = wgb;  
hold on;  
h(1) = line([rectPts(1,1) rectPts(2,1)], [rectPts(1,2) rectPts(2,2)],'Color',vertColor);  
h(2) = line([rectPts(2,1) rectPts(3,1)],[rectPts(2,2) rectPts(3,2)],'Color',horizColor);  
h(3) = line([rectPts(3,1) rectPts(4,1)],[rectPts(3,2) rectPts(4,2)],'Color',vertColor);  
h(4) = line([rectPts(4,1) rectPts(1,1)],[rectPts(4,2) rectPts(1,2)],'Color',horizColor);  
hold off  
  
  
  
  
% plot([x1 x2],[y1 y2]);  
% plot([x2 x3],[y2 y3]);  
% plot([x3 x4],[y3 y4]);  
% plot([x4 x1],[y4 y1]);  
% button=1  
% while(button==1)  
%     [x1,y1]=ginput(1);  
%     plot(x1,y1,'+');  
% %     [x2,y2,button]=ginput(1);  
% %     plot(x2,y2,'+');  
% %     plot([x1 x2],[y1 y2]);  
% end  