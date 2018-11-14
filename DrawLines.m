%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Gintaro nuotraukos surastø taðku vizualizavimas
%------------------------------------------------------
function DrawLines(Image,p1,p2,xMid1,yMid1)

    figure(1),imshow(Image);
    hold on;

    labels = {'Xmax','Ymid','Xmin','Ymid'};

    plot(p1(1),p2(1),'g*')
    plot(p1(2),p2(2),'g*')
    plot(p1(3),p2(3),'r*')
    plot(p1(4),p2(4),'r*')
    plot(p1(4),p2(1),'k*')
%      m = 1; b = yMid1;
%      fplot(@(x)x, [0 500]);
%     plot(p1(6),p2(6),'y*')
%     plot(p1(7),p2(7),'b*')
%     plot(p1(8),p2(8),'b*')
    

%     text(p1(1),p2(1),labels(1),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
%     text(p1(2),p2(2),labels(2),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
%     text(p1(3),p2(3),labels(3),'VerticalAlignment','bottom','HorizontalAlignment','left','Color','r')
%     text(p1(4),p2(4),labels(4),'VerticalAlignment','top','HorizontalAlignment','left','Color','r')
   
    Image;
    [x1,y1] = size(Image);
    z=0;
    for i = 1:x1
        for j = 1:y1
            if Image(i,j)==1 && i==j-xMid1+yMid1
                z=z+1;
                point1(z,:)=[j,i];
                
            end
        end
    end
    plot(point1(1,1),point1(1,2),'r*');
    plot(point1(end,1),point1(end,2),'r*');
    line([point1(1,1),point1(end,1)],[point1(1,2),point1(end,2)],'Color','r','LineStyle','--')
    line([p1(1),p1(2)],[p2(1),p2(2)],'Color','b','LineStyle','--')
    line([p1(3),p1(4)],[p2(3),p2(4)],'Color','g','LineStyle','--')
%     line([xMid1-200, xMid1+200],[yMid1-200, yMid1+200],'Color','r','LineStyle','--')
%     line([p1(5),p1(6)],[p2(5),p2(6)],'Color','y','LineStyle','--')
%     line([p1(7),p1(8)],[p2(7),p2(8)],'Color','b','LineStyle','--')
%     line([p1(5),p1(6)],[p2(5),p2(6)],'Color','r','LineStyle','--')
%     line([p1(6),p1(7)],[p2(6),p2(7)],'Color','r','LineStyle','--')
%     line([p1(7),p1(8)],[p2(7),p2(8)],'Color','r','LineStyle','--')
%     line([p1(8),p1(1)],[p2(8),p2(1)],'Color','r','LineStyle','--')
  
pause
    hold off

end