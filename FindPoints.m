function [p1,p2]=FindPoints(image,level)
    
%   Ektremaliø taðkø suradimas
    [y,x] = find(image == level);
    
    [x1,indX]=min(x);
    y1=y(indX);

    [y2,indY]=min(y);
    x2=x(indY);

    [x3,indX1]=max(x);
    y3=y(indX1);

    [y4,indY1]=max(y);
    x4=x(indY1);
    
    p1=[x1,x2,x3,x4];
    p2=[y1,y2,y3,y4];

end