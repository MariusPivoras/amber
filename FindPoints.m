%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Taðkø koordinaèiø iðgavimas gintaro dydþiui ir formai apskaièiuoti
%------------------------------------------------------
function [p1,p2]=FindPoints(image,level)
    
%   Ektremaliø taðkø suradimas
% Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.107.jpg');
% image=PreprocessImage(Im);
% 
% imshow(image)
% pause
    [y,x] = find(image == 1);
    
    [xMin,indX]=min(x);
    yXMin=y(indX);
    
    [xMax,indX1]=max(x);
    yXMax=y(indX1);
    
    [yMin,indY]=min(y);
    xYmin=x(indY);

    [yMax,indX1]=max(y);
    xYmax=x(indX1);


    distX =  calculateDistance (xMin, yXMin, xMax, yXMax);
    distY =  calculateDistance (xYmin, yMin, xYmax, yMax);
     
    xMid1=xMin+(int16(distX/3));
    tmp = find(x==xMid1);
    yMidMax= y(tmp(1));
    yMidMin= y(tmp(end)); 
    
    xMid2=xMin+((int16(distX/3))*2);
    tmp2 = find(x==xMid2);
    yMidMax2= y(tmp2(1));
    yMidMin2= y(tmp2(end)); 
    
    yMid1=yMin+(int16(distY/3));
    tmp3 = find(y==yMid1);
    xMidMax1= x(tmp3(1));
    xMidMin1= x(tmp3(end)); 
    
    yMid2=yMin+((int16(distY/3))*2);
    tmp4 = find(y==yMid2);
    xMidMax2= x(tmp4(1));
    xMidMin2= x(tmp4(end)); 
%     
    
    
%     
%     p1=[, xMidMax1,xMid1, xMid2, xMidMin1, xMid2, xMid1];
%     p2=[  yMid1, yMidMax, yMidMax2,yMid1,  yMidMin2, yMidMin ];
    
    p1=[xMidMax2, xMidMax1,xMid1, xMid2, xMidMin1, xMidMin2, xMid2, xMid1];
    p2=[ yMid2, yMid1, yMidMax, yMidMax2,yMid1, yMid2, yMidMin2, yMidMin ];
    
%     DrawLines(image,p1,p2);
end

function dist = calculateDistance (x1, y1, x2, y2)

    dist = sqrt((x1-x2)^2+(y1-y2)^2);

end