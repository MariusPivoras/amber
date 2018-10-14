function DrawLines(Image,p1,p2)

    figure(1),imshow(Image);
    hold on;

    labels = {'Xmax','Ymax','Xmin','Ymin'};

    plot(p1(1),p2(1),'r*')
    plot(p1(2),p2(2),'g*')
    plot(p1(3),p2(3),'y*')
    plot(p1(4),p2(4),'b*')

    text(p1(1),p2(1),labels(1),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
    text(p1(2),p2(2),labels(2),'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r')
    text(p1(3),p2(3),labels(3),'VerticalAlignment','bottom','HorizontalAlignment','left','Color','r')
    text(p1(4),p2(4),labels(4),'VerticalAlignment','top','HorizontalAlignment','left','Color','r')

    line([p1(1),p1(2)],[p2(1),p2(2)],'Color','y','LineStyle','--')
    line([p1(2),p1(3)],[p2(2),p2(3)],'Color','g','LineStyle','--')
    line([p1(3),p1(4)],[p2(3),p2(4)],'Color','y','LineStyle','--')
    line([p1(4),p1(1)],[p2(4),p2(1)],'Color','g','LineStyle','--')

    hold off

end