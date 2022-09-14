function polygon_isSelfOccluded_test()
v=[0;0];
tTest=rand(2,1)*2*pi;
%tTest=deg2rad([100,-10]);
vPrev=[cos(tTest(1)); sin(tTest(1))];
vNext=[cos(tTest(2)); sin(tTest(2))];
t=linspace(0,2*pi,61);
vTest=[cos(t);sin(t)];
nbPoints=size(vTest,2);
flagPoint=false(1,nbPoints);
vPolygon=[vPrev v vNext];
quiver(vPolygon(1,1:2),vPolygon(2,1:2),...
    diff(vPolygon(1,:)),diff(vPolygon(2,:)),0,'k','linewidth',2)
hold on
for iPoint=1:nbPoints
    flagPoint(iPoint)=polygon_isSelfOccluded(v,vPrev,vNext,vTest(:,iPoint));
    vSeg=[v vTest(:,iPoint)];
    if flagPoint(iPoint)
        plot(vSeg(1,:),vSeg(2,:),'r')
    else
        plot(vSeg(1,:),vSeg(2,:),'g')
    end        
end
hold off
text(v(1),v(2),'vertex','HorizontalAlignment','center')
text(vPrev(1),vPrev(2),'vertexPrev','HorizontalAlignment','center')
text(vNext(1),vNext(2),'vertexNext','HorizontalAlignment','center')

axis equal
