function yenibesin=solakaydir(besin,indis1,indis2)
yenibesin=besin;
kucuk=min(indis1,indis2);
buyuk=max(indis1,indis2);
ilkeleman=yenibesin(kucuk);
for i=kucuk:(buyuk-1)
    yenibesin(i)=yenibesin(i+1);
end
yenibesin(buyuk)=ilkeleman;