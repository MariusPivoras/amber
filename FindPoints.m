%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Taðkø koordinaèiø iðgavimas gintaro dydþiui ir formai apskaièiuoti
%------------------------------------------------------
function [p1,p2]=FindPoints(image,level)
%     
% %   Ektremaliø taðkø suradimas
% Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.21.jpg');
% image=PreprocessImage(Im);
% 
% imshow(image)
% pause
    [y,x] = find(image == level);
    
    [xMin,indX]=min(x);
    yXMin=y(indX);
    
    [xMax,indX1]=max(x);
    yXMax=y(indX1);

    distX =  calculateDistance (xMin, yXMin, xMax, yXMax);
     
    xMid1=xMin+(int16(distX/3));
    tmp = find(x==xMid1);
    yMidMax= y(tmp(1));
    yMidMin= y(tmp(end)); 
    
    xMid2=xMin+((int16(distX/3))*2);
    tmp2 = find(x==xMid2);
    yMidMax2= y(tmp2(1));
    yMidMin2= y(tmp2(end)); 
    
    
    p1=[xMin,xMid1,xMid2,xMax,xMid2,xMid1];
    p2=[yXMin,yMidMax,yMidMax2,yXMax,yMidMin2,yMidMin];
    


end

function dist = calculateDistance (x1, y1, x2, y2)

    dist = sqrt((x1-x2)^2+(y1-y2)^2);

end