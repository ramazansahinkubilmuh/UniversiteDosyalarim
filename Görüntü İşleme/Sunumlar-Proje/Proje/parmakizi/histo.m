function y=histo(resim) %fonksiyon oluþturulur
goruntu1=imread(resim);
a=imhist(goruntu1);%görüntü1 in histogram grafiðini veren komut
goruntu2=histeq(goruntu1);%görüntü1 e histogram eþitlemesi yapan komut
hist2=imhist(goruntu2);%yoðunluk görüntü için histogram hesaplar goruntu2 histogram grafiði görülür. Histogramda kutularýnýn sayýsý görüntü türüne göre belirlenir.
subplot(2,2,1)
imshow(goruntu1)% goruntu1 resmi gösterilir
title(resim)
subplot(2,2,2)
title('orijinal resmin histogramý')
imshow(a)
subplot(2,2,3)
title('Histogram eþitlemesi iþleminin ardýndan resim')
imshow(goruntu2)
subplot(2,2,4)
imshow(hist2)
title('Histogram eþitlemesi iþlemi ardýndan histogram')
end