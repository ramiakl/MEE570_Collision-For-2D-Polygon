%function [flag]=edge_isCollision(vertices1,vertices2)
%Returns  true if the two edges intesect.  Note: if the two edges overlap but are
%colinear, or they overlap only at a single endpoint, they are not considered as
%intersecting (i.e., in these cases the function returns  false). If one of the
%two edges has zero length, the function should always return the result that
%edges are non-intersecting.
function [flag]=edge_isCollision(vertices1,vertices2)

point1 = vertices1(:,1); %p
line1 = vertices1(:,2) - vertices1(:,1); %r
point2 = vertices2(:,1); %q
line2 = vertices2(:,2) - vertices2(:,1); %s

line1_cross_line2 = [0;0;1]'*cross([line1;0],[line2;0]);
line2_cross_line1 = [0;0;1]'*cross([line2;0],[line1;0]);
cross_difference1 = [0;0;1]'*cross([point2 - point1;0],[line2;0]);
cross_difference2 = [0;0;1]'*cross([point1 - point2 ; 0], [line1;0]);

index_line1 = cross_difference1 ./ line1_cross_line2;
index_line2 = cross_difference2 ./line2_cross_line1;

flag = false;

if line1_cross_line2 ~= 0 
    
    if index_line1>0 && index_line1<1 && index_line2>0 && index_line2<1

        flag = true;
    end

end

%The function should be able to handle any orientation of the edges (including
%both vertical and horizontal). Note that the ``overlap'' case needs to be
%checked up to floating-point precision.
