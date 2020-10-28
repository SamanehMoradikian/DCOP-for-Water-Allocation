 clear all;clc;
  tic
%set(0,'RecursionLimit',200)
global value taghzie bardasht jarime bardasht_kol Temp AVWATER Z_m w tule_dore
global agent_number taghzie1 lake RWATER1 RWATER2 sarane_shorb ab
agent_number=17;
global abman am_ej alfa beta terminate teadade_gozine zarib_z hazine_tabligh hadaghal_zist_mohiti B abe_z wh
global zarib_abfa  shomarande loss_rate sath keshavarzi_potansiel noe_sal niaze_bagh abe_sathi_sen2 nofuze_kol_kan
global enteghali_a_2_1 enteghali_a_3_1 enteghali_a_3_2  num_years
global enteghali2_1 enteghali3_1 enteghali3_2 majmue_bardasht
%%
tule_dore=20;   
noe_sal=zeros(1,tule_dore);
ab=zeros(3,tule_dore);
majmue_bardasht=zeros(3,tule_dore);
num_years=tule_dore;
hadaghal_zist_mohiti=2;
taghzie=zeros(4,17);
lake=2.17;
loss_rate=0.25;
shomarande=zeros(agent_number,1);
zarib_abfa=[0.5;0.5;1.3;0.15];
hazine_tabligh=500;
teadade_gozine=ones(agent_number,3)*2; 
teadade_gozine(1,1:2)=3;teadade_gozine(1,3)=4;
%gamma zaribe baiangare ahamiate zakhire abe zir zamini
am_ej=[0;1;0.65;0.89];
alfa=[1;0.35;0.4;0.35];
beta=[1;0.3;.45;0.4];
terminate=zeros(agent_number+1,1);
global shorb_abkhan shorb_nahie pasab niaze_sabz masahate_derakht sanat
masahate_derakht=[11802755.1;6103977.9];
%avali marbut b mantaghe 5 , 22 va 70darsade mantaghe21 va dovomi marbut b mantaghe 9va 11 va 30darsade mantaghe 21
                                                                                                                  
shorb_abkhan=[119.0412168 66.209832 14.228868];
niaze_sabz=[17.70413265	4.40025204	17.60100816
9.15596685	1.41370026	5.65480104];
%satre aval baraye mantaghe 5va 22 va haftad darsade 21 satre dovom baraye
%mantaghe19 va 18 va si darsade 21
%sotune aval niaze hadaghal yani derakhtan sotune dovom baraye 20 darsade
%chaman va sotune sevo baraye 80darsade chaman
sanat_kol=20.08; sanat_nahie=[0.19;0.69;0.12];
for s=1:3
   sanat(s)=sanat_nahie(s)*sanat_kol; 
end
niaze_bagh=5;

%% abe sathi
global abe_sathi_sen rain abe_enteghali bar_z   nofuze_kol_kan nesbate_nofuz abe_sathi_farz %#ok<REDEF>
global istgah1 seilbargardane_gharb
taghzie=zeros(num_years,1);
bar_z=zeros(4,agent_number,num_years,3);%safhe 4 k setae mibashad baiangare se nahie abkhan as
rain=[26.9,18.2,21.30,25,13.30,19.600,15.10,14.40,...
14.80,15.900,27.800,25.800,27.90,22.20,19.20,24.40,11.90,19.90,18,...
26.50,19.80,9,26.90,18.20,21.30,25,13.30,19.60,15.10,14.40];% bar hasbe milimetre 

abe_enteghali=[78845718.08,80263102.95,80837704.16,78595111.45,80451214.74,70110112.39,...
    84145972.8,69129220.26,73877787.78,58252398.8,85868243.76,90491057.75,90741719.46,...
    93777205.52,93049818.7,87388246.45,67205474.93,70565742.24,74659423.37,73988188.13,...
    74615026.92,76152231.5,79252800.66,80219376.84,81279947.99]/10^6;
% abe_enteghali1=abe_enteghali'
% t5=table(abe_anteghali
istgah1=[157.24,128.1,123.36,98.79,112.16,37.36,70.27,38,47.3,37.55,77.14,95.15,89.86,77.51,83.41,90.98,27.04,77.11,64.14,78.8,108.72,40.08];
seilbargardane_gharb=[54.54;37.12;43.71;48.04;50.71;39.27;42;36.86;37.35;34.5;54.68;52.53;51.45;45.42;37.49;54.88;33.61;40.55;45.12;58.9;43.94;31.39];
abe_sathi_sen=zeros(max(teadade_gozine(1,:)),num_years);
abe_sathi_sen2=zeros(max(teadade_gozine(1,:)),num_years);
abe_sathi_farz=zeros(num_years,1);
%meghdar ab nofoozi az bastar roodkhane kan be abkhan
nofuze_kol_kan=[46.70734951,45.91036763,45.11523224,40.23232618,39.92135176,33.91497177,37.78594833,...
                     34.59386982,35.89781711,34.32984761,42.07336483,43.36619078,42.2749147,40.98776756,...
                     40.57792815, 42.83449232,31.88859217,39.57508768,38.2780409,42.37367529,43.82549201,...
                     34.3264769,33.85181034,40.02244703,36.35805556];

Temp=[25.91,26.78,26.65,27.22,27.32,28.5,27.82,28.03,27.6,27.73,28.85,27.7,...
        27.65,28.38,28.49,27.94,28.27,27.12,28.4,28.06,27.59,27.56,27.86,27.88,27.31];
%1-2-hajm ab dar dastars(hydrologic index)    
AVWATER = 10 ^ 6 * [672.27,567.24,670.08,558.85,506.28,324.47,506.3,280.18,291.27,229.99,493.65,663.01,...
                    602.14,596.4,570.34,627.08,329.4,470.55,528.7,518.14,598.07,405.45,316.44,427.7,543.07];
nesbate_nofuz=[0.4,0.6,0];
tasfie_2=5;

for n=1:tule_dore
abe_sathi_sen(1:4,n)=istgah1(n)+seilbargardane_gharb(n)-nofuze_kol_kan(n)*(nesbate_nofuz(1)+nesbate_nofuz(2))+tasfie_2;
abe_sathi_farz(n)=abe_sathi_sen(1,n);
end %ta inja faghat jaryanha jam shode baadn nofuze taghzie masnue va jaryane pasab kam va ezafe mishavad
global keshavarzi L
keshavarzi=[130.4;37.4];%niaze feali va na potansel az jadvale moshaver yekom
keshavarzi_potansiel=[134;83.3];
current_context=zeros(agent_number,agent_number,7,num_years); 
%% nofuze~~~~~~~~~
nesbate_nofuz=[0.4,0.6,0];%yani msn dar abkhane aval 0.4 az kole jazbe kan surat migirad
L=[7500;16000;12000];
K=[4.25;8.75;0.87];
b=[14250;15750;4000];%avalie b12 dovomi b23 sevomi b34
S_G=0.1;%zaribe zakhire abkhan
abe_z=zeros(4,num_years+1,3);%safhe sevom baiangare se nahie abkhan
sath=[78125000;242750000;133187500];%masahate har nahie abkhan
wh=zeros(2,3,num_years+1);
wh(1:2,1,1)=1174;
wh(1:2,2,1)=1058;
wh(1:2,3,1)=1001;
B=zeros(2,3,num_years+1);
Z_m=zeros(3,num_years+1);
rock=[1077;962;959;954.5];
dem(1)=1288;dem(2)=1116;dem(3)=1017;
for s=1:3
B(1:2,s,1)=7; 
Z_m(s,1)=dem(s)-wh(1,s,1);
end
for s=1:3
abe_z(1:4,1,s)=0.5*sath(s)*S_G/10^6;
end
nofuze_kashanak=4;
%% daneshe omumi
global shahrdari_kol_pasab keshavarzi_kol_gw shahrdari_kol_gw keshavarzi_kol_sathi
shahrdari_kol_pasab=[26.5,34.86,39.71;
                  11.57,14.57,16.22];              
shahrdari_kol_gw=[0,0,0; 
                  0,0,0];
keshavarzi_kol_sathi=[70,80,110;  %nahve mohasebe in parametr dar file excle b name 
                       5 , 5, 10];
keshavarzi_kol_gw=[0,50,65
                   18,37.4,40];                      
%% abe zirzamini
%abe zirzamini=hajme avalie+nofuz-bardasht
darsade_nofuze_baresh=0.135;
for i=1:5
nofuze_baresh=darsade_nofuze_baresh*(rain(i));
end
%% %%
nemune=zeros(tule_dore,1);
nemune_ehtemal=nemune;
serie_zamanie_jaryan=[101.55
164.43
293.34
371.21
398.50
411.77
417.47
419.25
423.12
423.66
433.39
446.87
458.74
478.89
485.95
492.88
509.28
530.78
534.36
535.6];

nemune(1)=abe_z(1,1,1) + abe_z(1,1,2) + abe_z(1,1,3) + abe_enteghali(1);

for i=1 %i shomare sale
 for ii=1:20 %teadadde seari zamani k fgt baraye 18 sal darim adad
    
    if nemune(i)>=serie_zamanie_jaryan(ii)
        if ii~=20 && nemune(i)<serie_zamanie_jaryan(ii+1)
        nemune_ehtemal(i)=(((ii+1)/21)*(nemune(i)-serie_zamanie_jaryan(ii))+((ii)/21)*(serie_zamanie_jaryan(ii+1)-nemune(i)))/(serie_zamanie_jaryan(ii+1)-serie_zamanie_jaryan(ii));
        end
    end
    if ii==1 && nemune(i)<serie_zamanie_jaryan(ii)
      nemune_ehtemal(i)=((ii/21)*(nemune(i)))/serie_zamanie_jaryan(ii);  
    elseif ii==20 && nemune(i)>=serie_zamanie_jaryan(ii)  
      nemune_ehtemal(i)=1;
    end
 end
 SWSI(i)=(nemune_ehtemal(i)*100-50)/12;
end
for i=1
   if SWSI(i)<-2
       noe_sal(i)=1;%sale khosh       
   elseif SWSI(i)<=+2 && SWSI(i)>=-2
       noe_sal(i)=2;%sale normal      
   else
       noe_sal(i)=3;%tar sali       
   end
end
%% population
Dimension=3;

for i=1:25%teadeade_sal
pop(1,i) = 441713 + 22051 * (i+20);%nahie 5
pop(2,i) = 173482 + 37.85 * (i+20);%nahie9
pop(3,i) = 283534 + 6456.6 * (i+20);%18
pop(4,i) = 188890 - 103.45 * (i+20);%21
pop(5,i) = 57525.77 * exp(0.056383 * (i+20));%22
pop(6,i) = 0.286 * (392271 + 7026 * (i+20));%eslamshahr    
end
%end
inf=0.1757;
for j=1:6%shomarande nahie
for n=1:25%shomarande sal
    %daramad khanevar
%gheimat ab khanegi 
ini_icncome = 443602000; income_Rate = inf * 100;
income(1,n) = ini_icncome * (1 + income_Rate/100) ^ n;
ini_PHO = 3600; PHO_Rate = 20;
price1(1,n) = ini_PHO * (1 + PHO_Rate/100) ^ n;
if 20 * 12 * price1(1,n) > 0.02 * income(1,n)
  price1(1,n) = (0.02 * income(1,n)) / (20 * 12);
end
price20(1,n) = price1(1,n) * 20;
price_year(1,n) = price20(1,n) * 12;
PRtoIN(1,n) = log10(price_year(1,n)/income(1,n));
%masrafe mahane ab shorbe khanevar(in formool az shabake asabi amade ast)
HWC(1,n) = (5.39165 * tansig((0.04365 * (-1 + 2 * (Temp(1,n) - 27.12)/ 1.73) + 0.10203 * (-1 + 2 * ((AVWATER(1,n) / 10 ^ 6) - 243.39) / 433.02)...
    + 0.08182 * (-1 + 2 * (Dimension - 3.02) / 1.18) - 0.09295 * (-1 + 2 * (PRtoIN(1,n) + 3.23481) / 0.8875)) + 0.24431)...
    + (-1.35900) + 1) * (3.4382 / 2) + 17.1838;
%niaze abi shorb har nafar dar yek mah bar hasb metr mokaab
DEUmp(1,n) = 1.35 * (HWC(1,n) / Dimension);        
shorb_nahie(j,n)=12*DEUmp(1,n)*pop(j,n)/(10^6); %ba vahede MCM       t
end
end
for n=1:25
shorb_kol(1,n)=shorb_nahie(1,n)+shorb_nahie(5,n)+shorb_nahie(4,n)*0.7;
shorb_kol(2,n)=shorb_nahie(2,n)+shorb_nahie(3,n)+0.3*shorb_nahie(4,n);
shorb_kol(3,n)=shorb_nahie(6,n);
end
for i=1:3%nahie abkhan
 for n=1:25%sal
       pasab_kol(i,n)=0.65*shorb_kol(i,n);%pasabe tolidi har nahie abkhan dar har sal
end 
end
for n=1:25
   pasab(1,n)=sum(pasab_kol(:,n)); 
end
%% pasab
% pasab_shahrakgharb = 35.40; pasab_mantaghe22 = 58.39; pasab_shomalgharb = 42.31 ; pasab_ekbatan = 5.20;
% pasab_gharb= 58.3; pasab_jonoobgharb = 36.66; 
% RWATER1 = pasab_shahrakgharb + pasab_mantaghe22 + pasab_shomalgharb + pasab_ekbatan;
% RWATER2 =  pasab_gharb + pasab_jonoobgharb;
% RWATER = RWATER1 + RWATER2;
for n=1:25
RWATER1(1,n)=(141.3/236.26)*(sum(pasab_kol(:,n)));
RWATER2(1,n)=(1-(141.3/236.26))*(sum(pasab_kol(:,n)));
end
%% social 
power=[3.1818  %abfa
       3.2727  %shahrdari
       2.8181  %keshavarzi
       2.6363  %sanaat
       4.0000]; %abe mantaghei
interest=[4.1818 %abfa
         3.6363  %shahrdari
         3.1818  %keshavarzi
         2.4545  %sanaat
         4.6363];%abe mantaghei
 ideal_interest=5;
%  taamol=[4;-1.2;2.4;-1.4;0];
%   taamol=[4;0;2.4;0;0];
 taamol=[3.6;2.2;2.6;-2;0];
 for j=1:5
    w(j)=2-(power(j)/power(5))-(interest(j)/interest(5));   %marbut b LC abe mantaghei   
    jarime(j)=1-(power(j)/power(5));  %marbut b jarimei k amel ha dar LC khodeshun b takhati midn
    beta(j)=(interest(j)/ideal_interest);
    beta(j)=beta(j)*(1/(1+(taamol(j)/5)));   
 end
 w(5)=1;
%w(3)=w(3)*0.1;fil
%% senario ha
abman=zeros(4,agent_number,7,num_years);%safheye 4 mishe sahm az RWATER1
% va safhe 7 baraye sahme afad az RWATER2
value_kol=zeros(agent_number,2,8,2);
value=zeros(agent_number,2,8);
maghadir_m1=zeros(agent_number,4,8,num_years);
%baiangare gozine haye harshakhs baraye khodash ast
% shomarande satrha baraye har amel1:abe amntaghei 2:abfa 3:shahrdari 4:
% keshvarzi
% sotun ha shomarandeye senario haye motafavete afdrad mibashad
%safhe sevom manande abman safe aval kole bardasht,safhe
%dovom abe sathi safe 3 meghdare bardasht az abe zirzamini va
%safhe4:meghdare bardasht az pasab va safhe 5:meghdare estefade az abe
%enteghali mibashad safhe 6:b surate 0 va yeki b estefade ya adame estefade
%az tarh haye modiriate masraf baraye abfa ra namayesh midahad

%% initialize,entekhabe maghadire avalie
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
%meghdari k harkasi kh:desh midune bar mabnaye unche az bala dastish daryaft karde k ta enteha baraye amele aval sefre chn un hichvaght daryatf nemikne
%satre aval threholde amele aval az gozinehaye amele dovomva satre dovom thresholde amele aval az gozine haye amele sevom
%satre aval threshold e amele dovom az gozine haye amele sevom
UB(1:agent_number,1)=inf;
ub_child(:,:)=inf;
fprintf('adopt')
LB1=zeros(max(teadade_gozine(1,:)),1);
UB1=LB1;
d=zeros(agent_number,2);
abman(:,12,1,:)=niaze_bagh;
abman(:,12,2,:)=niaze_bagh;
value(1,1,1,:)=1;
value(1,2,1,:)=1;
zarib_z=[0.1   %abfa
         0.35  %shahrdari
         0.35   %keshavarzi
         0.1  %taghzie masnue
         0.1 ];%sanat

bar_kol=zeros(4,3,tule_dore);     
enteghali2_1(1:2,1:tule_dore)=0;
enteghali3_1(1:2,1:tule_dore)=0;
enteghali3_2(1:2,1:tule_dore)=0;
enteghali_a_2_1(1:4,1:tule_dore)=0;
enteghali_a_3_1(1:4,1:tule_dore)=0;
enteghali_a_3_2(1:4,1:tule_dore)=0;
     
%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for n=1:tule_dore
     fprintf('   start of adopt   ')
     n
[t,t_child,UB,LB,lb_child,ub_child,terminate,LC,d,current_context]=start(t,t_child,UB,LB,lb_child,ub_child,...
    terminate,LC,d,n,current_context);
current_context;
 
[noe_sal,nemune_ehtemal,nemune]=taene_noe_sal(abe_z,abe_enteghali,n,serie_zamanie_jaryan,noe_sal,nemune_ehtemal,nemune);
[maghadir_m1,enteghali2_1,enteghali3_1,enteghali3_2,abfa_assume,enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,abman_assume,bar_kol]=senario(n,maghadir_m1...
    ,enteghali2_1,enteghali3_1,enteghali3_2,enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,bar_kol);

[price1,Real_Pr1,Real_Pr2,Real_PrE,PSTP,PGTP,POT,POTG,PIN,PLL,PRR,PRF,PRW,PEE1,PEE2,PEE3,PT]=taene_gheimat(n,DEUmp);

for a=2:16
   maghadir_m1(a,3:4,1:6,n)=200;    
end

for s=1:4
maghadir_m1(1,s,1,n)=s;
end

 for i=1
   value(i,1,:)=1;
   value(i,2,:)=1;
 end 
 
if noe_sal(n)==3
 max_taghzie(n)=max(abman(1:4,11,1,n))+max(abman(1:4,11,8,n))+max(abman(1:4,11,9,n))+max(abman(1:4,11,10,n)); 
 max_keshavarzi=sum(abman(1,9:10,1,n));
 min_keshavarzi=sum(abman(1,9:10,1,n));
 for i=2:4
  if max_keshavarzi<sum(abman(i,9:10,1,n))
  max_keshavarzi=sum(abman(i,9:10,1,n));    
  end
  if min_keshavarzi>sum(abman(i,9:10,1,n))
  min_keshavarzi=sum(abman(i,9:10,1,n));   
  end
 end
 
 min_taghzie(n)=min(abman(1:4,11,1,n))+min(abman(1:4,11,8,n))+min(abman(1:4,11,9,n))+min(abman(1:4,11,10,n));
 
elseif noe_sal(n)==2||noe_sal(n)==1
    
 max_taghzie(n)=max(abman(1:4,11,1,n))+max(abman(1:4,11,8,n))+max(abman(1:4,11,9,n))+max(abman(1:4,11,10,n)); 
 min_taghzie(n)=min(abman(1:3,11,1,n))+min(abman(1:3,11,8,n))+min(abman(1:3,11,9,n))+min(abman(1:3,11,10,n));
  
 max_keshavarzi=sum(abman(1,9:10,1,n));
 min_keshavarzi=sum(abman(1,9:10,1,n));
 for j=2:3
    if max_keshavarzi<sum(abman(j,9:10,1,n))
       max_keshavarzi=sum(abman(j,9:10,1,n));
    end
    if min_keshavarzi>sum(abman(j,9:10,1,n))
       min_keshavarzi=sum(abman(j,9:10,1,n));   
    end
 end
end

 for i=1   
  for j=1:teadade_gozine(1,noe_sal(n))   
   j;
 LC(i,j)= w(3)*(sum(abman(j,9:10,1,n))-min_keshavarzi)/(max_keshavarzi-min_keshavarzi)...%keshavarzi
 +w(4)*(sum(sanat(1:2))-sum(abman(j,13:14,1,n)) + sum(abman(j,13:14,3,n)))/(sum(sanat(1:2)))... %sanat 
 -w(5)*((abman(j,11,1,n)+abman(j,11,8,n)+abman(j,11,9,n)+abman(j,11,10,n)-min_taghzie(n))/(max_taghzie(n)-min_taghzie(n)))... %taghzie        
 +w(1)*((sum(abman(j,1:6,1,n))-0.95*sum(shorb_nahie(1:6,n)))/(0.05*sum(shorb_nahie(1:6,n))))...%abfa
 +w(2)*(((abs(abman(j,7,1,n)-(niaze_sabz(1,1)+0.5*(sum(niaze_sabz(1,2:3))))))/(sum(niaze_sabz(1,1:3))-niaze_sabz(1,1)))+...
 (abs(abman(j,8,1,n)-(niaze_sabz(2,1)+0.5*(sum(niaze_sabz(2,2:3))))))/(sum(niaze_sabz(2,1:3))-niaze_sabz(2,1)));%shahrdari

 LC1(i,j,n)=LC(i,j);
  end
 dd=zeros(teadade_gozine(i,noe_sal(n)),1); 
%  fprintf('kkkkkkk')
for s=1:teadade_gozine(i,noe_sal(n))-1 
    s;
%     fprintf('kkkkkkk22')
    for e=s+1:teadade_gozine(i,noe_sal(n))
        e;
  if LC(i,s)==LC(i,e)
   dd(s)=1;
   dd(e)=1 ;    
  end
    end
end   

dd;
sum(dd(:))
if sum(dd(:))>=2 
    for j=1:teadade_gozine(1,noe_sal(n))
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
    LC(i,min_j)=LC(i,min_j)-0.0002; 
      fprintf('kam shodane LC ba tasavi')  
     elseif bbb>1
     min_j=find(bardashte_abe_zirzamini(1,:)==min_b);
     LC(i,min_j(1))=LC(i,min_j(1))-0.0002;
      fprintf('kam shodane LC ba tasavi22222')
     end
end
% samaneh2222=bardashte_abe_zirzamini(1,:)
LC;
  LB1=zeros(teadade_gozine(i,noe_sal(n)),1); 
  UB1=LB1;
  for j=1:teadade_gozine(i,noe_sal(n))
   LB1(j)=LC(i,j)+sum(lb_child(i+1:agent_number,j));
     if LB1(j)~=0
   UB1(j)=LC(i,j)+sum(ub_child(i+1:agent_number,j));
     end
  end   
LB(i)=min(LB1(1:teadade_gozine(1,noe_sal(n)))); 
UB(i)=min(UB1(1:teadade_gozine(1,noe_sal(n))));
UB1;
LB1;

a1=min(LB1(1:teadade_gozine(i,noe_sal(n))));
   bb=0;aa=0;
for g=1:teadade_gozine(i,noe_sal(n))
   if LB1(g)==a1
       bb=bb+1;
       aa=g;
   end
end
if bb==1
   d(i,1)=find(LB1(1:teadade_gozine(i,noe_sal(n)))==LB(i));
else
  d(i,1)=aa;  
end
 d(1,2)=d(i,1); 
d(i,1); 
maghadir_m1(1,d(i,1),1,n);

value(i,1,:)=maghadir_m1(1,d(i,1),1,n);
value(i,2,1)=value(i,1,1);
value;
if terminate(1,n)~=1
[t,~]=maintainThresholdInvariant(t,LB,UB,i);

[LB,UB,current_context,t,k,LC,t_child,lb_child,ub_child,d]=backtrack(t,UB,LB...
,current_context,i,LC,d,t_child,lb_child,ub_child,maghadir_m1,n);
end
 end
% fprintf('    end of adopt      ')
if terminate(1,n)~=1
fprintf('   erooooooooooooooorrrrrrr      ')
end
value(:,:,1);
for m=1:agent_number
value_kol(m,1:2,1:6,n)=value(m,1:2,1:6);
end


 [B,wh]=bilan(n,rock,sath,value_kol,nofuze_kol_kan,nesbate_nofuz,rain,L,K,loss_rate,b,B,wh,S_G,maghadir_m1...
     ,enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,bar_z);
 [C1,C2,C3,Bm1,Bm2,Bm3]=keifi_senario_bartar(i,abe_z,nofuze_kol_kan,wh,B,enteghali_a_2_1,enteghali_a_3_1,enteghali_a_3_2,value_kol,b,tule_dore);
  update_daneshe_omumi(n,value_kol)
end
toc
current_context;
LC;
value(:,:,1);
terminate;
UB;
LB;
t;
d;
names1=zeros(tule_dore,1);

filename= 'finalabs11.xlsx';   
for m=1:tule_dore
    abmantaghei(m,1)=value_kol(1,1,1,m);
   for s=1:6 %shomarande amel haye abfa
    abfa(m,s)=value_kol(s+1,2,1,m);
    abfa(m,s+6)=value_kol(s+1,1,1,m);
   end
end
nahie_5(1:20,1)=abfa(:,1);
nahie_9(1:20,1)=abfa(:,2);
nahie_18(1:20,1)=abfa(:,3);
nahie_21(1:20,1)=abfa(:,4);
nahie_22(1:20,1)=abfa(:,5);
nahie_eslm(1:20,1)=abfa(:,6);

nahie_5(1:20,2)=abfa(:,7);
nahie_9(1:20,2)=abfa(:,8);
nahie_18(1:20,2)=abfa(:,9);
nahie_21(1:20,2)=abfa(:,10); 
nahie_22(1:20,2)=abfa(:,11);
nahie_eslm(1:20,2)=abfa(:,12);

%% etmame barname, shoru tahlil va chape dade ha 
V_1=table(value_kol(:,1:2,1,1),value_kol(:,1:2,1,2),value_kol(:,1:2,1,3),value_kol(:,1:2,1,4),value_kol(:,1:2,1,5)...
    ,value_kol(:,1:2,1,6),value_kol(:,1:2,1,7),value_kol(:,1:2,1,8),value_kol(:,1:2,1,9),value_kol(:,1:2,1,10),value_kol(:,1:2,1,11)...
    ,value_kol(:,1:2,1,12),value_kol(:,1:2,1,13),value_kol(:,1:2,1,14),value_kol(:,1:2,1,15),value_kol(:,1:2,1,16),value_kol(:,1:2,1,17)...
    ,value_kol(:,1:2,1,18),value_kol(:,1:2,1,19),value_kol(:,1:2,1,20));

V_2=table(value_kol(:,1:2,2,1),value_kol(:,1:2,2,2),value_kol(:,1:2,2,3),value_kol(:,1:2,2,4),value_kol(:,1:2,2,5)...
    ,value_kol(:,1:2,2,6),value_kol(:,1:2,2,7),value_kol(:,1:2,2,8),value_kol(:,1:2,2,9),value_kol(:,1:2,2,10),value_kol(:,1:2,2,11)...
    ,value_kol(:,1:2,2,12),value_kol(:,1:2,2,13),value_kol(:,1:2,2,14),value_kol(:,1:2,2,15),value_kol(:,1:2,2,16),value_kol(:,1:2,2,17)...
    ,value_kol(:,1:2,2,18),value_kol(:,1:2,2,19),value_kol(:,1:2,2,20));

V_3=table(value_kol(:,1:2,3,1),value_kol(:,1:2,3,2),value_kol(:,1:2,3,3),value_kol(:,1:2,3,4),value_kol(:,1:2,3,5)...
    ,value_kol(:,1:2,3,6),value_kol(:,1:2,3,7),value_kol(:,1:2,3,8),value_kol(:,1:2,3,9),value_kol(:,1:2,3,10),value_kol(:,1:2,3,11)...
    ,value_kol(:,1:2,3,12),value_kol(:,1:2,3,13),value_kol(:,1:2,3,14),value_kol(:,1:2,3,15),value_kol(:,1:2,3,16),value_kol(:,1:2,3,17)...
    ,value_kol(:,1:2,3,18),value_kol(:,1:2,3,19),value_kol(:,1:2,3,20));
 
V_4=table(value_kol(:,1:2,4,1),value_kol(:,1:2,4,2),value_kol(:,1:2,4,3),value_kol(:,1:2,4,4),value_kol(:,1:2,4,5)...
    ,value_kol(:,1:2,4,6),value_kol(:,1:2,4,7),value_kol(:,1:2,4,8),value_kol(:,1:2,4,9),value_kol(:,1:2,4,10),value_kol(:,1:2,4,11)...
    ,value_kol(:,1:2,4,12),value_kol(:,1:2,4,13),value_kol(:,1:2,4,14),value_kol(:,1:2,4,15),value_kol(:,1:2,4,16),value_kol(:,1:2,4,17)...
    ,value_kol(:,1:2,4,18),value_kol(:,1:2,4,19),value_kol(:,1:2,4,20));
%.....................................................

A_1=table(abman(1,:,1,1)',abman(1,:,1,2)',abman(1,:,1,3)',abman(1,:,1,4)',abman(1,:,1,5)'...
    ,abman(1,:,1,6)',abman(1,:,1,7)',abman(1,:,1,8)',abman(1,:,1,9)',abman(1,:,1,10)',abman(1,:,1,11)'...
    ,abman(1,:,1,12)',abman(1,:,1,13)',abman(1,:,1,14)',abman(1,:,1,15)',abman(1,:,1,16)',abman(1,:,1,17)'...
    ,abman(1,:,1,18)',abman(1,:,1,19)',abman(1,:,1,20)');

A_2=table(abman(1,:,2,1)',abman(1,:,2,2)',abman(1,:,2,3)',abman(1,:,2,4)',abman(1,:,2,5)'...
    ,abman(1,:,2,6)',abman(1,:,2,7)',abman(1,:,2,8)',abman(1,:,2,9)',abman(1,:,2,10)',abman(1,:,2,11)'...
    ,abman(1,:,2,12)',abman(1,:,2,13)',abman(1,:,2,14)',abman(1,:,2,15)',abman(1,:,2,16)',abman(1,:,2,17)'...
    ,abman(1,:,2,18)',abman(1,:,2,19)',abman(1,:,2,20)');

A_3=table(abman(1,:,3,1)',abman(1,:,3,2)',abman(1,:,3,3)',abman(1,:,3,4)',abman(1,:,3,5)'...
    ,abman(1,:,3,6)',abman(1,:,3,7)',abman(1,:,3,8)',abman(1,:,3,9)',abman(1,:,3,10)',abman(1,:,3,11)'...
    ,abman(1,:,3,12)',abman(1,:,3,13)',abman(1,:,3,14)',abman(1,:,3,15)',abman(1,:,3,16)',abman(1,:,3,17)'...
    ,abman(1,:,3,18)',abman(1,:,3,19)',abman(1,:,3,20)');
 
A_4=table(abman(1,:,4,1)',abman(1,:,4,2)',abman(1,:,4,3)',abman(1,:,4,4)',abman(1,:,4,5)'...
    ,abman(1,:,4,6)',abman(1,:,4,7)',abman(1,:,4,8)',abman(1,:,4,9)',abman(1,:,4,10)',abman(1,:,4,11)'...
    ,abman(1,:,4,12)',abman(1,:,4,13)',abman(1,:,4,14)',abman(1,:,4,15)',abman(1,:,4,16)',abman(1,:,4,17)'...
    ,abman(1,:,4,18)',abman(1,:,4,19)',abman(1,:,4,20)');

% 
% namha=["ab5";"ab9";"ab18";"ab21";"ab22";"ab_eslam";"shahr1";"shahr2";"kesh2";"kesh3";"taghzie";...
%     "bagh";"sanat1";"sanat2";"sanat3";"---","----"];
formatted_decision=zeros(tule_dore,1);
for i=1:tule_dore
 if noe_sal(i)==1
   formatted_decision(i)=value_kol(1,1,1,i)+7;  
 elseif noe_sal(i)==2
   formatted_decision(i)=value_kol(1,1,1,i)+4;      
 else
   formatted_decision(i)=value_kol(1,1,1,i); 
 end  
end
for i=1:tule_dore
enteghali21(i,1)=enteghali2_1(value_kol(2,2,1,i),i);
enteghali31(i,1)=enteghali3_1(value_kol(2,2,1,i),i);
enteghali32(i,1)=enteghali3_2(value_kol(2,2,1,i),i);
end
first_aquifer=abe_z(1,1:tule_dore,1)';
second_aquifer=abe_z(1,1:tule_dore,2)';
third_aquifer=abe_z(1,1:tule_dore,3)';
type_of_year=noe_sal(1:tule_dore)';

first_two=abe_z(1,1:tule_dore,1)'+abe_z(1,1:tule_dore,2)';
all=abe_z(1,1:tule_dore,1)'+abe_z(1,1:tule_dore,2)'+abe_z(1,1:tule_dore,3)';
time=zeros(tule_dore,1);
for i=1:tule_dore
    time(i,1)=i; 
end
enteghali(1:tule_dore,1)=abe_enteghali(1,1:tule_dore)';
first_tow_enteghali=first_two(1:tule_dore,1)+enteghali(1:tule_dore,1);


S1=table(time,type_of_year,formatted_decision,nahie_5,nahie_9,nahie_18,nahie_21,nahie_22,nahie_eslm);


T2=table(time,type_of_year,formatted_decision,first_aquifer,enteghali21,enteghali31,second_aquifer,enteghali32,third_aquifer,first_two,all,...
    enteghali,first_tow_enteghali);


t4=table(abman(1,:,3,1)',abman(1,:,3,2)',abman(1,:,3,3)',abman(1,:,3,4)',abman(1,:,3,5)'...
    ,abman(1,:,3,6)',abman(1,:,3,7)',abman(1,:,3,8)',abman(1,:,3,9)',abman(1,:,3,10)',abman(1,:,3,11)'...
    ,abman(1,:,3,12)',abman(1,:,3,13)',abman(1,:,3,14)',abman(1,:,3,15)',abman(1,:,3,16)',abman(1,:,3,17)'...
    ,abman(1,:,3,18)');

% delete(filename);
% writetable(V_1,filename,'Sheet',3,'Range','A1');
% writetable(V_2,filename,'Sheet',3,'Range','B20');
% writetable(V_3,filename,'Sheet',3,'Range','B40');
% writetable(V_4,filename,'Sheet',3,'Range','B60');
% writetable(A_1,filename,'Sheet',4,'Range','B1');
% writetable(A_2,filename,'Sheet',4,'Range','B20');
% writetable(A_3,filename,'Sheet',4,'Range','B40');
% writetable(A_4,filename,'Sheet',4,'Range','B60');
% writetable(T2,filename,'Sheet',2,'Range','B1')
% writetable(t4,filename,'Sheet',1,'Range','B40') 
% writetable(t4,filename,'Sheet',1,'Range','B40') 
% writetable(S1,filename,'Sheet',1,'Range','A1') 

count1 = timeseries(noe_sal(1:tule_dore));
%% shekl ha
  figures(formatted_decision,value_kol)
 gwater=zeros(tule_dore,4);
 gwater(:,1)=1:tule_dore;
 gwater(:,2)=noe_sal(1:tule_dore); 
 for i=1:3
    gwater(:,i+2)=abe_z(1,1:tule_dore,i);
 end
ss=fopen('toPlotInPython.txt','w');
fprintf(ss,'%6s %10s %10s %10s %10s\n', 'years','Annual_type','1st_Aquifer','2nd_Aquifer','3rd_Aquifer'); 
fprintf(ss,'%6.3f %10.3f %10.3f %10.3f %10.3f\n',gwater');
fclose(ss);
gwater2=gwater;
gwater2(:,5)=abe_enteghali(1:tule_dore);
ss2=fopen('toPlotInPython2.txt','w');
fprintf(ss2,'%6s %10s %10s %10s %10s\n', 'years','Annual_type','1st_Aquifer','2nd_Aquifer','transfered_water'); 
fprintf(ss2,'%6.3f %10.3f %10.3f %10.3f %10.3f\n',gwater2');
fclose(ss2)
 
 

 