%Distance vs loss (dB) for small city for Hata Model'
clc;
clear all;
close all;
Hte=input('Enter Base Station Antena Hight (hte)');
Hre=input('Enter Mobile Station Antena Hight(hre)');
d= input('Enter Distance from Base Station');
f=input('Enter The Frequency:');
for i=1:length(d)
 CH=0.8+((1.1*log(d))-0.7)*Hre-1.56*log(d);
 LU=69.55+26.16*log(d)-132.82*log(Hte)-CH+(44.9-6.55*log(Hte))*log(f);
 end
figure(1)
plot(d,LU)
title('Distance vs loss (dB) for small city for hata Model');
xlabel ('Frequency(MHz)');
ylabel('Propogation Path loss(dB)');
grid on;
[200 300 400 500 600 700 800 900 1000 1100]

