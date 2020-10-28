function [t,t_child,UB,LB,lb_child,ub_child,terminate,LC,d,current_context]=start(t,t_child,UB,LB,lb_child,ub_child,...
    terminate,LC,d,n,current_context)
global value agent_number teadade_gozine shomarande
value=zeros(agent_number,2,8);
% fprintf('start')
value(1,1:2,1)=1;
lb_child=zeros(agent_number,max(teadade_gozine(1,:)));
ub_child=zeros(agent_number,max(teadade_gozine(1,:)));
t_child=zeros(agent_number,max(teadade_gozine(1,:)));
t_child(2:4,:)=-10;
LC=zeros(agent_number,max(teadade_gozine(1,:)));
LC(:,:)=100;
UB=zeros(agent_number,1);
LB=zeros(agent_number,1);
t=zeros(agent_number,1);
t(:,:)=-10;
terminate(1:agent_number,n)=0;
d=zeros(agent_number,2);
UB(1:agent_number,1)=inf;
ub_child(:,:)=inf;

current_context(1:agent_number,1:agent_number,n)=0;
%   shomarande(:,1)=0;
end