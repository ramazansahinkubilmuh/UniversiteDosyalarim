%Resmin yolunu belirtip resmi okuyup A deðiþkenine atýyoruz.
A = imread('E:\Caner\Pictures\Camera Roll\2.jpg'); 
%YuzBulucu adýnda  yüz bulma nesnesi oluþturuyoruz.
YuzBulucu = vision.CascadeObjectDetector();
%Resmimizde Kaskad yüz bulmayý çalýþtýrýyoruz.
%Bulunan yüzlerin koordinat deðerlerini BBOX þeklinde bir matris olarak alýyoruz.
BBOX = step(YuzBulucu, A);
ciz = insertObjectAnnotation(A,'rectangle',BBOX,'Y U Z');
%Bulunan yüzlerin koordinat deðerlerinin yazýldýðý ve fotoðraftaki bulunan yüzün kare þeklinde tespit edilerek açýklamasýnýn yazýldýðý kýsýmdýr.
imshow(ciz); %Resmi Görüntüleme iþlemi.
