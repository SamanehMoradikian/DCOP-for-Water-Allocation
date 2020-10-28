function[price1,Real_Pr1,Real_Pr2,Real_PrE,PSTP,PGTP,POT,POTG,PIN,PLL,PRR,PRF,PRW,PEE1,PEE2,PEE3,PT]=taene_gheimat(i,sarane_shorb)
global Temp AVWATER
%dadehaye avalie az modele aghaye abdolhay
Dimension=3;
PSTP_Rate = 40;
PGTP_Rate = 40;
POT_Rate = 40;
POTG_Rate = 40;
PIN_Rate = 40;
PLL_Rate = 40;
PRR_Rate = 40;
PRF_Rate = 40;
PRW_Rate = 40;
PEE_or_PT_Rate1 = 40;
PEE_or_PT_Rate2 = 40;
PEE_or_PT_Rate3 = 40;
%zarib bayan konnade mizan sood morede nazare sherkat ab mantagheei
TW_BR = 1.2;
%zarib bayan konnade mizan sood morede nazare sherkat bargh
EL_BR = 1.2;
%zarib bayan konnade mizan sood morede nazare sherkat ab va fazelab
TP_BR = 1.4;
%tavarrom
inf = 0.1757;
%1-gheimat vagheei(tamam shode) yek metr mokaab ab baraye masaref shorb va chitgar va sanat dar sal paye
Real_Pr1 = 12000;
%2-gheimat vagheei(tamam shode) yek metr mokaab ab baraye masaref keshavarzi va fazaye sabz dar sal paye
Real_Pr2 = 7500;
%3-gheimat vagheei(tamam shode) yek metr mokaab pasab dar sal paye
Real_Pr3 = 15000;
%4-gheimat vagheei(tamam shode) yek kwh bargh dar sal paye
Real_PrE = 3000;
%5-gheimat yek metr mokaab ab sathi baraye niaz shorb
ini_PSTP = 3500;
if (ini_PSTP * (1 + PSTP_Rate / 100) ^ i) <= (TW_BR * Real_Pr1 * (1 + inf)^ i)
    PSTP(1,i) = (ini_PSTP * (1 + PSTP_Rate / 100) ^ i);
else
    PSTP(1,i) = (TW_BR * Real_Pr1 * (1 + inf)^ i);
end
%6-gheimat yek metr mokaab ab zirzamini baraye niaz shorb
ini_PGTP = 3500;
if (ini_PGTP * (1 + PGTP_Rate / 100) ^ i) <= (TW_BR * Real_Pr1 * (1 + inf)^ i)
    PGTP(1,i) = (ini_PGTP * (1 + PGTP_Rate / 100) ^ i);
else
    PGTP(1,i) = (TW_BR * Real_Pr1 * (1 + inf)^ i);
end
%7-gheimat yek metr mokaab ab baraye masaref keshavarzi
ini_POT = 110;
if (ini_POT * (1 + POT_Rate / 100) ^ i) <= (TW_BR * Real_Pr2 * (1 + inf)^ i)
    POT(1,i) = (ini_POT * (1 + POT_Rate / 100) ^ i);
else
    POT(1,i) = (TW_BR * Real_Pr2 * (1 + inf)^ i);
end
%8-gheimat yek metr mokaab ab baraye masaref fazaye sabz va keshavarzi
ini_POTG = 2500;
if (ini_POTG * (1 + POTG_Rate / 100) ^ i) <= (TW_BR * Real_Pr2 * (1 + inf)^ i)
    POTG(1,i) = (ini_POTG * (1 + POTG_Rate / 100) ^ i);
else
    POTG(1,i) = (TW_BR * Real_Pr2 * (1 + inf)^ i);
end
%9-gheimat yek metr mokaab ab baraye masaref sanati
ini_PIN = 6000;
if (ini_PIN * (1 + PIN_Rate / 100) ^ i) <= (TW_BR * Real_Pr1 * (1 + inf)^ i)
    PIN(1,i) = (ini_PIN * (1 + PIN_Rate / 100) ^ i);
else
    PIN(1,i) = (TW_BR * Real_Pr1 * (1 + inf)^ i);
end
%10-gheimat avvalie yek metr mokaab ab takhsis dade shode be daryache chitgar
ini_PLL = 12000;
if (ini_PLL * (1 + PLL_Rate / 100) ^ i) <= (TW_BR * Real_Pr1 * (1 + inf)^ i)
    PLL(1,i) = (ini_PLL * (1 + PLL_Rate / 100) ^ i);
else
    PLL(1,i) = (TW_BR * Real_Pr1 * (1 + inf)^ i);
end
%11-gheimat foroosh yek metr mokaab pasab be shahrdari
ini_PRR = 5000;
if (ini_PRR * (1 + PRR_Rate / 100) ^ i) <= (TW_BR * Real_Pr3 * (1 + inf)^ i)
    PRR(1,i) = (ini_PRR * (1 + PRR_Rate / 100) ^ i);
else
    PRR(1,i) = (TW_BR * Real_Pr3 * (1 + inf)^ i);
end
%12-gheimat foroosh yek metr mokaab pasab be keshavarz
ini_PRF = 440;
if (ini_PRF * (1 + PRF_Rate / 100) ^ i) <= (TW_BR * Real_Pr3 * (1 + inf)^ i)
    PRF(1,i) = (ini_PRF * (1 + PRF_Rate / 100) ^ i);
else
    PRF(1,i) = (TW_BR * Real_Pr3 * (1 + inf)^ i);
end
%13-gheimat foroosh yek metr mokaab pasab be sanat
ini_PRW = 8000;
if (ini_PRW * (1 + PRW_Rate / 100) ^ i) <= (TW_BR * Real_Pr3 * (1 + inf)^ i)
    PRW(1,i) = (ini_PRW * (1 + PRW_Rate / 100) ^ i);
else
    PRW(1,i) = (TW_BR * Real_Pr3 * (1 + inf)^ i);
end
%14-hazine pompaj yek metr mokaab ab be meizan yek metr dar keshavarzi
ini_PEE1 = 121 * (0.0027778 / 0.7);
if (ini_PEE1 * (1 + PEE_or_PT_Rate1 / 100) ^ i) <= (EL_BR * Real_PrE * (1 + inf)^ i)
    PEE1(1,i) = (ini_PEE1 * (1 + PEE_or_PT_Rate1 / 100) ^ i);
else
    PEE1(1,i) = (EL_BR * Real_PrE * (1 + inf)^ i);
end
%15-hazine pompaj yek metr mokaab ab be meizan yek metr dar sanat
ini_PEE2 = 721 * (0.0027778 / 0.7);
if (ini_PEE2 * (1 + PEE_or_PT_Rate2 / 100) ^ i) <= (EL_BR * Real_PrE * (1 + inf)^ i)
    PEE2(1,i) = (ini_PEE2 * (1 + PEE_or_PT_Rate2 / 100) ^ i);
else
    PEE2(1,i) = (EL_BR * Real_PrE * (1 + inf)^ i);
end
%16-hazine pompaj yek metr mokaab ab be meizan yek metr dar abfa
ini_PEE3 = 293 * (0.0027778 / 0.7);
if (ini_PEE3 * (1 + PEE_or_PT_Rate3 / 100) ^ i) <= (EL_BR * Real_PrE * (1 + inf)^ i)
    PEE3(1,i) = (ini_PEE3 * (1 + PEE_or_PT_Rate3 / 100) ^ i);
else
    PEE3(1,i) = (EL_BR * Real_PrE * (1 + inf)^ i);
end
%17-hazine enteghal yek metr mokaab ab be nahie ba tarz yek metr balatar
ini_PT = 293 * (0.0027778 / 0.7);
if (ini_PT * (1 + PEE_or_PT_Rate2 / 100) ^ i) <= (EL_BR * Real_PrE * (1 + inf)^ i)
    PT(1,i) = (ini_PT * (1 + PEE_or_PT_Rate2 / 100) ^ i);
else
    PT(1,i) = (EL_BR * Real_PrE * (1 + inf)^ i);
end


%% gheimate ab dar harsal baraye khanevar
%boade har khanevade
dimension=3;
%masrafe mahane ab shorbe khanevar(in formool az shabake asabi amade ast)
ini_icncome = 443602000; income_Rate = inf * 100;
income(1,i) = ini_icncome * (1 + income_Rate/100) ^ i;
ini_PHO = 3600; PHO_Rate = 50;
price1(1,i) = ini_PHO * (1 + PHO_Rate/100) ^ i;
if 20 * 12 * price1(1,i) > 0.02 * income(1,i)
   price1(1,i) = (0.02 * income(1,i)) / (20 * 12);
end
price20(1,i) = price1(1,i) * 20;
price_year(1,i) = price20(1,i) * 12;
PRtoIN(1,i) = log10(price_year(1,i)/income(1,i));
HWC(1,i) = (5.39165 * tansig((0.04365 * (-1 + 2 * (Temp(1,i) - 27.12)/ 1.73) + 0.10203 * (-1 + 2 * ((AVWATER(1,i) / 10 ^ 6) - 243.39) / 433.02)...
    + 0.08182 * (-1 + 2 * (Dimension - 3.02) / 1.18) - 0.09295 * (-1 + 2 * (PRtoIN(1,i) + 3.23481) / 0.8875)) + 0.24431)...
    + (-1.35900) + 1) * (3.4382 / 2) + 17.1838;
%niaze abi shorb har nafar dar yek mah bar hasb metr mokaab
sarane_shorb(1,i) = 1.35 * (HWC(1,i) / Dimension);

end