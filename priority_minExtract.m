%function [pQueue,key,cost]=priority_minExtract(pQueue)
%Extract the element with minimum cost from the queue.
function [pQueue,key,cost]=priority_minExtract(pQueue)

queue_size = size(pQueue,1);

if queue_size == 0
    key = [];
    cost = [];
else

    cost_array = [pQueue.cost];
    [min_cost,index] = min(cost_array);
    key = pQueue(index,1).key;
    cost = min_cost;
    pQueue(index,:) = [];
    
end

 
% index = 1;

% if queue_size == 0
%     key = [];
%     cost = [];
% elseif queue_size == 1
%     key = pQueue(1,1).key;
%     cost = pQueue(1,1).cost;
%     pQueue(1,:) = [];
% else
%     for i_queue = 1:queue_size
%         if min_cost>pQueue(i_queue,1).cost
%             min_cost = pQueue(i_queue,1).cost;
%             index = i_queue;
%         end
% 
%     end
%     key = pQueue(index,1).key;
%     cost = pQueue(index,1).cost;
%     pQueue(index,:) = [];
% end
% 
% pQueue = pQueue;

