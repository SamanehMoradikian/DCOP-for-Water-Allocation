function[Fa_gr_pr1,Fa_gr_pr2,Fa_gr_pr3]=keshavarzi(i)
global sath
%mizan gandom tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m1 = 0.630;
%mizan jo tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m2 = 0.700;
%mizan yonje tolid shode bar hasb kg be ezaye masraf yek metr mokaab ab
Fa_gr_m3 = 1.090;inf = 0.1757;
%gheimate tazmini kharid yek kg gandom (rial bar kg)
Fa_gr_pr1(1,i) = 12705 * (1+inf) ^ i;
%gheimate tazmini kharid yek kg jo (rial bar kg)
Fa_gr_pr2(1,i) = 10028 * (1+inf) ^ i;
%gheimate tazmini kharid yek kg yonje (rial bar kg)
Fa_gr_pr3(1,i) = 7700 * (1+inf) ^ i;
%amalkard gandom(kg/hec)
eff1 = 5352;
%amalkard jo(kg/hec)
eff2 = 3840;
%amalkard yonje(kg/hec)
eff3 = 12000;
DG=0.46; DJ=0.34;DY=0.18;%sahm az kole arazi
%amalkard gandom(kg/hec)
eff1 = 5352;
%amalkard jo(kg/hec)
eff2 = 3840;
%amalkard yonje(kg/hec)
eff3 = 12000;

%daramad_keshavarz=((DG*eff1*(1/Fa_gr_m1))*Fa_gr_pr1(1,i)+(DJ*eff2*(1/Fa_gr_m2))*Fa_gr_pr2(1,i)+(DY*eff3*(1/Fa_gr_m3))*Fa_gr_pr3(1,i))*(sum(sath(2:3)));

end