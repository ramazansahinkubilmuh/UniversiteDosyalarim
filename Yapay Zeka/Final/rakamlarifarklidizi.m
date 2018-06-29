function dizi=rakamlarifarklidizi(aralik,altlimit,ustlimit)
if aralik>=1 && aralik<=(ustlimit-altlimit+1)
    dizi=[];
    for i=1:aralik
        rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        while icindemevcutmu(dizi,rastgelesayi)
            rastgelesayi=round(altlimit+(ustlimit-altlimit)*rand(1));
        end
        dizi(i)=rastgelesayi;
    end
else
    disp('hata');
end
            
