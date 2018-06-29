clear all
close all
clc
datapath = 'C:\Users\Caner\Desktop\Yeni klasör (2)\veritabaný'; % Veritabanýn bulunduðu klasör
TestImage = 'C:\Users\Caner\Desktop\Yeni klasör (2)\test resimleri\6.jpg'; %test edilecek resimlerin bulunduðu klasör
A = imread(TestImage); % Test resminin okunduðu yer
FaceDetector = vision.CascadeObjectDetector(); % kaskad yüz bulmayý çalýþtýrýp facedetector adlý nesneyi oluþturuyoruz
BBOX = step(FaceDetector, A);  % Bulunan yüzlerin koordinat deðerlerini BBOX þeklinde bir matris olarak alýyoruz.
resimsayisi = size(BBOX,1); % resimde bulunan yüz sayýsýný bulup resim sayýnýa atýyoruz
anaresim = zeros(1,resimsayisi); 
tanit = []; 
for sayi=1:resimsayisi
    I2 = imcrop(A,BBOX(sayi,:)); %resmin yüz kýsmýný kesiyor.
    I2 = imresize (I2,[200 180]); % Resim boyutlandýrma  
    [taninma, dbadi, recog_img] = pcayontemi(datapath,I2); %Resmin veritabanýndaki resimler ile pca yöntemi ile karþýlaþtýrýlýp bulunduðu kýsým
    taninma
    dbadi;
    recog_img;
    anaresim(1,sayi) = dbadi;
    tanit(sayi) = taninma;
end

word = cell(1); 
for i=1:length(anaresim)
    olanbu = eslestir(anaresim(i), tanit(i)); %Veritabanýnda kayýtlý olan resimlerin hangi kiþilere ait olduðunu yazan kýsým
    word(i) = {olanbu};
end
B = insertObjectAnnotation(A,'rectangle', BBOX, word,'TextBoxOpacity',0.8,'FontSize',30); % Yüzün kare þeklinde içe alýnýp karenin þeffaflýðýný ve fontunun yazýldýðý kýsým.
imshow(B);
