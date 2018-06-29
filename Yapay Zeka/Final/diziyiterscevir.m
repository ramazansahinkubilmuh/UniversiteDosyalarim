function yenibesin=diziyiterscevir(besin,indis1,indis2)
yenibesin=besin;
kucuk=min(indis1,indis2);
buyuk=max(indis1,indis2);
while kucuk<buyuk
    bosdegisken=yenibesin(kucuk);
    yenibesin(kucuk)=yenibesin(buyuk);
    yenibesin(buyuk)=bosdegisken;
    kucuk=kucuk+1;
    buyuk=buyuk-1;
end