function var=icindemevcutmu(dizi,aranandeger)
var=0;
for i=1:length(dizi)
    if dizi(i)==aranandeger
        var=i;
        break;
    end
end 