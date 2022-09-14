%function [pQueue]=priority_insert(pQueue,key,cost)
%Add an element to the queue.
function [pQueue]=priority_insert(pQueue,key,cost)

pQueue(end+1,1).key = key;
pQueue(end,1).cost = cost;

