function[t,k,t_child,lb_child,ub_child,current_context]=mainAllocativeInvarient(t,UB,LB...
       ,current_context,terminate,k,LC,d,t_child,lb_child,ub_child,maghadir_m1,n)
 global value agent_number
%   fprintf('mainAllocativeInvarient')
  k;
  t(k);
  ab=0;aa=0; 
 if k==1 
 for s=1:agent_number  
 if t_child(s,value(k,2,1),k)~=t(k)
     ab=ab+1;
        if t(k)>LC(k,value(k,2,1))+sum(t_child(k+1:agent_number,value(k,2,1),k))           
            for m=2:agent_number
              if aa==0
              if ub_child(m,value(k,2,1))>t_child(m,value(k,2,1),k) 
              t_child(m,value(k,2,1),k)=t(k)-(LC(k,value(k,2,1))+sum(t_child(m:agent_number,value(k,2,1),k)))+t_child(m,value(k,2,1),k);
                  aa=1;  
              end
             end  
            end
       elseif t(k)<LC(k,value(k,2,1))+sum(t_child(k+1:agent_number,value(k,2,1),k))
          ab=ab+1;  
            for m=1:agent_number
              if aa==0
              if ub_child(m,value(k,2,1),k)>t_child(m,value(k,2,1),k) 
              t_child(m,value(k,2,1),k)=t(k)-(LC(k,value(k,2,1))+sum(t_child(m:agent_number,value(k,2,1),k)))+t_child(m,value(k,2,1),k);
                  aa=1;  
              end
             end  
            end
        end         
 end
 end
end

if ab>=1
      [t,k,t_child]=receiving_threshold(t,UB,LB...
       ,current_context,k,LC,d,t_child,lb_child,ub_child,maghadir_m1,n); 
end
end 