function[LB,UB,current_context,k,t_child,ub_child,lb_child]=sending_cost(current_context,lb_child,ub_child,...
terminate,maghadir_m1,LB,UB,k,t_child,t,LC,d,n)
global value num_years noe_sal teadade_gozine agent_number shomarande
    %%%%%%%%%%%%%%% 
%     fprintf('sending_cost')
%     k
%     samaneh=sum(shomarande(:,1))
    if k==2
       shomarande(:,1)=0;
       shomarande(k,1)=1;        
    end
    value(1,1);
    d(1,1);
    a=0;
    
 if terminate(k,n)~=1   
  for j=1
         if  ub_child(k,value(j,2,1),j)~=UB(k) || lb_child(k,value(j,2,1),j)~=LB(k)
            % fprintf('    taghir lb_chilf va ub_child az sending cost   ')
         ub_child(k,value(j,2,1),j)=UB(k);
         lb_child(k,value(j,2,1),j)=LB(k);
             a=a+1;
             ub_child(k,value(j,2,1),j);
             lb_child(k,value(j,2,1),j);
         end
  end
 
 if a>=1
   [t,~,k,t_child]=maintainChildrenThresholdInvarient(t,1,k,t_child,LB,UB);
 end
LB1=zeros(2,1);
UB1=LB1;

[t,~]=maintainThresholdInvariant(t,LB,UB,1);
   if a>=1 
        
        sum_shomarande=sum(shomarande(:));
%         if sum(shomarande(:))>=16
LB(1);
UB(1);
t(1);
            [t,~]=maintainThresholdInvariant(t,LB,UB,1);
         [LB,UB,current_context,~,~,~,t_child]=backtrack(t,UB,LB...
       ,current_context,1,LC,d,t_child,lb_child,ub_child,maghadir_m1,n);
%         end
    end  
  end
end
%%
function [t,m,k,t_child]=maintainChildrenThresholdInvarient(t,m,k,t_child,LB,UB)
global value num_years agent_number
% fprintf('  maintainChildrenThresholdInvarient  ')
  if m==1
     for i=1:agent_number 
         i;
           if LB(i)>t_child(i,value(m,2,1),m)
              t_child(i,value(m,2,1),m)=LB(i);
              t_child(:,:,m);
            % fprintf('taghire t_child az LB')
           end
           if UB(i)<t_child(i,value(m,2,1),m)
              t_child(i,value(m,2,1),m)=UB(i);
              t_child(:,:,m);
             % fprintf('taghire t_child az UB')
           end
     end
  end
end