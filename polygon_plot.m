%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.
function polygon_plot(vertices,style)

for i=1:length(vertices)-1
hold on
    p1 = vertices(:,i);                 
    p2 = vertices(:,i+1);               
    dp = p2-p1;                         
q(i) = quiver(p1(1),p1(2),dp(1),dp(2),0,style);
hold off
end

hold on
p1 = vertices(:,length(vertices));                 
p2 = vertices(:,1);               
dp = p2-p1;                       
q(length(vertices)-1) = quiver(p1(1),p1(2),dp(1),dp(2),0,style);
hold off


%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.
