%dosya olusturma
dosyayeri='karakterler\';
dosyaturu='.jpg';
icerik=dir([dosyayeri,'*',dosyaturu]);
rsayisi=size(icerik,1);
A=zeros(2500,rsayisi);
for k=1:rsayisi
    string=[dosyayeri,icerik(k,1).name];
    resim=imread(string);
    resim=im2bw(resim);
    resim=imresize(resim,[50,50]);
    resim=double(resim);
    resim=reshape(resim,2500,1);
    A(:,k)=resim;  
end
%agýn oluþturulmasý
target=eye(k);
giris=[A];
[W,Q]=size(giris);
[s2,Q]=size(target);
s1=10;
net=newff(minmax(giris),[s1,s2], {'logsig' 'logsig'},'trainscg');
%net.LW(2,1) = net.LW(2,1)*0,01;
%net.b(2) = net.b(2)*0,01;
net.trainParam.perf='sse';
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net=train(net,giris,target);
