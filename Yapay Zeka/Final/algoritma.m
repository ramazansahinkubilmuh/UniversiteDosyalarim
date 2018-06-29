clear all;
clc;
%sehirsayisi=81;
sehirsayisi=77;
isciarisayisi=15;
gozcuarisayisi=15;
besinsayisi=50;
limit=100;
%ilmesafe=xlsread('ilmesafe.xls');
ilmesafe=xlsread('a101.xls');
eniyicozumdegeri=1000000;
besin=besinmatrisi(besinsayisi,sehirsayisi);
denemesayisi=zeros(size(besin(:,1)));
for i=1:besinsayisi
    cozumdegeri(i)=amacfonksiyonu(besin(i,:),ilmesafe,sehirsayisi);
    if eniyicozumdegeri>cozumdegeri(i)
        eniyicozumdegeri=cozumdegeri(i);
        eniyicozum=besin(i,:);
    end
end

for iterasyon=1:1000
%iþçi arý safasý baþlar
for i=1:isciarisayisi
    degisecekbesinno=randi([1 besinsayisi]);
    r=randi(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1==indis2
        indis2=randi([1 sehirsayisi]);
    end
    if r<1/3
        yenibesin=yerdegistir(besin(degisecekbesinno,:),indis1,indis2);
    elseif r<2/3
        yenibesin=solakaydir(besin(degisecekbesinno,:),indis1,indis2);
    else
        
        yenibesin=diziyiterscevir(besin(degisecekbesinno,:),indis1,indis2);
    end
    yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
    if yenicozumdegeri<cozumdegeri(degisecekbesinno)
        cozumdegeri(degisecekbesinno)=yenicozumdegeri;
        besin(degisecekbesinno,:)=yenibesin;
        denemesayisi(degisecekbesinno)=0;
        if eniyicozumdegeri>yenicozumdegeri
            eniyicozumdegeri=yenicozumdegeri;
            eniyicozum=yenibesin;
        end
    else 
        denemesayisi(degisecekbesinno)=denemesayisi(degisecekbesinno)+1;
    end
end

%iþçi arý safasý bitti

%gözcü arý safasý baslar
sabit=1;
for i=1:besinsayisi
    minicinuygunluk(i)=sabit/cozumdegeri(i);
end
cozumdegerleritoplami=0;
for i=1:besinsayisi
    cozumdegerleritoplami=cozumdegerleritoplami+minicinuygunluk(i);
end
for i=1:besinsayisi
    uygunluk(i)=minicinuygunluk(i)/cozumdegerleritoplami;
end
for i=1:gozcuarisayisi
    degisecekbesinno=besinsec(uygunluk);
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1==indis2
        indis2=randi([1 sehirsayisi]);
    end
    if r<1/3
        yenibesin=yerdegistir(besin(degisecekbesinno,:),indis1,indis2);
    elseif r<2/3
         yenibesin=diziyiterscevir(besin(degisecekbesinno,:),indis1,indis2);
    else
         yenibesin=solakaydir(besin(degisecekbesinno,:),indis1,indis2);
    end
    yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
    if yenicozumdegeri<cozumdegeri(degisecekbesinno)
       cozumdegeri(degisecekbesinno)=yenicozumdegeri;
       besin(degisecekbesinno,:)=yenibesin;
       denemesayisi(degisecekbesinno)=0;
       if eniyicozumdegeri>yenicozumdegeri
           eniyicozumdegeri=yenicozumdegeri;
           eniyicozum=yenibesin;
       end
    else
    denemesayisi(degisecekbesinno)=denemesayisi(degisecekbesinno)+1;
    end
end
%gozcuarý safasý bitti
%kasif ari safasý baþlar
for i=1:besinsayisi
    if denemesayisi(i)>limit;
        denemesayisi(i)=0;
        [besin(i,:),cozumdegeri(i)]=yerelarama1(besin(i,:),cozumdegeri(i),ilmesafe,sehirsayisi);

if eniyicozumdegeri>cozumdegeri(i)
    eniyicozumdegeri=cozumdegeri(i);
    eniyicozum=besin(i,:);
end
        [besin(i,:),cozumdegeri(i)]=yerelarama2(besin(i,:),cozumdegeri(i),ilmesafe,sehirsayisi);

if eniyicozumdegeri>cozumdegeri(i)
    eniyicozumdegeri=cozumdegeri(i);
    eniyicozum=besin(i,:);
end
    end
end
% kasif safasý bitti
fprintf('iterasyon:%d Eniyicozum: %d \n', iterasyon,eniyicozumdegeri);


end