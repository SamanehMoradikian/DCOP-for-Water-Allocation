function[t]=receiving_terminate(current_context,t,k,t_child,LB,UB,LC,d,lb_child,ub_child,maghadir_m1,n)
% fprintf('receiving_terminate')
global value
global terminate num_years
k;
    j=k;
        if current_context(j,1,n)==current_context(1,1,n)
            b=555;
            terminate(j,n)=1;
            t(j)=t_child(j,value(1,2,1),1);     
        end
     [t,~]=maintainThresholdInvariant(t,LB,UB,j);
       j;
      [~,~,~,t,~,~,~,~,~]=backtrack(t,UB,LB...
       ,current_context,j,LC,d,t_child,lb_child,ub_child,maghadir_m1,n);
end