res=imread('KAR.png');
res=im2bw(res);
imshow(res);
[y x]=find(res==0);
y1=min(y);
y2=max(y);
x1=min(x);
x2=max(x);
yenires=imcrop(res,[x1 y1 x2-x1 y2-y1]);
imshow(yenires);
%belirli özelliklere göre harflerin aga giriþ olarak verilmesi
harfsayisi=round((x2-x1)/80);

for m=1:harfsayisi
    harf=imcrop(res,[x1+90*(m-1) y1 90 y2-y1]);%90 kar 80 kara
    harf1=imresize(harf,[50 50]);
    harf2=reshape(harf1,2500,1);
    harf2=double(harf2);
    X=sim(net,harf2);
    sonuc=find(X==max(X));
    if sonuc==1
        fprintf('A',m);
    else if sonuc==2
             fprintf('K',m);
        else if sonuc==3
                 fprintf('R',m);
            end
        end
    end
end