function[t,k,t_child]=receiving_threshold(t,UB,LB...
       ,current_context,k,LC,d,t_child,lb_child,ub_child,maghadir_m1,n)
% fprintf('receiving_threshold')
global value num_years agent_number
global terminate
t;
ab=zeros(agent_number,1);
if k==1
    for j=2:agent_number
        t(j);
        t_child(j,value(k,2,1),k);
        if t(j)~=t_child(j,value(k,2,1),k)
            j;
            ab(j,1)=ab(j,1)+1;
        t(j)=t_child(j,value(k,2,1),k);
%         fprintf('taghire t az receiving threshold')
        end
    end
end
for j=1:agent_number
if ab(j,1)>=1
       [t,~]=maintainThresholdInvariant(t,LB,UB,j);
       [LB,UB,current_context,t,~,LC,t_child]=backtrack(t,UB,LB...
       ,current_context,j,LC,d,t_child,lb_child,ub_child,maghadir_m1,n);
end
end
end



