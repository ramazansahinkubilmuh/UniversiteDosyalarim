function ff = kontrol(ResimOrijinal, ResimGelen);                 % parametre ile dýþarýdan iki adet görüntü dosyasý ismi alýnýyor
Rorj = imread(ResimOrijinal);                                     % Rorj (orijinal ürün) deðiþkenine 1.parametredeki ismin görüntüsü aktarýlýyor
Rgel = imread(ResimGelen);                                        % Rgel (kontrol edilecek ürün) deðiþkenine 2.parametredeki ismin görüntüsü aktarýlýyor
[y,g,r] = size(Rorj);                                             % Orijinal ürüne ait yükseklik, geniþlik ve kullanýlan renk katmaný deðerleri alýnýyor 
ToplamPiksel = y*g*r;                                             % Görüntüye hata oranýný hesaplayabilmek için gereken ToplamPiksel bilgisi hesaplanýyor 
HataliPiksel = 0;                                                 % HatalýPiksel bilgili baþlangýçta sýfýra eþitleniyor 
Rson = Rgel;                                                      % Rson (sonuç görüntüsü) Rgel'den aktarýlýyor
subplot(1,3,1); imshow(Rorj);title('Orijinal Ürün');              % Orijinal ürün görüntüleniyor
xlabel(ResimOrijinal);                                            % Orijinal ürüne ait görüntü dosyasýnýn ismi görüntüleniyor
subplot(1,3,2); imshow(Rgel);title('Kontrol Edilen Ürün');        % Kontrol edilecek ürün görüntüleniyor
xlabel(ResimGelen);                                               % Kontrol edilecek ürüne ait görüntü dosyasýnýn ismi görüntüleniyor
                                                                  % Ýki ürün arasýndaki her bir piksel karþýlýklý olarak eþitlik kontrolü yapýlacak   
for satir=1:y                                                     % satir deðiþkeni 1'den y (yükseklik) deðerine kadar döngüye sokuluyor  
    for sutun=1:g                                                 % sutun deðiþkeni 1'den g (geniþlik) deðerine kadar döngüye sokuluyor  
        PikselHatali = false;                                     % Baþlangýç olarak kontrol edilecek pikselde hata olmadýðý farzediliyor  
        for renk=1:r                                              % renk deðiþkeni 1'den r (renk katmaný) deðerine kadar döngüye sokuluyor  
            if Rorj(satir,sutun,renk) ~= Rgel(satir,sutun,renk)   % Orijinal görüntü ile kontrol edilecek görüntünün ayný koordinatlarýnýn birbirinden farklý olmasý durumunda  
                PikselHatali = true;                              % pikselin hatalý olduðu anlaþýlýyor
            end
        end
        if PikselHatali == false                                  % Pikselde hata bulunmamýþsa 
            for renk=1:r                                          % iþaretleme yapmak için renk döngümüz tekrar oluþturuluyor
                Rson(satir,sutun,renk) = 0;                       % kontrol edilen koordinat deðeri sonuç görüntüsünde  0 (siyah)'a eþitleniyor
            end
        else
            HataliPiksel = HataliPiksel+r;                        % Pikselde hata bulunmuþsa HataliPiksel deðiþkenimize renk katmaný deðeri kadar deðer ekliyoruz 
        end
    end
end

HataOrani = HataliPiksel / ToplamPiksel * 100;                    % Kontrolümüz bittiði için iki görüntü arasýnda oluþan HataOrani'ni hesaplýyoruz
str_hataorani = sprintf('Hata Oraný : %% %2.2f \n',HataOrani);    % str_hataorani deðiþkenine istediðimiz formatta bilgi aktarýyoruz
subplot(1,3,3); imshow(Rson);title('Sonuç');                      % Kontrol sonucunda iki görüntü arasýndaki farklardan oluþan sonuç görüntüsü görüntüleniyor
xlabel(str_hataorani);                                            % Görüntünün altýna hata oranýmýzý yazdýrýyoruz
fprintf('Toplam Piksel : %7d \n',ToplamPiksel);                   % Komut ekranýna ToplamPiksel yazdýrýlýyor
fprintf('Hatalý Piksel : %7d \n',HataliPiksel);                   % Komut ekranýna HataliPiksel yazdýrýlýyor
fprintf('Hata Oraný : %% %2.2f \n',HataOrani);                    % Komut ekranýna HataOrani yazdýrýlýyor
