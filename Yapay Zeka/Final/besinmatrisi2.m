function matris=besinmatrisi2(besinsayisi,sehirsayisi)
matris=[];
for i=1:besinsayisi
    elemanlarifarklidizi=randperm(sehirsayisi);
    matris=[matris;elemanlarifarklidizi];
end