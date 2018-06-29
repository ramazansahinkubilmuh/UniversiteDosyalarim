x=[10 20 30 40 50 60 70 80];
y=[25 70 380 550 610 1220 830 1450 ];

plot(x,y,'*')
a=polyfit(x,y,4) 
t=polyval(a,15)
tahmin=polyval(a,x)
hold on
plot(x,tahmin),figure
fark=y-tahmin
mse(fark)
postreg(y,tahmin)