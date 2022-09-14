%function polygon_isVisible_test()
%This function should perform the following operations: enumerate  an array 
%testPoints with dimensions [ 2 $ $  5] containing points generated uniformly at
%random using rand and scaled to approximately occupy the rectangle $[0,5]
%[-2,2]$ (i.e., the $x$ coordinates of the points should fall between $0$ and
%$5$, while the $y$ coordinates between $-2$ and $2$).  the coordinates 
%vertices1 and  vertices2 of two polygons from twolink_polygons.  two  logical
%vectors  flag1 and  flag2 by calling polygon_isVisible using  testPoints and,
%respectively,  vertices1 and  vertices2 as argument. item:test-polygon For each
%polygon  vertices1,  vertices2, display a separate figure using the following:
%enumerate  the array  testPointsWithPolygon by concatenating  testPoints with
%the coordinates of the polygon (i.e., the coordinates of the polygon become also
%test points).  the polygon (use polygon_plot). item:test-visibility For each
%vertex $v$ in the polygon: enumerate  the visibility of each point in 
%testPointsWithPolygon with respect to that polygon (using polygon_isVisible). 
%lines from the vertex $v$ to each point in  testPointsPolygon according in green
%if the corresponding point is visible, and in red otherwise. enumerate enumerate
% the order of the vertices in  vertices1,  vertices2 using the function fliplr. 
%item item:test-polygon above with the reversed edges. enumerate
function polygon_isVisible_test()

for j_col = 1:5
        testPoints(:,j_col) = [5*rand(); 4*rand()-2];
end

[vertices1,vertices2] = twolink_polygons;

vertices1 = fliplr(vertices1);
vertices2 = fliplr(vertices2);

%% Polygon1
figure(1)
testPointsWithPolygon = [testPoints,vertices1];


flag = zeros(length(vertices1),length(testPointsWithPolygon));
for i_vertex = 1:length(vertices1)

    flag(i_vertex,:) = polygon_isVisible(vertices1,i_vertex,testPointsWithPolygon);

end

hold on
for i_vertex = 1:length(vertices1)
    for i_point = 1:length(testPointsWithPolygon)
        if flag(i_vertex,i_point) == 0

            plot([vertices1(1,i_vertex) , testPointsWithPolygon(1,i_point) ], [vertices1(2,i_vertex), testPointsWithPolygon(2,i_point)],'r','LineWidth',1)
        else
            plot([vertices1(1,i_vertex) , testPointsWithPolygon(1,i_point) ], [vertices1(2,i_vertex), testPointsWithPolygon(2,i_point)],'g','LineWidth',1)
        end
    end
end
polygon_plot(vertices1,'b')

%% polygon 2
hold off
figure(2)
testPointsWithPolygon = [testPoints,vertices2];


flag = zeros(length(vertices2),length(testPointsWithPolygon));
for i_vertex = 1:length(vertices2)

    flag(i_vertex,:) = polygon_isVisible(vertices2,i_vertex,testPointsWithPolygon);

end
hold on
for i_vertex = 1:size(vertices2,2)

    for i_point = 1:size(testPointsWithPolygon,2)

        if flag(i_vertex,i_point) == 0
            plot([vertices2(1,i_vertex) , testPointsWithPolygon(1,i_point) ], [vertices2(2,i_vertex), testPointsWithPolygon(2,i_point)],'r','LineWidth',1)
        else
            plot([vertices2(1,i_vertex) , testPointsWithPolygon(1,i_point) ], [vertices2(2,i_vertex), testPointsWithPolygon(2,i_point)],'g','LineWidth',1)
        end
    end

end
polygon_plot(vertices2,'b')

%The function should display four separate figures in total, each one with a
%single polygon and lines from each vertex in the polygon, to each point.
