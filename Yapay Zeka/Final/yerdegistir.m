function yenibesin=yerdegistir(besin,indis1,indis2)
yenibesin=besin;
bosdegisken=yenibesin(indis1);
yenibesin(indis1)=yenibesin(indis2);
yenibesin(indis2)=bosdegisken;
end