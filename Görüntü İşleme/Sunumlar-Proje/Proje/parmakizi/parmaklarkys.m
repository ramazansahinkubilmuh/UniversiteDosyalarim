function [oran]=parmaklarkys(a,b)%fonksiyon oluşturulur.
deger1=parmakla(a);%ilk resim oluşturulup değer1 e atanır
figure %gösterilir
deger2=parmakla(b); %2. resim oluşturulup değer2 e atanır
fark = abs(deger1-deger2);% değer1 ve deger2 nin mutlak değeri alınır ve fark ismine atanır.
k=100-(fark*100/deger2);
if(k<99)
    k=abs(k-50);
end
oran=k; %oran yani fonksiyon ile hesaplanan değer eşitlenir