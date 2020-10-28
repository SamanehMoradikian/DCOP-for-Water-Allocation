clc
clear all
% function []=figures2(formatted_decision)
% global noe_sal
global tule_dore
global abe_z %b surate abe_z(4,n,3) hastesh k safhe sevome baiangare shomare abkhane
noe_sal=[1,1,2,2,2,2,2,2,2,1,3,3,3,3,3,2,2,2,3,2];
formatted_decision=[8;8;6;6;6;6;6;6;6;8;1;1;1;1;1;6;6;6;1;6];
% %%
year = 1:tule_dore;
v = [year',formatted_decision,noe_sal'];
xx= 0:tule_dore+1; 
yy= 0:10;

%abmantaghei
% for i=1:tule_dore
%     if noe_sal(i)==1
%         dry=dry+1;
%     elseif noe_sal(i)==2
%         normal=normal+1;
%     else
%         wet=wet+1;
%     end
% end
% Dry=zeros(dry,3);
% Normal=zeros(normal,3);
% Wet=zeros(wet,3);
% for i=1:tule_dore
%     if noe_sal(i)==1
%       Dry( )=v(i,  
noe_sal2(:)=noe_sal(:);
dry=find(noe_sal2(:)==1);
normal=find(noe_sal2(:)==2);
wet=find(noe_sal2(:)==3);
a1=size(dry);

Dry=zeros(a1(1,1),2);
Dry(1:a1(1,1),1)=dry(:,1);Dry(:,2)=formatted_decision(dry(:,1),1);
a2=size(normal);
Normal(1:a2(1,1),1)=normal(:,1);Normal(:,2)=formatted_decision(normal(:,1),1);
a3=size(wet);
Wet(1:a3(1,1),1)=wet(:,1);Wet(:,2)=formatted_decision(wet(:,1),1);
% end
figure ('Name','Abmantaghei_Decisions','units','normalized','outerposition',[0 0 0.7 1]);
color = [0.4,0.4,0.4;0.7,.7,0.7;1,1,1];
% color_edge=[ 0,0,0;0.3,.3,0.3;0.3,0.3,0.3];
%[0,0,0]
%color_edge(noe_sal(i),:)
    
    s=scatter(Dry(:,1),Dry(:,2),80,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.4,0.4,0.4],'DisplayName', 'Dry Years');
    s.LineWidth=1;     
%    legend('Dry Years') 
   hold on
   s=scatter(Normal(:,1),Normal(:,2),80,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Dry Years');
   hold on
   s=scatter(Wet(:,1),Wet(:,2),80,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Dry Years');
   grid on
   legend('Dry Years','Normal Years','Wet Years')
%     legend=['Dry Years', 'Normal Years', 'Wet Years','Location','Best'];
%     hold on;

% ['Dry Years', 'Normal Years', 'Wet Years','Location','Best')

hold off;