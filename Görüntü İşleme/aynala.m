function y=cevir(img)
gen=256;
yuk=256;
res=imread(img);
res2=imresize(res,[gen,yuk]);
figure;imshow(res2);
res3=rgb2gray(res2);
figure;imshow(res3);
res4=res3;

k=256;

for i=1:128
    for j=1:256
        g1=res4(j,i);
        res4(j,i)=res4(j,k);
        res4(j,k)=g1;
    end
    k=k-1;
end;
figure;imshow(res4);

