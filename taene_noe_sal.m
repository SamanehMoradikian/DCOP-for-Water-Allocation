function [noe_sal,nemune_ehtemal,nemune]=taene_noe_sal(abe_z,abe_enteghali,n,serie_zamanie_jaryan,noe_sal,nemune_ehtemal,nemune)

nemune(n)=abe_enteghali(n)+abe_z(1,n,1)+abe_z(1,n,2)+abe_z(1,n,3);

for i=n %i shomare sale
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

for i=n
   if SWSI(i)<-2
       noe_sal(i)=1;%sale khosh       
   elseif SWSI(i)<=+2 && SWSI(i)>=-2
       noe_sal(i)=2;%sale normal      
   else
       noe_sal(i)=3;%tar sali       
   end
end
end