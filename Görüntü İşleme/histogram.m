function y = histogram(resim)
w=256;
h=256;
res  = imread(resim);
res3 = imresize(res,[h,w]);
%res3 = rgb2gray(res2);
figure; imshow(res3);

for d=1:256
    hisdizi(d)=0;
end;

for satir=1:h
    for sutun=1:w
        a = res3(satir,sutun);
        hisdizi(a+1) = hisdizi(a+1) + 1;
        
    end
end;

for d=1:256
   fprintf('%3d. deðer : %4d \n', d-1,hisdizi(d));
end;

figure;plot(hisdizi);
figure;bar(hisdizi);
title('Histogram');
xlabel('Renk Deðerleri');
ylabel('Yoðunluk');

subplot(1,3,1);imshow(res3);
subplot(1,3,2);imshow(res3,[100,255]);

subplot(1,3,3);bar(hisdizi);
title('Histogram');
xlabel('Renk Deðerleri');
ylabel('Yoðunluk');

