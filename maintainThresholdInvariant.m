function[t,k]=maintainThresholdInvariant(t,LB,UB,k)
%fprintf('maintainThresholdInvariant')
k;
if t(k)<LB(k)
    t(k)=LB(k);
end
if t(k)>UB(k)
    t(k)=UB(k);
end
%fprintf('     end of maintain Threshold')
end