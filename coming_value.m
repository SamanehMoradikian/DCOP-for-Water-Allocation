function  [current_context,t,LC,LB,UB,d,ub_child,t_child,lb_child]=coming_value(current_context,...
    t,LB,UB,lb_child,ub_child,LC,t_child,maghadir_m1,d,n,k)  

global value teadade_gozine  agent_number terminate  noe_sal Z_m w beta shomarande
%moteghaire d darbardarande ie andisi ast k baese minimum shodane UB va LB
%shode ast.sotune aval marbut b LB va sotune dovom marbut b UB
%   fprintf('    comingvalue')
 k;
if k==1 %ferestande peighame value
    samaneh22=sum(shomarande(:,1));
for k=1 %entehash khate 107e
     for i=1:agent_number  %tafakore baghie nesbat b amele aval ro update mikne
      current_context(i,1,1:6,n)=value(k,1,1:6);
     end 

  for i=1:17 %daryaft konanade peighame value
     i;
     if terminate(i,n)==1
%     fprintf('   end of coming value')
       break
     else
%% daryafte value message va zakhire an
[UB,LB,d,LC]=Local_Cost(d,lb_child,ub_child,maghadir_m1,i,LC,UB,LB,current_context,n);
d;
LC;

%amaele balae chon az hichkaas value mesaage daryaft nemikonad hmvare
%current_context ash dar morede baghie sefr ast
%
% fprintf('     continue of coming value')
LB1=zeros(max(teadade_gozine(i,:)),1);
UB1=LB1;
  for j=1:teadade_gozine(i,noe_sal(n))
   if i==1   
   LB1(j)=LC(i,j)+sum(lb_child(i+1:agent_number,j));
     if LB1(j)~=0
   UB1(j)=LC(i,j)+sum(ub_child(i+1:agent_number,j));
     end
   else
     LB1(j)=LC(i,j);  
     UB1(j)=LC(i,j);  
   end
  end
 LC(i);
LB1;
UB1;
LB(i)=min(LB1(1:teadade_gozine(i,noe_sal(n)))); 
UB(i)=min(UB1(1:teadade_gozine(i,noe_sal(n))));
 a1=min(LB1(1:teadade_gozine(i,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(i,noe_sal(n))
   if LB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end
bb;
if bb==1
  d(i,1)=find(LB1(1:teadade_gozine(i,noe_sal(n)))==LB(i));
else
  d(i,1)=aa;  
end

a1=min(UB1(1:teadade_gozine(i,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(i,noe_sal(n))

   if UB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end

if i~=1
    if bb==1
  d(i,2)=find(UB1(1:teadade_gozine(i,noe_sal(n)))==UB(i));
%   asd=123456
   else
    d(i,2)=aa;    
   end
elseif i==1 && a1~=inf
   d(i,2)=find(UB1(1:teadade_gozine(i,noe_sal(n)))==UB(i));     
elseif i==1 && a1==inf
   d(i,2)=value(i,2,1); 
end
salman=d(k,:);
[t,~]=maintainThresholdInvariant(t,LB,UB,i);
     end
 end
LB;
UB;
t;
  if terminate(k,n)==1
      break
   else

   for i=2:agent_number
  [LB,UB,current_context,t,~,LC,t_child,lb_child,ub_child]=backtrack(t,UB,LB...
       ,current_context,i,LC,d,t_child,lb_child,ub_child,maghadir_m1,n); 
   end
   end
end
%% baghie amel ha b joz amele yeki peighame value ra b ostandari ersal mikonand---------------------------------------------------------------------------------    
elseif k~=17    
 for i=[k,17]
     k;
     i;
    current_context(i,k,1:6,n)=value(k,1,1:6);
    current_context(i,k,1,n);
 end
 for i=[k,17]
  if terminate(i,n)==1
%          fprintf('   end of coming value')
   break
  else
   [UB,LB,d,LC]=Local_Cost(d,lb_child,ub_child,maghadir_m1,i,LC,UB,LB,current_context,n); 
LB1=zeros(max(teadade_gozine(i,:)),1);
UB1=LB1;
  for j=1:teadade_gozine(i,noe_sal(n))  
   LB1(j)=LC(i,j)+sum(lb_child(i+1:agent_number,j));
     if LB1(j)~=0
   UB1(j)=LC(i,j)+sum(ub_child(i+1:agent_number,j));
     end
  end    
      
LB(i)=min(LB1(1:teadade_gozine(i,noe_sal(n)))); 
UB(i)=min(UB1(1:teadade_gozine(i,noe_sal(n))));
a1=min(LB1(1:teadade_gozine(i,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(i,noe_sal(n))
   if LB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end
i;
bb;
 
if bb==1
   d(i,1)=find(LB1(1:teadade_gozine(i,noe_sal(n)))==LB(i));
else
  d(i,1)=aa;  
end

a1=min(UB1(1:teadade_gozine(i,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(i,noe_sal(n))

   if UB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end

if i~=1
    if bb==1
  d(i,2)=find(UB1(1:teadade_gozine(i,noe_sal(n)))==UB(i));
   else
    d(i,2)=aa;    
   end
elseif i==1 && a1~=inf    
   d(i,2)=find(UB1(1:teadade_gozine(i,noe_sal(n)))==UB(i)); 
elseif i==1 && a1==inf 
   d(i,2)=value(i,2,1); 
end
d;
[t,~]=maintainThresholdInvariant(t,LB,UB,i);                 
  end
 end
 
 for i=17%????????????????????????????????????????????????????????????????????????????
     if current_context(k,1:16,1,n)~=0
  [LB,UB,current_context,t,~,LC,t_child,lb_child,ub_child]=backtrack(t,UB,LB...
  ,current_context,i,LC,d,t_child,lb_child,ub_child,maghadir_m1,n); 
     end
 end   
end
end

%%
function [UB,LB,d,LC]=Local_Cost(d,lb_child,ub_child,maghadir_m1,k,LC,UB,LB,current_context,n)
global sanat value teadade_gozine sath S_G keshavarzi_potansiel w beta abe_z
global abman niaze_sabz noe_sal zarib_z shorb_nahie hazine_tabligh jarime  pasab_p gw_p w_p sarane_shorb Z_m
global enteghali2_1 enteghali3_1 enteghali3_2 loss_rate ab majmue_bardasht
[price1,Real_Pr1,Real_Pr2,Real_PrE,PSTP,PGTP,POT,POTG,PIN,PLL,PRR,PRF,PRW,PEE1,PEE2,PEE3,PT]=taene_gheimat(n,sarane_shorb);
% fprintf('local cost  2  ')
z=zeros(2,1);
k;
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
 +w(4)*(sum(sanat(1:2))-sum(abman(j,13:14,1,n))+ sum(abman(j,13:14,3,n)))/(sum(sanat(1:2)))... %sanat 
 -w(5)*((abman(j,11,1,n)+abman(j,11,8,n)+abman(j,11,9,n)+abman(j,11,10,n)-min_taghzie(n))/(max_taghzie(n)-min_taghzie(n)))... %taghzie        
 +w(1)*((sum(abman(j,1:6,1,n))-0.95*sum(shorb_nahie(1:6,n)))/(0.05*sum(shorb_nahie(1:6,n))))...%abfa
 +w(2)*(((abs(abman(j,7,1,n)-(niaze_sabz(1,1)+0.5*(sum(niaze_sabz(1,2:3))))))/(sum(niaze_sabz(1,1:3))-niaze_sabz(1,1)))+...
 (abs(abman(j,8,1,n)-(niaze_sabz(2,1)+0.5*(sum(niaze_sabz(2,2:3))))))/(sum(niaze_sabz(2,1:3))-niaze_sabz(2,1)));%shahrdari
  end
  
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
    for j=1:teadade_gozine(k,noe_sal(n))
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

%keshavarzi.................
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
    -((10^6*(DG*maghadir_m1(k,j,1,n)*Fa_gr_pr1(1,n)*Fa_gr_m1+...%daramad e hasel az forush
    DJ*maghadir_m1(k,j,1,n)*Fa_gr_pr2(1,n)*Fa_gr_m2+ DY*maghadir_m1(k,j,1,n)*Fa_gr_pr3(1,n)*Fa_gr_m3)))...
    /(10^6*(DG*Fa_gr_pr1(1,n)*Fa_gr_m1 + DJ*Fa_gr_pr2(1,n)*Fa_gr_m2 + DY*Fa_gr_pr3(1,n)*Fa_gr_m3)*(keshavarzi_potansiel(k-9))));     
   end
  
%sanat.............    
elseif k==15||k==16||k==14
    max_ekhtelaf=abs(maghadir_m1(k,1,1,n)-abman(value(1,2,1),k-1,1,n));
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf<abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n))
        max_ekhtelaf= abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n));
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
LC(k,j)=beta(2)*((PRR(1,n)*maghadir_m1(k,j,4,n)+POTG(1,n)*maghadir_m1(k,j,3,n)+PEE1(1,n)*maghadir_m1(k,j,3,n)*Z_m(k-7,n))/...
    (sum(niaze_sabz(k-7,1:3))*PRR(1,n)))+...
    jarime(2)*(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf;
     elseif max_ekhtelaf==0
LC(k,j)=beta(2)*(PRR(1,n)*maghadir_m1(k,j,4,n)+POTG(1,n)*maghadir_m1(k,j,3,n)+PEE1(1,n)*maghadir_m1(k,j,3,n)*Z_m(k-7,n))/...
    (sum(niaze_sabz(k-7,1:3))*PRR(1,n));         
     end
    end
    
%abfa.................
elseif k==2||k==3||k==4||k==5||k==6||k==7
         max_ekhtelaf=abs(maghadir_m1(k,1,1,n)-abman(value(1,2,1),k-1,1,n));
    for j=1:teadade_gozine(k,noe_sal(n))
        if max_ekhtelaf<abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n))
        max_ekhtelaf=abs(maghadir_m1(k,j,1,n)-abman(value(1,2,1),k-1,1,n));
        end
    end  
       max_bardasht=max(maghadir_m1(k,1:2,3,n));
  for j=1:teadade_gozine(k,noe_sal(n))          
 z(j)=jarime(1)*(abs(maghadir_m1(k,j,3,n)-abman(value(1,2,1),k-1,3,n))/max_ekhtelaf )+...
      beta(1)*((hazine_tabligh*maghadir_m1(k,j,6,n)-w_p*abs(sum(shorb_nahie(k-1))*(1+loss_rate)-maghadir_m1(k,j,1,n))...
      +PGTP(1,n)*maghadir_m1(k,j,3,n)+PSTP(1,n)*maghadir_m1(k,j,5,n))/(PSTP(1,n)*maghadir_m1(k,j,5,n)+hazine_tabligh...
     + PGTP(1,n)*max_bardasht)); 
    if k==2&&k==6&&k==5
     z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(1,n))/(PEE3(1,n)*max_bardasht*Z_m(1,n));       
     elseif k==3&&k==4     
     z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(2,n))/(PEE3(1,n)*max_bardasht*Z_m(2,n));       
    elseif k==7
        Z_m(3,n);
        max_bardasht;
        PEE3(1,n);
    z(j)=z(j)+beta(1)*(PEE3(1,n)*maghadir_m1(k,j,3,n)*Z_m(3,n))/(PEE3(1,n)*max_bardasht*Z_m(3,n));    
    end    
  end
  for j=1:teadade_gozine(k,noe_sal(n))
    LC(k,j)=abs(z(j));  
  end
%organ haye ghrie tasmim girande ..............................   
elseif k==13||k==12||k==18
     LC(k,1:2)=1;
     
%ostandari
elseif k==17  
 if current_context(k,[1:9,12:16],1,n)~=0 
  
majmue_bardasht(1,n)=maghadir_m1(2,value(2,2,1),3,n)+maghadir_m1(6,value(6,2,1),3,n)+...
0.7*maghadir_m1(5,value(5,2,1),3,n)+maghadir_m1(8,value(8,2,1),3,n)+...
maghadir_m1(14,value(14,2,1),3,n) - enteghali2_1(value(2,2,1),n)- enteghali3_1(value(2,2,1),n)...
-abman(value(1,1,1),11,1,n)-abman(value(1,1,1),11,8,n);%taghzie masnue

majmue_bardasht(2,n)=maghadir_m1(3,value(3,2,1),3,n)+maghadir_m1(4,value(4,2,1),3,n)+...
0.3*maghadir_m1(5,value(5,2,1),3,n)+maghadir_m1(9,value(9,2,1),3,n)+maghadir_m1(10,value(10,2,1),3,n)+...
maghadir_m1(15,value(15,2,1),3,n) - enteghali3_2(value(2,2,1),n) + enteghali2_1(value(2,2,1),n)...
-abman(value(1,1,1),11,9,n);%taghzie masnue

majmue_bardasht(3,n)=maghadir_m1(11,value(11,2,1),3,n)+maghadir_m1(16,value(16,2,1),3,n)+...
maghadir_m1(7,value(7,2,1),3,n) + enteghali3_1(value(2,2,1),n) + enteghali3_2(value(2,2,1),n)...
-abman(value(1,1,1),11,10,n); %taghzie masnue

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
