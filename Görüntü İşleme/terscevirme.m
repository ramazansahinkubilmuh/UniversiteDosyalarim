gen=256;
yuk=256;
res=imread('peppers.png');
res2=imresize(res,[gen,yuk]);
figure;imshow(res2);
res3=rgb2gray(res2);
figure;imshow(res3);
res4=res3;

k=256;

for i=1:128
    for j=1:256
        g1=res4(i,j);
        res4(i,j)=res4(k,j);
        res4(k,j)=g1;
    end
    k=k-1;
end;
figure;imshow(res4);

