function [sonucbesin,sonuccozumdegeri]=yerelarama1(besin,cozumdegeri,ilmesafe,sehirsayisi)
sonucbesin=besin;
sonuccozumdegeri=cozumdegeri;
for i=1:length(sonucbesin)-1
    for j=1:length(sonucbesin)
        yenibesin=solakaydir(sonucbesin,i,j);
        yeniamacfonksiyonu=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
        if yeniamacfonksiyonu<sonuccozumdegeri
            sonuccozumdegeri=yeniamacfonksiyonu;
            sonucbesin=yenibesin;
        end
    end
end
