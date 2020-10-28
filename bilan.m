%%bilan
function[B,wh]=bilan(n,rock,sath,value_kol,nofuze_kol_kan,nesbate_nofuz,rain,L,K,loss_rate,b,B,wh,S_G,maghadir_m1,...
    enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,bar_z)
global abe_z abman pasab taghzie taghzie1 Z_m
%taraz sath zamin

dem(1)=1288;dem(2)=1116;dem(3)=1017;
for s=1:3 %shomarande abkhane nahie
    abe_z(1,n+1,s)=abe_z(1,n,s)+nofuze_kol_kan(n)*sum(nesbate_nofuz(1:s))...
    +0.135*rain(n)*12*sath(s)*10^(-9);
taghzie(s,n)=nofuze_kol_kan(n)*sum(nesbate_nofuz(1:s))...
    +0.135*rain(n)*12*sath(s)*10^(-9);
if s==1%abkhane aval
 value_kol(6,2,1,n)   
abe_z(1,n+1,s)=abe_z(1,n+1,s)+0.1*value_kol(13,1,1,n)...
+ abman(value_kol(1,1,1,n),11,1,n)...%taghzie masnue az sad haye lastiki % 
+ abman(value_kol(1,1,1,n),11,8,n)...%taghzie masnue az chah haye ariz
+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(2,value_kol(2,2,1,n),1,n)+maghadir_m1(6,value_kol(6,2,1,n),1,n)+maghadir_m1(5,value_kol(5,2,1,n),1,n))...%nofuze nashi az etlafe abe shahri
-bar_z(value_kol(2,2,1,n),1,n,1)...%nahie panje abfa
-bar_z(value_kol(5,2,1,n),4,n,1)...%70 darsade nahie 21 abfa 
-bar_z(value_kol(6,2,1,n),5,n,1)...%nahie 22 abfa
-maghadir_m1(8,value_kol(8,2,1,n),3,n)... %nahie avale shahrdari
-maghadir_m1(14,value_kol(14,2,1,n),3,n)...%nahie yeke sanat
+0.225*value_kol(8,1,1,n)+0.335*value_kol(14,1,1,n)... %jazbe sanat va shahrdari
+enteghali_a_2_1(value_kol(2,2,1,n),n)...% abe enteghal dade shide az abkhane dovom b aval
+enteghali_a_3_1(value_kol(2,2,1,n),n)...% abe enteghal dade shide az abkhane dovom b aval
-((365*((wh(s,n)-wh(s+1,n))/(sum(L(s:s+1))/2)))*((L(s)+L(s+1))/((L(s)/K(s))+(L(s+1)/K(s+1))))*b(s)*((B(1,s,n)+B(1,s+1,n))/2))/(10^6);%ghanune darcy

elseif s==2 
    abe_z(1,n+1,s)=...
        abe_z(1,n+1,s)+...
((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(3,value_kol(3,2,1,n),1,n)+ maghadir_m1(4,value_kol(4,2,1,n),1,n)+maghadir_m1(5,value_kol(5,2,1,n),1,n))...%nofuze nashi az etlafe abe shahri
-bar_z(value_kol(3,2,1,n),2,n,2)...%abfaye nahie 9%
+ abman(value_kol(1,1,1,n),11,9,n)...%taghzie masnue az tarighe chah haye ariz
-bar_z(value_kol(4,2,1,n),3,n,2)...%abfaye nahie18
-bar_z(value_kol(5,2,1,n),4,n,2)...%30darsade abfaye nahie 21
-maghadir_m1(9,value_kol(9,2,1,n),3,n)...%shahrdari nahie 2
-maghadir_m1(10,value_kol(10,2,1,n),3,n)...%keshavarzi nahie 2
-maghadir_m1(15,value_kol(15,2,1,n),3,n)...%sanate nahie 2
+0.194*(pasab(1,n)-sum(value_kol(:,1,4,n)))*nesbate_nofuz(s)...%nofuze pasabe raha shode dar kan k baghimande azmasrafe shahrdari va sanat ast
+0.225*(value_kol(9,1,1,n)+value_kol(10,1,1,n))+0.335*value_kol(15,1,1,n)...%nofuze shahrdari o keshavarzi va sanat
-enteghali_a_2_1(value_kol(2,2,1,n),n)...%abe enteghali az abkhane dovom b abkhane aval
+enteghali_a_3_2(value_kol(2,2,1,n),n)...%abe enteghali az abkhane sevom b abkhane dovom
+(((365*((wh(1,s-1,n)-wh(1,s,n))/(sum(L(s-1:s))/2)))*((L(s-1)+L(s))/((L(s)/K(s))+(L(s-1)/K(s-1))))*b(s-1)*((B(1,s,n)+B(1,s-1,n))/2))/(10^6)...%ghanune darcy
-(365*((wh(1,s,n)-wh(1,s+1,n))/((L(s)+ L(s+1))/2))*((L(s)+L(s+1))/((L(s)/K(s))+(L(s+1)/K(s+1))))*b(s)*((B(1,s,n)+B(1,s+1,n))/2))/(10^6));


elseif s==3
abe_z(1,n+1,s)=abe_z(1,n+1,s)...
+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(7,value_kol(7,2,1,n),1,n))...%nofuze nashi az etlafe abe shahri
+ abman(value_kol(1,1,1,n),11,10,n)...%taghzie masnue az tarighe chah haye ariz
-bar_z(value_kol(1,2,1,n),6,n,3)...%abfaye eslam sahhr
-maghadir_m1(11,value_kol(11,2,1,n),3,n)...%keshavarzi nahie 3
-maghadir_m1(16,value_kol(16,2,1,n),3,n)...%sanat nahie 3
+0.194*(pasab(1,n)-sum(value_kol(:,1,4,n)))*nesbate_nofuz(s)...%nofuze pasabe raha shode dar kan k baghimande azmasrafe shahrdari va sanat ast
+0.225*(value_kol(11,1,1,n))+0.335*value_kol(16,1,1,n)...%nofuze keshavarzi va sanat
-enteghali_a_3_1(value_kol(2,2,1,n),n)... %abe enteghali az abkhane sevom b abkhane aval
-enteghali_a_3_2(value_kol(2,2,1,n),n)...%abe enteghali az abkhane sevom b abkhane dovom
+(365 *((wh(1,s-1,n) - wh(1,s,n)) / ((L(s) + L(s-1)) / 2)) * ((L(s) + L(s-1)) / ((L(s) / K(s)) + (L(s-1)/ K(s-1)))) * b(s-1)*((B(1,s,n)+B(1,s-1,n))/2))/(10^6)...
-(365 * 0.0044 * K(s) * b(s) * ((B(1,s,n)) + (wh(1,s,1) - 0.0044 * L(s) -rock(s+1))/2))/(10^6);

taghzie(s,n)=taghzie(s,n)...
+(365 *((wh(1,s-1,n) - wh(1,s,n)) / ((L(s) + L(s-1)) / 2)) * ((L(s) + L(s-1)) / ((L(s) / K(s)) + (L(s-1)/ K(s-1)))) * b(s-1)*((B(1,s,n)+B(1,s-1,n))/2))/(10^6)...
-(365 * 0.0044 * K(s) * b(s) * ((B(1,s,n)) + (wh(1,s,1) - 0.0044 * L(s) -rock(s+1))/2))/(10^6);

taghzie1(s,n)=taghzie(s,n)+((0.2*0.5*loss_rate)/(1+loss_rate))*(maghadir_m1(7,value_kol(7,2,1,n),1,n))+...
+0.194*(pasab(1,n)-sum(value_kol(:,1,4,n)))*nesbate_nofuz(s)+0.225*(value_kol(11,1,1,n))+0.335*value_kol(16,1,1,n);
end
B(1,s,n+1)=abe_z(1,n+1,s)*10^6/(S_G*sath(s));
wh(1,s,n+1)=rock(s)+B(1,s,n+1);
Z_m(s,n+1)=dem(s)-wh(1,s,n+1);
abe_z(2:4,n+1,s)=abe_z(1,n+1,s);
end
taghzie(4,n)=sum(taghzie(1:3,n));
taghzie1(4,n)=sum(taghzie1(1:3,n));
end    