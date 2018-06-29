function bs=besinsec(uygunluk)
toplam=0;
r=rand(1);
for i=1:length(uygunluk)
    toplam=toplam+uygunluk(i);
    if r<toplam
        bs=i;
        break;
    end
end