 function []=figures(formatted_decision,value_kol)
global noe_sal
global tule_dore
global abe_z %b surate abe_z(4,n,3) hastesh k safhe sevome baiangare shomare abkhane
% load value_kol
% load formatted_decision
% load noe_sal
tule_dore=20;
% %%
year = 1:tule_dore;
v = [year',formatted_decision];
xx= 0:tule_dore;
yy= 0:10;
%tabaghe bandie salha va ijade mattris haye type of the year
noe_sal2(:)=noe_sal(:);
dry=find(noe_sal2(:)==1);
normal=find(noe_sal2(:)==2);
wet=find(noe_sal2(:)==3);
a1=size(dry);
Dry=zeros(a1(1,1),2);

%% ABMANTAGHEI
%
Dry(1:a1(1,1),1)=dry(:,1);Dry(:,2)=formatted_decision(dry(:,1),1);
a2=size(normal);
Normal(1:a2(1,1),1)=normal(:,1);Normal(:,2)=formatted_decision(normal(:,1),1);
a3=size(wet);
Wet(1:a3(1,1),1)=wet(:,1);Wet(:,2)=formatted_decision(wet(:,1),1);

figure ('Name','Abmantaghei_Decisions','units','normalized','PaperSize',[18 10],'outerposition',[0 0 0.7 1]);
%color = [0.4,0.4,0.4;0.7,.7,0.7;1,1,1];

  s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
  s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
   s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   
   %Legend
    lgd=legend;%('Dry Years','Normal Years','Wet Years') 
    lgd.FontWeight='bold'; 
hold off;
grid on;  
axis equal;
axis([0 21 0 10]);
xlabel('Year','fontsize',20);
ylabel('Num. of Selected Scenario','fontsize',20);
title('Abmnataghei Decisions','fontsize',22);
set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
set(gca,'XTickLabel',xx);
set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
set(gca,'YTickLabel',yy);
box on
saveas(gcf,'Abmantaghei_Decisions','pdf')
%% Abofazelab, 
% **
figure ('Name','Abofazelab_Decisions','units','normalized');%'outerposition',[0 0 0.7 1]
for i=2:7 %amel haye abo fazelab az nahie 5 ta 22
Dry(:,2)=value_kol(i,2,1,dry(1,:))+4;
Normal(:,2)=value_kol(i,2,1,normal(1,:))+2;
a3=size(wet);
Wet(1:a3(1,1),1)=wet(:,1);
Wet(:,2)=value_kol(i,2,1,wet(1,:));
subplot(2,3,i-1);
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
    s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
%    lgd.FontWeight='bold';
   grid on
   box on
axis([0 21 0 7]);
yy=1:6;
xlabel('Year','fontsize',10);
ylabel('Num. of Selected Scenario','fontsize',10);
a=sprintf('Abofazelab %d Decisions',i);
title(a,'fontsize',10);
set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
set(gca,'XTickLabel',xx);
set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
set(gca,'YTickLabel',yy);
end
hold off
saveas(gcf,'Abofazelab_Decisions.pdf') 
% axis equal

%fgt yedune b onvane nemune 
figure ('Name','Abofazelab 2_Decisions','units','normalized','PaperSize',[18 10],'outerposition',[0 0 0.7 1])
Dry(:,2)=value_kol(2,2,1,dry(1,:))+4;
Normal(:,2)=value_kol(2,2,1,normal(1,:))+2;
Wet(:,2)=value_kol(2,2,1,wet(1,:));
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
   s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
    lgd.FontWeight='bold';
   grid on
axis([0 21 0 7]);
yy=1:6;
xlabel('Year','fontsize',10);
ylabel('Num. of Selected Scenario','fontsize',10);
a=sprintf('Abofazelab %d Decisions',2);
title(a,'fontsize',10);
set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
set(gca,'XTickLabel',xx);
set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
set(gca,'YTickLabel',yy)
axis equal
box on
saveas(gcf,'Abofazelab_agent2_Decisions.pdf')
%% Shahrdari
% 
figure ('Name','Shahrdari_Decisions','units','normalized','PaperSize',[18 10],'outerposition',[0 0 0.7 1])
for i=8:9 %amel haye abo fazelab az nahie 5 ta 22
Dry(:,2)=value_kol(i,2,1,dry(1,:))+4;
Normal(:,2)=value_kol(i,2,1,normal(1,:))+2;
 Wet(:,2)=value_kol(i,2,1,wet(1,:));
subplot(2,1,i-7);
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
   s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
%    lgd.FontWeight='bold';
   grid on
axis([0 21 0 7]);
yy=1:6;
xlabel('Year','fontsize',10);
ylabel('Num. of Selected Scenario','fontsize',10);
a=sprintf('Shardari nahie %d abkhan Decisions',i-7);
title(a,'fontsize',10);
set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
set(gca,'XTickLabel',xx);
set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
set(gca,'YTickLabel',yy);
box on
end
hold off

saveas(gcf,'Shahrdari_Decisions.pdf')
%% Keshavarzan
% **
figure ('Name','Keshavarzi_Decisions','units','normalized','PaperSize',[18 10],'outerposition',[0 0 0.7 1])
for i=10:11 %amel haye abo fazelab az nahie 5 ta 22
Dry(:,2)=value_kol(i,2,1,dry(1,:))+4;
Normal(:,2)=value_kol(i,2,1,normal(1,:))+2;
% Wet(:,2)=value_kol(i,2,1,wet(1,:));
subplot(2,1,i-9);
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
   s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
   lgd.FontWeight='bold';
   grid on
   yy=1:6;
axis([0 21 0 7]);
xlabel('Year','fontsize',10);
ylabel('Num. of Selected Scenario','fontsize',10);
a=sprintf('Keshavarzi nahie %d abkhan Decisions',i-9);
title(a,'fontsize',10);
set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
set(gca,'XTickLabel',xx);
set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
set(gca,'YTickLabel',yy);
box on
end
hold off
saveas(gcf,'Keshavarzi_Decisions.pdf')
%% Sanat
% **
figure ('Name','Sanat_Decisions','units','normalized','PaperSize',[18 10],'outerposition',[0 0 0.7 1])
for i=13:15 %amel haye abo fazelab az nahie 5 ta 22
Dry(:,2)=value_kol(i,2,1,dry(1,:))+4;
Normal(:,2)=value_kol(i,2,1,normal(1,:))+2;
 Wet(:,2)=value_kol(i,2,1,wet(1,:));
if i==13
subplot(2,2,[1,2]);
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
    s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
    lgd.FontWeight='bold';
   grid on 
   yy=1:6;
    axis([0 21 0 7]);
    xlabel('Year','fontsize',10);
    ylabel('Num. of Selected Scenario','fontsize',10);
    a=sprintf('Sanat nahie %d abkhan Decisions',i-12);
    title(a,'fontsize',10);
    set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
    set(gca,'XTickLabel',xx);
    set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
    set(gca,'YTickLabel',yy);
    box on
else
subplot(2,2,i-11);
   s=scatter(Dry(:,1),Dry(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.3,0.3,0.3],'DisplayName', 'Dry Years'); 
   s.LineWidth=1.4;
   hold on
   s=scatter(Normal(:,1),Normal(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0.7,.7,0.7],'DisplayName', 'Normal Years');
   s.LineWidth=1.4;
   hold on
   s=scatter(Wet(:,1),Wet(:,2),100,'square','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[1,1,1],'DisplayName', 'Wet Years');
   s.LineWidth=1.4;
   %Legend
   lgd=legend('location','best');
    lgd.FontWeight='bold';
   grid on
   yy=1:6;
    axis([0 21 0 7]);
    xlabel('Year','fontsize',10);
    ylabel('Num. of Selected Scenario','fontsize',10);
    a=sprintf('Sanat nahie %d abkhan Decisions',i-12);
    title(a,'fontsize',10);
    set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
    set(gca,'XTickLabel',xx);
    set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
    set(gca,'YTickLabel',yy);
    box on
end
end
hold off
saveas(gcf,'Sanaat_Decisions.pdf')

%% Type of The Year
% **
% %% Type of the years
% figure ('Name','Type of the Years','units','normalized','outerposition',[0 0 0.7 1]);
% v1=zeros(tule_dore,2);
% for m=1:tule_dore
%   v1(m,1)=m;  
%   v1(m,2)=noe_sal(m);  
% end   
% color = [ 1,0,0;0,1,0;0,0,1];
% for i = 1:tule_dore
%     s1=scatter(v1(i,1),v1(i,2),80,color(noe_sal(i),:),'filled');
%     s1.LineWidth=2;
%     hold on;
% end
% hold off;
% grid on;
% xlabel('Year','fontsize',20);
% ylabel('Type of the Years','fontsize',20);
% ylim([0 3]);
% title('Type of the Years','fontsize',22);
% xx= 0:tule_dore+1;
% yy= 1:3;
% yyy=[{'Dry','Normal','Wet'}];
% set(gca,'XTick',xx);%gca va gcf yani current plot and current figure 
% set(gca,'XTickLabel',xx);
% set(gca,'YTick',yy);%gca va gcf yani current plot and current figure 
% set(gca,'YTickLabel',yyy);
% 

% %% abo fazelab
% 



%% abe zirzzamini
% fid = fopen("toPlotInPython.txt",'w');
% figure ('Name','First Aquifer','units','normalized','outerposition',[0 0 0.7 1]);
% v1=zeros(tule_dore,3);
% for m=1:tule_dore 
%   v1(m,2)=abe_z(1,m,1); %abkhane aval 
%   v1(m,3)=abe_z(1,m,2); %abkhane dovom 
%   v1(m,4)=abe_z(1,m,3); %abkhane sevom
% end
% fprintf(fid,"Year  Annual_type  1st_Aquifer  2nd_Aquifer  3rd_Aquifer \n");
% fprintf(fid,"%d    %d         %f  %f  %f \n",[[1:tule_dore]; noe_sal; v1(:,2:4)']);
% fclose(fid);
% for i = 1:tule_dore
%     gw=bar(v1);
%     gw(1).FaceColor =[ 1,0,0];
% % plot::hatch(gw);
%     hold on;
% end
% end 




% vaghtike esme save shdode mikhahim k moteghaier bashad