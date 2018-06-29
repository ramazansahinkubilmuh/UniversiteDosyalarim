function y = parmakla(resimOKU)
resim = imread(resimOKU)
subplot(2,3,1);imshow(resim);
title(resimOKU);

%resim = rgb2gray(resim);
level = graythresh(resim); % eþik deðer belirlenir 
bw = im2bw(resim,level); %siyah beyaz görüntüye dönüþtürür. level eþik deðerine göre altý siyah, üstü beyaz olsun
subplot(2,3,2);imshow(bw);
title('Siyah Beyaz'); 



bwInce = edge(bw,'Canny');%inceltme iþlemi yapýlmýþtýr.
subplot(2,3,3);
imshow(bwInce);
title('Ýnceltme Ýþlemleri');

%bwTers = imfill(bwTers,'holes');   %büyük beyaz alanlardaki siyah lekeler temizlenir
%subplot(2,3,4);imshow(bwTers);
%title('Temizleme');
resimsiyah=bwInce;
%Renk kodu hesaplandý
 
resimrenkkodu=sum(sum(resimsiyah));%renk kodu oluþturuluyor
resimrenkkodu=resimrenkkodu/(max(size(resimsiyah))* min(size(resimsiyah)));%renk kodu hesaplandý

%Gri olan Resimde belli bir eþik deðerin altýnda kalan (50 olarak
 
%belirledim) renkleri logical olarak bir veya sýfýr diye kodlamýþ oldu.
 
etiket=resimsiyah<50; %Logical olan dizi tipi üzerinde iþlem yapmak yerine diziyi normal double dizi tipine dönüþümünü saðlandý.
[a1,b1]=find(resimsiyah==etiket,1);%deðeri 1 olan þartý saðlayan
[a2,b2]=find(resimsiyah==etiket-1,1);
if sqrt((a1-a2).^2 + (b1-b2).^2)   <=20 %kök bulma iþlemi
resimsiyah(resimsiyah==etiket)=etiket-1;
end


%Bulunan nesne sayýsý ve renk kodu ekrana yazdýrýlýr
 
nesneetiketleri=unique(resimsiyah);%unique her deðerden 1 tane getiriyor.kodlarýn çeþitlerini veriyor renk çeþitlerinden 1 tsne getiriyor
fprintf('Özellikleri Bulunan Toplam Nesne Sayýsý= %d\n',length(nesneetiketleri)-1); %dizi indisleri 1 den baþladýðý için -1 yapýyor.
disp('*** 1 ***');
fprintf('Resmin Ortalama Renk Kodu= %d\n',resimrenkkodu);
disp('*** 2 ***');
% alanda tüm nesnelerin alanlarý bulundu.
 
subplot(2,3,4);
imshow(resimsiyah);
hold on
title('Nesnelerin Alanlarý');%nesne alanlarýný baþlýk olarak yazdýrýyor
tur=0;
for i = 2:length(nesneetiketleri)% döngü oluþturulur ve 2 den length a kadar olan
tur=tur+1; 
[alanx,alany]=find(resimsiyah== nesneetiketleri(i));
plot(alany,alanx,'g.')% ölçülerin birbiri ile nasýl iliþkide olduðunu görmek için plot kullanýlýr. g yeþil yapýyor.
fprintf('%d.Nesnenin Alaný= %d\n',tur,length(alanx));
end
disp('*** 3 ***');
% bu alanda tüm nesnelerin aðýrlýk merkezleri bulundu.
 
subplot(2,3,5);
imshow(resimsiyah);
hold on
title('Nesnelerin Aðýrlýk Merkezleri');% baþlýk yazýldý
tur=0;
for i = 2:length(nesneetiketleri)
tur=tur+1;
[alanx,alany]=find(resimsiyah== nesneetiketleri(i));
alanxmean=round(mean(alanx));% aðýrlýk merkezi hesabý için mean kullanýlýr.
alanymean=round(mean(alany));
plot(alanymean,alanxmean,'r.','MarkerSize',5)
fprintf('%d.Nesnenin Aðýrlýk Merkezi: X=%d ,Y=%d\n',tur,alanymean,alanxmean);
end
disp('*** 4 ***');

y=1000/((length(nesneetiketleri)-1)*100+alanymean^3+alanxmean^3+length(alanx)*0.85+resimrenkkodu*200)% kýyaslamada kullanýlacak kod alanýdýr
