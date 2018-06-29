function y=Hafta7_Histogram(resim)
w=256;
h=256;
res=imread(resim);
res2=imresize(res,[w,h]);

%res3=rgb2gray(res2);
res3=res2;

for k=1:255
    hisdizi(k)=0;
end

for i=1:256
    for j=1:256
        for n=1:255
            if(res3(i,j)==n)
                hisdizi(n)=hisdizi(n)+1;
            end
        end
    end
end

for n=1:255
    fprintf('%d - %d\n',n,hisdizi(n));
end

subplot(1,2,1);
imshow(res,[100 250]); %imshow ile belirli aralýktaki renk deðerlerini gösterme
subplot(1,2,2);
bar(hisdizi);
title('Histogram');
xlabel('Renk Deðerleri');
ylabel('Adet');