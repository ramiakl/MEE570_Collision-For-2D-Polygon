
%function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Checks whether the a point is in collsion with a polygon (that is, inside for a
%filled in polygon, and outside for a hollow polygon).
function [flagPoints]=polygon_isCollision(vertices,testPoints)

flagPoints = true(1,size(testPoints,2));

flag = zeros(size(vertices,2),size(testPoints,2));

for i_vertex = 1:size(vertices,2)

    flag(i_vertex,:) = polygon_isVisible(vertices,i_vertex,testPoints);

end


for i_vertex = 1:size(vertices,2)
    
    for j_point = 1:size(testPoints,2)

        if flag(i_vertex,j_point) == 1
            flagPoints(j_point) = false;
        end
    end
end
