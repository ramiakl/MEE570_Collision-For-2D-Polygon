%function edge_isCollision_test()
%The function creates an edge from $ [ smallmatrix0\ smallmatrix ]$ to $ [
%smallmatrix1\ smallmatrix ]$ and a second random edge with endpoints contained
%in the square $[0,1] [0,1]$, and plots them in green if they do not overlap, and
%in red otherwise.
function edge_isCollision_test()
edge1=[0 1;0 1];
edge2=rand(2,2);
flagCollision=edge_isCollision(edge1,edge2);
if flagCollision
  style='r';
else
  style='g';
end
style=[style '-o'];
plot(edge1(1,:),edge1(2,:),style)
hold on
plot(edge2(1,:),edge2(2,:),style)
hold off
