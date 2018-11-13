%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Taðkø koordinaèiø iðgavimas gintaro dydþiui ir formai apskaièiuoti
%------------------------------------------------------
function [image]=FindPoints(image,level)
    
%   Ektremaliø taðkø suradimas
% Im=imread('C:\Users\Marius\Desktop\Magistrinis_darbas\MatLab\Gintaru_foto\Image.1.1.107.jpg');
% image=PreprocessImage(Im);

% imshow(image)
% pause
    [y,x] = find(image == 1);
    
    [xMinX,indX]=min(x);
    xMinY=y(indX);
    
    [xMaxX,indX1]=max(x);
    xMaxY=y(indX1);
    
    [yMinY,indY]=min(y);
    yMinX=x(indY);

    [yMaxY,indX1]=max(y);
    yMaxX=x(indX1);


    distX =  calculateDistance (xMinX, xMinY, xMaxX, xMaxY);
    distY =  calculateDistance (yMinX, yMinY, yMaxX, yMaxY);
     
    xMid1=xMinX+(int16(distX/3));
    tmp = find(x==xMid1);
    yMidMax1= y(tmp(1));
    yMidMin1= y(tmp(end)); 
    
    xMid2=xMinX+((int16(distX/3))*2);
    tmp2 = find(x==xMid2);
    yMidMax2= y(tmp2(1));
    yMidMin2= y(tmp2(end)); 
    
    yMid1=yMinY+(int16(distY/3));
    tmp3 = find(y==yMid1);
    xMidMax1= x(tmp3(1));
    xMidMin1= x(tmp3(end)); 
    
    yMid2=yMinY+((int16(distY/3))*2);
    tmp4 = find(y==yMid2);
    xMidMax2= x(tmp4(1));
    xMidMin2= x(tmp4(end)); 
%     
    distYMid1 = calculateDistance(xMid1, yMidMax1, xMid1, yMidMin1);
    distYMid2 = calculateDistance(xMid2, yMidMax2, xMid2, yMidMin2);
    
    distXMid1 = calculateDistance (xMidMax1, yMid1, xMidMin1, yMid1);
    distXMid2 = calculateDistance (xMidMax2, yMid2, xMidMin2, yMid2);
    
%     p1=[xMid1,xMid1,xMid2, xMid2, xMidMax1,xMidMin1, xMidMax2,xMidMin2];
%     p2=[yMidMax1,yMidMin1, yMidMax2, yMidMin2, yMid1, yMid1, yMid2, yMid2];
%         
% 
%     DrawLines(image,p1,p2);
    
%     imshow(image);
%     pause
    if distYMid1 < distYMid2
       image = flip(image ,2);
    end
%     imshow(image);
%     pause
    
    if distXMid1 > distXMid2
       image = flip(image ,1);
    end
    
    [y1,x1] = find(image == 1);
    
    [xMinX,indX]=min(x1);
    xMinY=y1(indX);
    
    [xMaxX,indX1]=max(x1);
    xMaxY=y1(indX1);
    
    [yMinY,indY]=min(y1);
    yMinX=x1(indY);

    [yMaxY,indX1]=max(y1);
    yMaxX=x1(indX1);


    distX =  calculateDistance (xMinX, xMinY, xMaxX, xMaxY);
    distY =  calculateDistance (yMinX, yMinY, yMaxX, yMaxY);
    
    xMid1=xMinX+(int16(distX/2));
    tmp = find(x1==xMid1);
    yMidMax1= y1(tmp(1));
    yMidMin1= y1(tmp(end)); 
    
    yMid1=yMinY+(int16(distY/2));
    tmp3 = find(y1==yMid1);
    xMidMax1= x1(tmp3(1));
    xMidMin1= x1(tmp3(end)); 
    
    p1=[xMidMax1, xMidMin1,xMid1,xMid1];
    p2=[ yMid1, yMid1, yMidMax1, yMidMin1];
        

    DrawLines(image,p1,p2);
    
%    imshow(image)
%    pause
%     
%     p1=[, xMidMax1,xMid1, xMid2, xMidMin1, xMid2, xMid1];
%     p2=[  yMid1, yMidMax, yMidMax2,yMid1,  yMidMin2, yMidMin ];
    
%     p1=[xMidMax2, xMidMax1,xMid1, xMid2, xMidMin1, xMidMin2, xMid2, xMid1];
%     p2=[ yMid2, yMid1, yMidMax, yMidMax2,yMid1, yMid2, yMidMin2, yMidMin ];

end

function dist = calculateDistance (x1, y1, x2, y2)

    dist = sqrt(double((x1-x2)^2)+double((y1-y2)^2));

end