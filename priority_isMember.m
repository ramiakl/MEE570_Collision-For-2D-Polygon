%function [flag]=priority_isMember(pQueue,key)
%Check whether an element with a given key is in the queue or not.
function [flag]=priority_isMember(pQueue,key)

queue_size = size(pQueue,1);
flag = false;

if queue_size ~=0
    for i_queue = 1:queue_size
        if isequal(pQueue(i_queue,1).key,key)
            flag = true;
        end
    end
end

%Remember that the  key argument could be a number, a vector of numbers, a
%string, or any other arbitrary type. As such, you should use the Matlab function
%isequal to check for equality between keys (this function works for arbitrary
%types of variables, run  doc isequal on the Matlab prompt for details).
