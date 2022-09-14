%function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Checks whether a point $p$ is visible from a vertex $v$ of a polygon. In order
%to be visible, two conditions need to be satisfied: enumerate  point $p$ should
%not be self-occluded with respect to the vertex $v$\\ (see
%polygon_isSelfOccluded).  segment $p$--$v$ should not collide with  any of the
%edges of the polygon (see edge_isCollision). enumerate
function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)

flagPoints = true(1,size(testPoints,2));

vertices = [vertices(:,size(vertices,2)), vertices, vertices(:,1) ];
indexVertex = indexVertex+1;

for i_point = 1:size(testPoints,2)

    if polygon_isSelfOccluded(vertices(:,indexVertex),vertices(:,indexVertex-1),vertices(:,indexVertex+1), testPoints(:,i_point))
        flagPoints(i_point) = false;
    else

        for i_vertices = 2:size(vertices,2)-1
            
            if edge_isCollision([vertices(:,indexVertex), testPoints(:,i_point)],[vertices(:,i_vertices), vertices(:,i_vertices+1)])
            flagPoints(i_point) = false;
            end
        end
    end
end

% for i_points= 1:size(testPoints,2)
%     if indexVertex == 1
%         if polygon_isSelfOccluded(vertices(:,indexVertex), vertices(:,size(vertices,2)),vertices(:,indexVertex+1),testPoints(:,i_points))
%             flagPoints(i_points) = false;
%         end
% 
%     elseif indexVertex == size(vertices,2)
% 
%         if polygon_isSelfOccluded(vertices(:,indexVertex), vertices(:,indexVertex-1),vertices(:,1),testPoints(:,i_points))
%             flagPoints(i_points) = false;
%         end
%     else
%         if polygon_isSelfOccluded(vertices(:,indexVertex),vertices(:,indexVertex-1),vertices(:,indexVertex+1), testPoints(:,i_points))
% 
%             flagPoints(i_points) = false;
% 
%         end
%     end
% end

% for i_point = 1:size(testPoints,2)
% 
%     for i_vertices = 1:size(vertices,2)
% 
%         if i_vertices == size(vertices,2)
% 
%             if edge_isCollision ([vertices(:,indexVertex), testPoints(:,i_point)],[vertices(:,i_vertices), vertices(:,1)])
%                 flagPoints(i_point) = false;
%             end
%         else
% 
%              if edge_isCollision([vertices(:,indexVertex), testPoints(:,i_point)],[vertices(:,i_vertices), vertices(:,i_vertices+1)])
% 
%                  flagPoints(i_point) = false;
%              end
%         end
%     end
% end
% 



%Note that, with the definitions of edge collision and self-occlusion given in
%the previous questions, a vertex should be visible from the previous and
%following vertices in the polygon.