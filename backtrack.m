function[LB,UB,current_context,t,k,LC,t_child,lb_child,ub_child,d]=backtrack(t,UB,LB...
       ,current_context,k,LC,d,t_child,lb_child,ub_child,maghadir_m1,n)

%     fprintf('backtrackz') 
global value   agent_number Z_m sarane_shorb
global terminate num_years zarib_abfa w
global jarime shomarande pasab_p gw_p w_p 
zarib_abfa=[0.5,6,1.3,0.3];
% fprintf('backtrack')
k ;

value;
w_p=4    ;gw_p=5    ;pasab_p= 4; 
z=zeros(2,num_years);

[UB,LB,LC]=Local_Cost(lb_child,ub_child,maghadir_m1,k,LC,UB,LB,current_context,n);
 LB3(1,1)=LC(k,1);
 LB3(1,2)=LC(k,2);
%  LB3(1,3)=UB(k);
%  LB3(1,4)=LB(k);
if k==1
samaneh(1:4)=[k,LC(k,1),LC(k,2),value(1,1)] ;
else
 samaneh(1:3)=[k,LC(k,1),LC(k,2)];    
 LB3;
end
%  LB3(3,1)=t(k);
%  LB3(4,1)=d(k,2);
%  LB3(5,1)=value(k,2,1);
%  LB3(6,1)=maghadir_m1(k,1,1,1);
%  LB3(7,1)=maghadir_m1(k,2,1,1);
 LB3;
d;

if k==1

[d,LB,UB,~,~]=find_d(d,LC,LB,UB,lb_child,ub_child,k,n);
% salman=d(k,:)
% salman2=LC(k,:)
% t(k,:)
value(1:17,1:2,1);
else
 [d,LB,UB]=find_d(d,LC,LB,UB,lb_child,ub_child,k,n);
 if k==1
 LB3(1,1)=LB(k);
 LB3(2,1)=UB(k);
 LB3(3,1)=t(k);
 LB3(4,1)=d(k,2);
 LB3(5,1)=value(k,2,1);
 LB3(6,1)=maghadir_m1(k,1,1,1);
 LB3(7,1)=maghadir_m1(k,2,1,1);
 LB3;
 end
end
d;
aa=0; % aa moteghaieri ast k dar surate taghire meghdare moteghaier, meghdar
% migirad va dar surate taghire moteghaier b ma ejaze midahad dobare
% paiamhaye value va ... ersal mishavad

% if k==4
% d2=d(k,2)
% value(k,1,:)
% maghadir_m1(k,d(k,2),:)
% end
  if t(k)==UB(k)
    if value(k,1,1)~=maghadir_m1(k,d(k,2),1,n)||value(k,1,2)~=maghadir_m1(k,d(k,2),2,n)||value(k,1,3)~=maghadir_m1(k,d(k,2),3,n)...
     ||value(k,1,4)~=maghadir_m1(k,d(k,2),4,n)||value(k,1,5)~=maghadir_m1(k,d(k,2),5,n)||value(k,1,6)~=maghadir_m1(k,d(k,2),6,n)
     value(k,1,1:6); 
     d2=d(k,2);
    LB2=LB(k);
      value(k,1,1:6)=maghadir_m1(k,d(k,2),1:6,n);
      if maghadir_m1(k,1,1,n)~=maghadir_m1(k,2,1,n)
      value(k,2,1)=find(maghadir_m1(k,:,1,n)==value(k,1,1));
      elseif maghadir_m1(k,1,3,n)~=maghadir_m1(k,2,3,n)
      value(k,2,1)=find(maghadir_m1(k,1:2,3,n)==value(k,1,3)); 
      elseif maghadir_m1(k,1,1,n)==maghadir_m1(k,2,1,n)
      value(k,2,1)=1;    
      elseif k==12||k==13||k==16||k==18
      value(k,2,1)=1;    
      end
      if k==1
       fprintf('taghire value1')
      end
      value(:,:,1);
      if k~=1||k~=17
         current_context(k,k,n)=value(k,1,1);        
      end
    aa=aa+1;  
    end
  elseif LB(k)>t(k)
%       fprintf(' lower bound bozorgtar az treshold')
     if value(k,1,1)~=maghadir_m1(k,d(k,1),1,n)||value(k,1,2)~=maghadir_m1(k,d(k,1),2,n)||value(k,1,3)~=maghadir_m1(k,d(k,1),3,n)...
         ||value(k,1,4)~=maghadir_m1(k,d(k,1),4,n)||value(k,1,5)~=maghadir_m1(k,d(k,1),5,n)||value(k,1,6)~=maghadir_m1(k,d(k,1),6,n)||...
      value(k,1,7)~=maghadir_m1(k,d(k,1),7,n)
     aa=aa+1;        
      value(k,1,:)=maghadir_m1(k,d(k,1),:,n);
      if maghadir_m1(k,1,1,n)~=maghadir_m1(k,2,1,n)      
      value(k,2,1)=find(maghadir_m1(k,:,1,n)==value(k,1,1));
      elseif maghadir_m1(k,1,3,n)~=maghadir_m1(k,2,3,n)
      value(k,2,1)=find(maghadir_m1(k,:,3,n)==value(k,1,3));    
      else
      value(k,2,1)=d(k,1);    
      end   
      if k==1
%        fprintf(' taghire value2    ')
      end
      if k~=1
      current_context(k,k,n)=value(k,1,1);
      end
      end
  end %end marbut b ebtedate if UB(k)==t(k)
  %taghire meghdar tamum shod
  
  value(:,:,1);
 if k~=17 && aa>=1
   if k==1
       shomarande(:,1)=0;
   end
   [UB,LB,LC]=Local_Cost(lb_child,ub_child,maghadir_m1,k,LC,UB,LB,current_context,n);
   [current_context,t,LC,LB,UB,d,ub_child,t_child,lb_child]=coming_value(current_context,...
    t,LB,UB,lb_child,ub_child,LC,t_child,maghadir_m1,d,n,k) ;
   [d,LB,UB]=find_d(d,LC,LB,UB,lb_child,ub_child,k,n); 
 end
 
  if k==1
   for m=k+1:agent_number   
    if current_context(m,1,1,n)~=value(k,1,1)||current_context(m,1,3,n)~=value(k,1,3)||current_context(m,1,4,n)~=value(k,1,4)||...
       current_context(m,1,5,n)~=value(k,1,5) ||current_context(m,1,6,n)~=value(k,1,6)||current_context(m,1,7,n)~=value(k,1,7)    
          shomarande(:,1)=0;
value(:,:,1);
        [current_context,t,LC,LB,UB,d,ub_child,t_child,lb_child]=coming_value(current_context,...
    t,LB,UB,lb_child,ub_child,LC,t_child,maghadir_m1,d,n,k);
    end
  end
  end
 
%%
if k==1
    if terminate(k,n)==0
[t,k,t_child,lb_child,ub_child,~]=mainAllocativeInvarient(t,UB,LB...
       ,current_context,terminate,k,LC,d,t_child,lb_child,ub_child,maghadir_m1,n);
    end
end
t;
UB;
k;
  if t(k)==UB(k)
       if terminate(k,n)==1 || k==1
           terminate(k,n)=1;
           if k==1
             for m=2:agent_number
               terminate(m,n)=1;
%                fprintf('amele bala  b pasokh reside dar backtrack')
               [t,]=receiving_terminate(current_context,t,m,t_child,LB,UB,LC,d,lb_child,ub_child,maghadir_m1,n);
             end
%             pause(2)
%             fprintf('paian')
           end
       end 
  end
  if terminate(k,n)~=1
    if k~=1  
        shomarande(k,1)=1;
      [LB,UB,~,k,t_child,ub_child,lb_child]=sending_cost(current_context,lb_child,ub_child,...
       terminate,maghadir_m1,LB,UB,k,t_child,t,LC,d,n) ;
    end
  end
end
%% 
function [UB,LB,LC]=Local_Cost(lb_child,ub_child,maghadir_m1,k,LC,UB,LB,current_context,n)
global sanat value teadade_gozine sath S_G keshavarzi_potansiel w beta tule_dore abe_z
global abman niaze_sabz noe_sal zarib_z shorb_nahie hazine_tabligh jarime  pasab_p gw_p w_p sarane_shorb Z_m
global enteghali2_1 enteghali3_1 enteghali3_2 loss_rate ab majmue_bardasht
[~,~,~,~,PSTP,PGTP,POT,POTG,PIN,~,PRR,~,PRW,PEE1,PEE2,PEE3,~]=taene_gheimat(n,sarane_shorb);
% fprintf('local cost  1  ')
z=zeros(2,1);
if k==1
    if noe_sal(n)==3
 max_taghzie(n)=max(abman(1:4,11,1,n))+max(abman(1:4,11,8,n))+max(abman(1:4,11,9,n))+max(abman(1:4,11,10,n)); 
 min_taghzie(n)=min(abman(1:4,11,1,n))+min(abman(1:4,11,8,n))+min(abman(1:4,11,9,n))+min(abman(1:4,11,10,n));
    elseif noe_sal(n)==2 || noe_sal(n)==1
 max_taghzie(n)=max(abman(1:3,11,1,n))+max(abman(1:3,11,8,n))+max(abman(1:3,11,9,n))+max(abman(1:3,11,10,n)); 
 min_taghzie(n)=min(abman(1:3,11,1,n))+min(abman(1:3,11,8,n))+min(abman(1:3,11,9,n))+min(abman(1:3,11,10,n));       
    end
 max_keshavarzi=max(sum(abman(1,9:10,1,n)),sum(abman(2,9:10,1,n))); 
 max_keshavarzi=max(max_keshavarzi,sum(abman(3,9:10,1,n)));
 min_keshavarzi=min(sum(abman(1,9:10,1,n)),sum(abman(2,9:10,1,n)));
 min_keshavarzi=min(min_keshavarzi,sum(abman(3,9:10,1,n)));
  for j=1:teadade_gozine(1,noe_sal(n))       
LC(k,j)= +w(3)*(sum(abman(j,9:10,1,n))-min_keshavarzi)/(max_keshavarzi-min_keshavarzi)...%keshavarzi
 +w(4)*(sum(sanat(1:2))-sum(abman(j,13:14,1,n)) + sum(abman(j,13:14,3,n)))/(sum(sanat(1:2)))... %sanat 
  -w(5)*((abman(j,11,1,n)+abman(j,11,8,n)+abman(j,11,9,n)+abman(j,11,10,n)-min_taghzie(n))/(max_taghzie(n)-min_taghzie(n)))... %taghzie        
 +w(1)*((sum(abman(j,1:6,1,n))-0.95*sum(shorb_nahie(1:6,n)))/(0.05*sum(shorb_nahie(1:6,n))))...%abfa
 +w(2)*(((abs(abman(j,7,1,n)-(niaze_sabz(1,1)+0.5*(sum(niaze_sabz(1,2:3))))))/(sum(niaze_sabz(1,1:3))-niaze_sabz(1,1)))+...
 (abs(abman(j,8,1,n)-(niaze_sabz(2,1)+0.5*(sum(niaze_sabz(2,2:3))))))/(sum(niaze_sabz(2,1:3))-niaze_sabz(2,1)));%shahrdari
  end 
Samaneh1=LC(k,:); 
a1=min(LC(k,1:teadade_gozine(1,noe_sal(n))));bb=0;cc=zeros(1,teadade_gozine(1,noe_sal(n)));

 dd=zeros(teadade_gozine(k,noe_sal(n)),1); 
for ii=1:teadade_gozine(k,noe_sal(n))-1 
    for jj=ii+1:teadade_gozine(k,noe_sal(n))
  if LC(k,ii)==LC(k,jj)
   dd(ii)=1;
   dd(jj)=1;     
  end
    end
end   
  
if sum(dd(:))>=2 
    for j=1:teadade_gozine(k,noe_sal(n))
        if dd(j)==1
   bardashte_abe_zirzamini(1,j)=sum(abman(j,9:10,3,n))+sum(abman(j,13:15,3,n))+sum(abman(j,1:6,3,n))+sum(abman(j,8:9,3,n))... 
   -abman(j,11,3,n); 
        else
   bardashte_abe_zirzamini(1,j)=1000;        
        end
    end
   
    samaneh2=bardashte_abe_zirzamini(1,:);
    min_b=min(bardashte_abe_zirzamini(1,:));
    bbb=0;
    for j=1:teadade_gozine(1,noe_sal(n))
     if bardashte_abe_zirzamini(1,j)==min_b
      bbb=bbb+1;
     end
    end
     if bbb==1
    min_j=find(bardashte_abe_zirzamini(1,:)==min_b);
    LC(k,min_j)=LC(k,min_j)-0.0002; 
%       fprintf('kam shodane LC ba tasavi')  
     elseif bbb>1
     min_j=find(bardashte_abe_zirzamini(1,:)==min_b);
     LC(k,min_j(1))=LC(k,min_j(1))-0.0002;
%       fprintf('kam shodane LC ba tasavi22222')
     end
end
Samaneh1=LC(k,:);


  
%keshavarzi..................................
elseif k==11||k==10
    eff1 = 5352;eff2 = 3840;eff3 = 12000;
%mizan gandom tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m1 = 0.630;
%mizan jo tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m2 = 0.700;
%mizan yonje tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m3 = 1.090;
     DG=0.46; DJ=0.34;DY=0.18;%sahm az kole arazi
     ABDG=7276.5;ABDJ=6440;ABDY=7630;%nesbate ab b daramad
   [Fa_gr_pr1,Fa_gr_pr2,Fa_gr_pr3]=keshavarzi(n);
     max_ekhtelaf=abs(maghadir_m1(k,1,3,n)-abman(value(1,2,1),k-1,3,n));
   for j=2:teadade_gozine(k,noe_sal(n))
       if abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))> max_ekhtelaf
      max_ekhtelaf=abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n));
       end
   end
   for j=1:teadade_gozine(k,noe_sal(n)) 
         
LC(k,j)=+jarime(3)*(abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf)+...%bakhshe nashi az kole system
    beta(3)*(((maghadir_m1(k,j,2,n)*POT(n) +maghadir_m1(k,j,3,n)*POTG(n)...
   + maghadir_m1(k,j,3,n)*PEE1(1,n)*Z_m(k-9,n))/ ...
   (maghadir_m1(k,j,2,n)*POT(n)+POTG(n)*(keshavarzi_potansiel(k-9)-maghadir_m1(k,j,2,n))...
   +(keshavarzi_potansiel(k-9)-maghadir_m1(k,j,2,n))*PEE1(1,n)*Z_m(k-9,n)))...
    -(((DG*maghadir_m1(k,j,1,n)*Fa_gr_pr1(1,n)*Fa_gr_m1+...%daramad e hasel az forush
    DJ*maghadir_m1(k,j,1,n)*Fa_gr_pr2(1,n)*Fa_gr_m2+ DY*maghadir_m1(k,j,1,n)*Fa_gr_pr3(1,n)*Fa_gr_m3)))...
    /((DG*Fa_gr_pr1(1,n)*Fa_gr_m1 + DJ*Fa_gr_pr2(1,n)*Fa_gr_m2 + DY*Fa_gr_pr3(1,n)*Fa_gr_m3)*(keshavarzi_potansiel(k-9))));     
   end
  
%sanat..................................    
elseif k==15||k==16||k==14
    %peida kardane bishtarin ekhtelaf beine gozineha
    max_ekhtelaf= abs(maghadir_m1(k,1,3,n)-abman(value(1,2,1),k-1,3,n));
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf< abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))
        max_ekhtelaf= abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n));
        end
    end
    
 for j=1:teadade_gozine(k,noe_sal(n))
     if max_ekhtelaf~=0
    LC(k,j)=(beta(4)*(PRW(1,n)*(maghadir_m1(k,j,7,n)+maghadir_m1(k,j,4,n))+(PIN(1,n)+PEE2(1,n)*Z_m(k-13,n))*maghadir_m1(k,j,3,n)))/...
       ((PIN(1,n)+PEE2(1,n)*Z_m(k-13,n))*sanat(k-13))... 
     + jarime(4)*abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf;
     elseif max_ekhtelaf==0
         LC(k,j)=(beta(4)*(PRW(1,n)*(maghadir_m1(k,j,7,n)+maghadir_m1(k,j,4,n))+(PIN(1,n)+PEE2(1,n)*Z_m(k-13,n))*maghadir_m1(k,j,3,n)))/...
       ((PIN(1,n)+PEE2(1,n)*Z_m(k-13,n))*sanat(k-13));
     end
 end      
%shahrdari...................     

elseif k==9||k==8 
        max_ekhtelaf= abs(maghadir_m1(k,1,1,n)-abman(value(1,2,1),k-1,1,n));
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf<abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n))
        max_ekhtelaf= abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n));
        end
    end
    
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf~=0
LC(k,j)=beta(2)*(PRR(1,n)*maghadir_m1(k,j,4,n)+POTG(1,n)*maghadir_m1(k,j,3,n)+PEE1(1,n)*maghadir_m1(k,j,3,n)*Z_m(k-7,n))/...
    (sum(niaze_sabz(k-7,1:3))*PRR(1,n))+...
    jarime(2)*(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf;
        elseif max_ekhtelaf==0
 LC(k,j)=beta(2)*(PRR(1,n)*maghadir_m1(k,j,4,n)+POTG(1,n)*maghadir_m1(k,j,3,n)+PEE1(1,n)*maghadir_m1(k,j,3,n)*Z_m(k-7,n))/...
    (sum(niaze_sabz(k-7,1:3))*PRR(1,n));
        end       
    end
%abfa............................
elseif k==2||k==3||k==4||k==5||k==6||k==7
    
         max_ekhtelaf= abs(maghadir_m1(k,1,1,n)-abman(value(1,2,1),k-1,1,n));
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf< abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n))
        max_ekhtelaf= abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n));
        end
    end    
    
       max_bardasht=max(maghadir_m1(k,1:2,3,n));    
        
  for j=1:teadade_gozine(k,noe_sal(n))   
      
%    [C1,C2,C3]=keifi_abfa(n,tule_dore,j,maghadir_m1);
%    C1_k(j,n)=C1(1,(n-1)*52+52) ;
%    C2_k(j,n)=C2(1,(n-1)*52+52) ;
%    C3_k(j,n)=C3(1,(n-1)*52+52);
      
 z(j)=jarime(1)*abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf...
      +beta(1)*((hazine_tabligh*maghadir_m1(k,j,6,n)...
      -w_p*abs(shorb_nahie(k-1)*(1+loss_rate)-maghadir_m1(k,j,1,n))...
      +PGTP(1,n)*maghadir_m1(k,j,3,n)+PSTP(1,n)*maghadir_m1(k,j,5,n))/(PSTP(1,n)*maghadir_m1(k,j,5,n)+hazine_tabligh...
     + PGTP(1,n)*max_bardasht)); 
    if k==2 && k==6&& k==5
     z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(1,n))/(PEE3(1,n)*max_bardasht*Z_m(1,n));  
     
     elseif k==3&&k==4     
     z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(2,n))/(PEE3(1,n)*max_bardasht*Z_m(2,n)); 
     
    elseif k==7
    z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(3,n))/(PEE3(1,n)*max_bardasht*Z_m(3,n)); 
    
    end    
  end
  
  for j=1:teadade_gozine(k,noe_sal(n))
    LC(k,j)=abs(z(j));  
  end
 if n==3
     k;
    samaneh=LC(k,1:2) ;
 end
   
%organ haye gheire tasmim girande ..............................   
elseif k==13||k==12||k==18
     LC(k,1:2)=1;
     
%ostandari............................................
elseif k==17
     a=222222;
    current_context(k,1:16,1,n);
 if current_context(k,[1:7,12:16],1,n)~=0 
%       fprintf('samanehhhhhhhhh')
 oftb=majmue_bardasht;  
majmue_bardasht(1,n)=maghadir_m1(2,value(2,2,1),3,n)+maghadir_m1(6,value(6,2,1),3,n)+...
0.7*maghadir_m1(5,value(5,2,1),3,n)+maghadir_m1(8,value(8,2,1),3,n)+...
maghadir_m1(14,value(14,2,1),3,n) - enteghali2_1(value(2,2,1),n)- enteghali3_1(value(2,2,1),n)...
-abman(value(1,1,1),11,1,n)-abman(value(1,1,1),11,8,n);%taghzie masnue

majmue_bardasht(2,n)=maghadir_m1(3,value(3,2,1),3,n)+maghadir_m1(4,value(4,2,1),3,n)+...
0.3*maghadir_m1(5,value(5,2,1),3,n)+maghadir_m1(9,value(9,2,1),3,n)+maghadir_m1(10,value(10,2,1),3,n)+...
maghadir_m1(15,value(15,2,1),3,n) - enteghali3_2(value(2,2,1),n) + enteghali2_1(value(2,2,1),n)...
-abman(value(1,1,1),11,9,n);%taghzie masnue

majmue_bardasht(3,n)=maghadir_m1(11,value(11,2,1),3,n)...%keshavarzi nahie 3
+maghadir_m1(16,value(16,2,1),3,n)+...%sanat nahie 3
maghadir_m1(7,value(7,2,1),3,n)...abfaye eslamshahr 
+ enteghali3_1(value(2,2,1),n) + enteghali3_2(value(2,2,1),n)... 
-abman(value(1,1,1),11,10,n); %taghzie masnue;

for s=1:3
oftb(s)=(majmue_bardasht(s,n)/(sath(s)*0.1))*10^6;  
end
oftb;
for m=1:3  %mohasebe nesbate mizane bardasht b meghdare abe ghabele bardasht az har abkhan
   ab(m,n)=majmue_bardasht(m,n)/abe_z(1,n,m); 
end
% for m=1:3
%    if ab(m)>0.95 
%  
%    end
%     
% end



LC(k,1:2)=0;
% for j=1:2
%     k;
%     if abe_z(1,n,1)>0
%  LC(k,j)=((majmue_bardasht(1)/abe_z(1,n,1))+(majmue_bardasht(2)/abe_z(1,n,2))+(majmue_bardasht(3)/abe_z(1,n,3)))/3 ...%ekhtelafe mizane ofte feali ba anche k ostan  dari mikhahad
% +0.25*((maghadir_m1(k,j,1,n)-min(maghadir_m1(k,:,1,n)))+(maghadir_m1(k,j,2,n)-min(maghadir_m1(k,:,2,n)))+(maghadir_m1(k,j,3,n)-min(maghadir_m1(k,:,3,n))));
%     else
%  LC(k,j)=((majmue_bardasht(1))+(majmue_bardasht(2)/abe_z(1,n,2))+(majmue_bardasht(3)/abe_z(1,n,3)))/3;       
%     end
% end
 end 
end
end
%%
function [d,LB,UB,LB1,UB1]=find_d(d,LC,LB,UB,lb_child,ub_child,k,n)
global num_years teadade_gozine agent_number noe_sal value
% fprintf('   find_d')
k;
LB1=zeros(max(teadade_gozine(k,:)),1);
UB1=LB1;

  for j=1:teadade_gozine(k,noe_sal(n))
   if k==1   
   LB1(j)=LC(k,j)+sum(lb_child(k+1:agent_number,j));
     if LB1(j)~=0
   UB1(j)=LC(k,j)+sum(ub_child(k+1:agent_number,j));
     end
   else  
     LB1(j)=LC(k,j);
     UB1(j)=LC(k,j);     
   end
  end  
  
LB1;
UB1;
LB(k)=min(LB1(1:teadade_gozine(k,noe_sal(n)))); 
UB(k)=min(UB1(1:teadade_gozine(k,noe_sal(n))));
k;
d(k,1);
if k==1
LB1;
UB1;
end
a1=min(LB1(1:teadade_gozine(k,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(k,noe_sal(n))
   if LB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end

if bb==1
   d(k,1)=find(LB1(1:teadade_gozine(k,noe_sal(n)))==LB(k));
elseif bb>1
  d(k,1)=aa;  
end

a1=min(UB1(1:teadade_gozine(k,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(k,noe_sal(n))
   if UB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end

if k~=1
    if bb==1
  d(k,2)=find(UB1(1:teadade_gozine(k,noe_sal(n)))==UB(k));
   else
  d(k,2)=aa;    
   end
elseif k==1 && a1~=inf
   d(k,2)=find(UB1(1:teadade_gozine(k,noe_sal(n)))==UB(k));
elseif k==1 && a1~=inf
   d(k,2)=value(k,2,1);  
end
end
%%   
function[C1,C2,C3]=keifi_abfa(n,tule_dore,j,maghadir_m1)
global abman sath shorb_nahie RWATER1 RWATER2 rain teadade_gozine noe_sal niaze_sabz keshavarzi sanat B  nofuze_kol_kan wh
global enteghali_a_2_1 enteghali_a_3_1 enteghali_a_3_2 pasab
dv = 52;loss_rate=0.25; S_G=0.1;
nesbate_nofuz=[0.4,0.6,0];
L=[7500;16000;12000];
K=[4.25;8.75;0.87];
rock1=1077;rock2=962;rock3=959;rock4=954.5;
L_G1 = 7500; L_G2 = 16000; L_G3 = 12000;
K1 = 4.25; K2 = 8.75; K3 = 0.87;
b12 = 14250; b23 = 15750; b34 = 4000;
denit = 0.21;
halflife = 1274;
Kashanak_re = 4000000/10^6;
%taeen moteghayerhaye model keifi..........................................
C_Rain = zeros(1,tule_dore*dv+1); C_shorb = zeros(1,tule_dore*dv+1);
C_pasab = zeros(1,tule_dore*dv+1); C_fazelab = zeros(1,tule_dore*dv+1); C_kan = zeros(1,tule_dore*dv+1);
C_bagh = zeros(1,tule_dore*dv+1); C_kan1 = zeros(1,tule_dore*dv+1); C_kan2 = zeros(1,tule_dore*dv+1); C_kashanak = zeros(1,tule_dore*dv+1);
C_fazayesabz1 = zeros(1,tule_dore*dv+1); C_fazayesabz2 = zeros(1,tule_dore*dv+1);
C_sanat1 = zeros(1,tule_dore*dv+1); C_sanat2 = zeros(1,tule_dore*dv+1); C_sanat3 = zeros(1,tule_dore*dv+1);
C_keshavarzi2 = zeros(1,tule_dore*dv+1); C_keshavarzi3 = zeros(1,tule_dore*dv+1);
C1 = zeros(1,tule_dore*dv+1); C2 = zeros(1,tule_dore*dv+1); C3 = zeros(1,tule_dore*dv+1);
Bm1 = zeros(1,tule_dore*dv+1); Bm2 = zeros(1,tule_dore*dv+1); Bm3 = zeros(1,tule_dore*dv+1); 
MW1 = zeros(1,tule_dore*dv+1); MW2 = zeros(1,tule_dore*dv+1); MW3 = zeros(1,tule_dore*dv+1); 
MN1 = zeros(1,tule_dore*dv+1); MN2 = zeros(1,tule_dore*dv+1); MN3 = zeros(1,tule_dore*dv+1);
%..........................................................................
for k=2
% for j=1:teadade_gozine(k,noe_sal(n))
 for nt = 1:dv
    m = (n - 1) * dv + nt;

%ghelzat nitrat baresh / ab shorb / pasab / fazelab / kan / bagh
C_Rain(1,m) = 0.012; C_shorb(1,m) = 0.018; C_pasab(1,m) = 0.050; C_fazelab(1,m) = 0.203; 
C_kan(1,m) = 0.025; C_kan1(1,m) = C_kan(1,m); C_kan2(1,m) = C_kan(1,m);
C_kashanak(1,m) = C_kan(1,m); C_bagh(1,m) = C_kan(1,m);
if m==1
     C1(1,m) = .040; C2(1,m) = 0.020; C3(1,m) = 0.020; 
end
    if nt == 1
    Bm1(1,m) = B(1,1,n);
    Bm2(1,m) = B(1,2,n); Bm3(1,m) = B(1,3,n); 
    MW1(1,m) = Bm1(1,m) * sath(1) * S_G;    MW2(1,m) = Bm2(1,m) * sath(2) * S_G;    MW3(1,m) = Bm3(1,m) * sath(3) * S_G;
    MN1(1,m) = MW1(1,m) * C1(1,m); MN2(1,m) = MW2(1,m) * C2(1,m); MN3(1,m) = MW3(1,m) * C3(1,m);
    end

    C_fazayesabz1(1,m) = C1(1,m); C_fazayesabz2(1,m) = C2(1,m);
    C_sanat1(1,m) = C1(1,m); C_sanat2(1,m) = C2(1,m); C_sanat3(1,m) = C3(1,m);
    C_keshavarzi2(1,m) = (C_kan2(1,m) * 0.7*keshavarzi(1)+ C2(1,m) * 0.3*keshavarzi(1))...
                     / (keshavarzi(1));
    C_keshavarzi3(1,m) = (C_kan2(1,m) * 0.5*keshavarzi(2) + C3(1,m) * 0.5*keshavarzi(2))...
                      / (keshavarzi(2));
   
%taraz
[Bm1,Bm2,Bm3,~]=bilan_prime1(n,nofuze_kol_kan,nesbate_nofuz,rain,j,L,K,wh,B,m,Bm1,Bm2,Bm3,dv,...
    enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,n,maghadir_m1);

%jerm ab
MW1(1,m+1) = Bm1(1,m+1) * S_G * sath(1); MW2(1,m+1) = Bm2(1,m+1) * S_G * sath(2); MW3(1,m+1) = Bm3(1,m+1) * S_G * sath(3);

%jerm nitrat
% if abman(j,7,3,n)==1.05*shorb_nahie(1,n)
% MN1(1,m+1)= (shorb_nahie(5,n)+0.7*shorb_nahie(4,n)+shorb_nahie(1,n))*0.05; 
% MN2(1,m+1)= (shorb_nahie(2,n)+shorb_nahie(3,n)+0.3*shorb_nahie(4,n))*0.05;
% MN3(1,m+1)= shorb_nahie(6,n)*0.05; 
% end
 MN1(1,m+1) = MN1(1,m+1)+(C1(1,m) * MW1(1,m)) +...
    ( -(C1(1,m) * (0.2*sum(niaze_sabz(1,:)) + (maghadir_m1(2,j,3,n) + maghadir_m1(6,j,3,n) + 0.7*maghadir_m1(5,j,3,n)) + 0.1*sanat(1)))...%majmue bardasht haye k az abkhane aval ba ghelzate C1 suarat gerefte shaele: shorb, sanat, shahrdari
   +(1-denit) * ((C_kan1(1,m) * 0.4*(RWATER1(n)-sum(abman(j,:,4,n))) +...
    (C_Rain(1,m) * rain(1,n) * 12 * sath(1) * 0.135 / 1000) +...
    0.355 * C_sanat1(1,m) * abman(j,13,1,n) +...
    C_fazayesabz1(1,m) * 0.225 * ( abman(j,7,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_shorb(1,m) *maghadir_m1(2,j,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * 0.7 * C_shorb(1,m) *maghadir_m1(5,j,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_shorb(1,m) * maghadir_m1(6,j,1,n)) +...
    (0.1 * C_bagh(1,m) * abman(j,12,1,n))) ...
    +C2(1,m)*enteghali_a_2_1(j,n)...% abe enteghal dade shode az abkhane dovom b aval
    +C3(1,m)*enteghali_a_3_1(j,n))...% abe enteghal dade shide az abkhane dovom b aval
    -(365 * C1(1,m) * (((Bm1(1,m)+rock1)-(Bm2(1,m)+rock2)) / ((L_G1 + L_G2) / 2)) * ((L_G1 + L_G2) / ((L_G1 / K1) + (L_G2 / K2))) * b12 * ((Bm1(1,m) + Bm2(1,m)) / 2)) -...
    ((MN1(1,m) * 0.693) / (halflife / 365)))  / dv;

MN2(1,m+1) = MN2(1,m+1)+(C2(1,m) * MW2(1,m)) + ( -(C2(1,m) * (maghadir_m1(9,j,3,n) + maghadir_m1(3,j,3,n)+ maghadir_m1(4,j,3,n)+0.3*maghadir_m1(5,j,3,n) + abman(j,9,3,n) +abman(j,14,3,n))) +...
    (1-denit) * ((C_kan2(1,m) * (( pasab(n) -0.8* (sum(niaze_sabz(2,:))+ sum(niaze_sabz(1,:))) -0.9*sum(sanat(1:2)))) +...
    (C_Rain(1,m) * rain(1,n) * 12 * sath(2) * 0.135 / 1000) + 0.225 * C_keshavarzi2(1,m) *keshavarzi(1) +...
    0.355 * C_sanat2(1,m) * sanat(2) + C_fazayesabz2(1,m) * 0.225  * sum(niaze_sabz(2,:)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_shorb(1,m) * maghadir_m1(3,j,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_shorb(1,m) * maghadir_m1(4,j,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * 0.3 * C_shorb(1,m) * maghadir_m1(5,j,1,n))) +...
    -C2(1,m)*enteghali_a_2_1(j,n)...%abe enteghali az abkhane dovom b abkhane aval
    +C3(1,m)*enteghali_a_3_2(j,n))...%abe enteghali az abkhane sevom b abkhane dovom
    +(365 * C1(1,m) * (((Bm1(1,m)+rock1)-(Bm2(1,m)+rock2)) / ((L_G1 + L_G2) / 2)) * ((L_G1 + L_G2) / ((L_G1 / K1) + (L_G2 / K2))) * b12 * ((Bm1(1,m) + Bm2(1,m)) / 2)) -...
    (365 * C2(1,m) * (((Bm2(1,m)+rock2)-(Bm3(1,m)+rock3)) / ((L_G2 + L_G3) / 2)) * ((L_G2 + L_G3) / ((L_G2 / K2) + (L_G3 / K3))) * b23 * ((Bm2(1,m) + Bm3(1,m)) / 2)) -...
    ((MN2(1,m) * .693) / (halflife / 365))) / dv; 

MN3(1,m+1) =MN3(1,m+1) + (C3(1,m) * MW3(1,m)) + ( -(C3(1,m) * (maghadir_m1(7,j,3,n) + 0.5*keshavarzi(2) +sanat(3))) +...
    (1-denit) * ((C_kashanak(1,m) * Kashanak_re +...
    (C_Rain(1,m) * rain(1,n) * 12 * sath(3) * 0.135 / 1000) + 0.225 * C_keshavarzi3(1,m) * keshavarzi(2) +...
    0.355 * C_sanat3(1,m) *sanat(3) + (0.65 * (1 / (1 + loss_rate)) * C_fazelab(1,m) * maghadir_m1(7,j,1,n)) +...
    (0.65 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_fazelab(1,m) * maghadir_m1(7,j,1,n)) +...
    (0.2 * ((0.5 * loss_rate) / (1 + loss_rate)) * C_shorb(1,m) *maghadir_m1(7,j,1,n))) +...
    -C3(1,m) * enteghali_a_3_1(j,n)... %abe enteghali az abkhane sevom b abkhane aval
    -C3(1,m) * enteghali_a_3_2(j,n))...%abe enteghali az abkhane sevom b abkhane dovom
    +(365 * C2(1,m) * (((Bm2(1,m)+rock2)-(Bm3(1,m)+rock3)) / ((L_G2 + L_G3) / 2)) * ((L_G2 + L_G3) / ((L_G2 / K2) + (L_G3 / K3))) * b23 * ((Bm2(1,m) + Bm3(1,m)) / 2)) -...
    (365 * C3(1,m) * 0.0044 * K3 * b34 * ((Bm3(1,n) + (Bm3(1,m)+rock3 - 0.0044 * L_G3 - rock4)) / 2)) -...
    ((MN3(1,m) * .693) / (halflife / 365))) / dv;

C1(1,m+1) = MN1(1,m+1)/MW1(1,m+1);C2(1,m+1) = MN2(1,m+1)/MW2(1,m+1);C3(1,m+1) = MN3(1,m+1)/MW3(1,m+1);    
        
 end
% end
end
end

function[Bm1,Bm2,Bm3,wh]=bilan_prime1(n,nofuze_kol_kan,nesbate_nofuz,rain,j,L,K,wh,B,m,Bm1,Bm2,Bm3,dv,...
    enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,i,maghadir_m1) 
global abman pasab Z_m sath niaze_sabz sanat keshavarzi 
S_G=0.1;loss_rate=0.25;rock=[1077;962;959;954.5];
%taraz sath zamin
dem1 = 1288; dem2 = 1116; dem3 = 1017;
dem(1)=1288;dem(2)=1116;dem(3)=1017;
b=[14250;15750;4000];%avalie b12 dovomi b23 sevomi b34

Bm1(1,m+1) = Bm1(1,m)+((nofuze_kol_kan(n)*nesbate_nofuz(1)...
+0.135*rain(n)*12*sath(1)*10^(-9)... 
+0.1*maghadir_m1(13,1,1,n)+maghadir_m1(12,j,1,n)...%taghzie masnue va bagh
+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(2,j,1,n)+ maghadir_m1(6,j,1,n)+0.7*maghadir_m1(5,j,1,n))...%nofuze nashi az etlafe abe shahri nahie5, 22, va 70 darsade 21
-maghadir_m1(2,j,3,n)...%nahie panje abfa
-0.7*maghadir_m1(5,j,3,n)...%70 darsade nahie 21 abfa 
-maghadir_m1(6,j,3,n)...%nahie 22 abfa
-0.2*sum(niaze_sabz(1,:))... %nahie avale shahrdari
-0.1*sanat(1)...%nahie yeke sanat
+0.225*sum(niaze_sabz(1,:))...%jazbe shahrdari
+0.335*sanat(1)...%jazbe sanat
+enteghali_a_2_1(j,n)...% abe enteghal dade shide az abkhane dovom b aval
+enteghali_a_3_1(j,n)))/(S_G*sath(1)*dv*10^(-6))...% abe enteghal dade shide az abkhane dovom b aval  
-(((365*((wh(1,n)-wh(2,n))/(sum(L(1:2))/2)))*((L(1)+L(1+1))/((L(1)/K(1))+(L(1+1)/K(1+1))))*b(1)*((B(1,1,n)+B(1,1+1,n))/2)))/dv/(S_G * sath(1));
    

 Bm2(1,m+1) = Bm2(1,m)+((nofuze_kol_kan(n)*sum(nesbate_nofuz(1:2))...
+0.135*rain(n)*12*sath(2)*10^(-9)... 
+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(3,j,1,n)+maghadir_m1(4,j,1,n)+0.3*maghadir_m1(5,j,1,n))...%nofuze nashi az etlafe abe shahri nahie 9,18 va 30% nahie 21
-maghadir_m1(3,j,3,n)...%abfaye nahie 9
-maghadir_m1(4,j,3,n)...%abfaye nahie18
-0.3*maghadir_m1(5,j,3,n))...%30darsade abfaye nahie 21
-0.2*sum(niaze_sabz(2,:))...%shahrdari nahie 2
-0.3*keshavarzi(1) ...%keshavarzi nahie 2
-0.1*sanat(2)...%sanate nahie 2
+0.194*( pasab(n) -0.8* (sum(niaze_sabz(2,:))+ sum(niaze_sabz(1,:))) -0.9*sum(sanat(1:2)))*nesbate_nofuz(2)...%nofuze pasabe raha shode dar kan k baghimande azmasrafe shahrdari va sanat ast
+0.225*(sum(niaze_sabz(2,:))+sum(niaze_sabz(1,:))+keshavarzi(1))+0.335*sanat(2)......%nofuze shahrdari o keshavarzi va sanat
-enteghali_a_2_1(j,n)...%abe enteghali az abkhane dovom b abkhane aval
+enteghali_a_3_2(j,n))/(S_G*sath(1)*dv*10^(-6))...%abe enteghali az abkhane sevom b abkhane dovom
+(((365*((wh(1,2-1,n)-wh(1,2,n))/(sum(L(2-1:2))/2)))*((L(2-1)+L(2))/((L(2)/K(2))+(L(2-1)/K(2-1))))*b(2-1)*((B(1,2,n)+B(1,2-1,n))/2)))/(S_G*sath(2))*dv/...
-((365*((wh(1,2,n)-wh(1,2+1,n))/((L(2)+ L(2+1))/2))*((L(2)+L(2+1))/((L(2)/K(2))+(L(2+1)/K(2+1))))*b(2)*((B(1,2,n)+B(1,2+1,n))/2)))/(dv*(S_G*sath(2)));


Bm3(1,m+1) = Bm3(1,m)+((nofuze_kol_kan(n)*(nesbate_nofuz(3))...
+0.135*rain(n)*12*sath(3)*10^(-9)... 
+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(7,j,1,n))...%nofuze nashi az etlafe abe shahri
-maghadir_m1(7,j,3,n)...%abfaye eslam sahhr
-0.5*keshavarzi(2)...%keshavarzi nahie 3
-sanat(3)...%sanat nahie 3
+0.194*(pasab(n)- 0.8*(sum(niaze_sabz(1,:)) - sum(niaze_sabz(2,:))) - 0.9*sum(sanat(1:2))) * nesbate_nofuz(3)...%nofuze pasabe raha shode dar kan k baghimande azmasrafe shahrdari va sanat ast
+0.225*keshavarzi(2) + 0.335*sanat(3)...%nofuze keshavarzi va sanat
-enteghali_a_3_2(j,n)...
-enteghali_a_3_1(j,n)))/((S_G*sath(3))*dv*10^(-6))...
+((365 *((wh(1,3-1,n) - wh(1,3,n)) / ((L(3) + L(3-1)) / 2)) * ((L(3) + L(3-1)) / ((L(3) / K(3)) + (L(3-1)/ K(3-1)))) * b(3-1)*((B(1,3,n)+B(1,3-1,n))/2)))/(sath(3)*S_G*dv)...
-((365 * 0.0044 * K(3) * b(3) * ((B(1,3,n)) + (wh(1,3,1) - 0.0044 * L(3) -rock(3+1))/2)))/(dv*sath(3)*S_G);
end