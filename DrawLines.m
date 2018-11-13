%------------------------------------------------------
%Gintarø rûðiavimas
%Modifikuota: 2018-10-16
%Gintaro nuotraukos surastø taðku vizualizavimas
%------------------------------------------------------
function DrawLines(Image,p1,p2)

    figure(1),imshow(Image);
    hold on;

    labels = {'Xmax','Ymid','Xmin','Ymid'};

    plot(p1(1),p2(1),'g*')
    plot(p1(2),p2(2),'g*')
    plot(p1(3),p2(3),'r*')
    plot(p1(4),p2(4),'r*')
%     plot(p1(5),p2(5),'y*')
%     plot(p1(6),p2(6),'y*')
%     plot(p1(7),p2(7),'b*')
%     plot(p1(8),p2(8),'b*')
    

%     text(p1(1),p2(1),labels(1),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
%     text(p1(2),p2(2),labels(2),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
%     text(p1(3),p2(3),labels(3),'VerticalAlignment','bottom','HorizontalAlignment','left','Color','r')
%     text(p1(4),p2(4),labels(4),'VerticalAlignment','top','HorizontalAlignment','left','Color','r')

    line([p1(1),p1(2)],[p2(1),p2(2)],'Color','g','LineStyle','--')
    line([p1(3),p1(4)],[p2(3),p2(4)],'Color','r','LineStyle','--')
%     line([p1(5),p1(6)],[p2(5),p2(6)],'Color','y','LineStyle','--')
%     line([p1(7),p1(8)],[p2(7),p2(8)],'Color','b','LineStyle','--')
%     line([p1(5),p1(6)],[p2(5),p2(6)],'Color','r','LineStyle','--')
%     line([p1(6),p1(7)],[p2(6),p2(7)],'Color','r','LineStyle','--')
%     line([p1(7),p1(8)],[p2(7),p2(8)],'Color','r','LineStyle','--')
%     line([p1(8),p1(1)],[p2(8),p2(1)],'Color','r','LineStyle','--')
  
pause
    hold off

end