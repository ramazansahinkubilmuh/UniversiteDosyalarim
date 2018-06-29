function uzaklik=amacfonksiyonu(besin,ilmesafe,sehirsayisi)
ustlimit=(sehirsayisi-1);
uzaklik=0;
for i=1:ustlimit
    yeniuzaklik=ilmesafe(besin(i),besin(i+1));
    uzaklik=uzaklik+yeniuzaklik;
end
yeniuzaklik=ilmesafe(besin(i+1),besin(1));
uzaklik=uzaklik+yeniuzaklik;