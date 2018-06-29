resim = imread('para.png');
subplot(2,3,1);imshow(resim);
title('Orijinal');

resim = rgb2gray(resim);
level = graythresh(resim); % eþik deðer belirlenir 
bw = im2bw(resim,level); %siyah beyaz görüntüye dönüþtürür. level eþik deðerine göre altý siyah, üstü beyaz olsun
subplot(2,3,2);imshow(bw);
title('Siyah Beyaz');
bwTers = imcomplement(bw); %renkleri ters çevir
subplot(2,3,3);imshow(bwTers);
title('Ters Renk');

bwTers = imfill(bwTers,'holes');   %büyük beyaz alanlardaki siyah lekeler temizlenir
subplot(2,3,4);imshow(bwTers);
title('Temizleme');

bwTers = bwareaopen(bwTers,30);   %açma iþlemi uygulanýr (eþik deðeri : 30px seçtik)
subplot(2,3,5);imshow(bwTers);
title('Açma');

se = strel('disk',12); % yapýsal element oluþturuldu (yarýçapý 12 olan bir dairesel þekil oluþturduk. beyaz alanlarýmýzý birbirinden ayýrdýk) 
bwAsinma = imerode(bwTers,se);   %aþýndýrma iþlemi uygulanýr 
subplot(2,3,6);imshow(bwAsinma);
title('Aþýndýrma');

[B,L] = bwboundaries(bwAsinma);   % nesnenin sýnýrlarý hesaplanýyor
adet = length(B);   % sýnýr içindeki dairesel þekil (para) sayýsý hesaplanýyor
%str = adet + ' adet';
%xlabel(str);
xlabel({adet; ' adet'});