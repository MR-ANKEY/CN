pkg load communications;
clc;
clear all;
N=64; %No. of bits
M=4; %No. of channels
data=randsrc(1,N,0:1:M-1); %To take random data from user in digital signal format
display(data);
%To achieve modulation
Mary_output=pskmod(data,M); %M_ary modulation of signal
figure(1);
stem(Mary_output);
title("Modulated output of signal");
%Serial to parallel conversion
s2p=reshape(data,[N/M,M]);
%To divide 16*4 matrix of s2p into 16*1 matrix
subcarrier1=s2p(:,1);
subcarrier2=s2p(:,2);
subcarrier3=s2p(:,3);
subcarrier4=s2p(:,4);
%Taking inverse fourier transform of signal
ifft1=ifft(subcarrier1);
ifft2=ifft(subcarrier2);
ifft3=ifft(subcarrier3);
ifft4=ifft(subcarrier4);
%To plot real part of signal to achieve orthogonality
figure(2);
plot(real(ifft1),'r');
hold on;
plot(real(ifft2),'b');

hold on;
plot(real(ifft3),'g');
hold on;
plot(real(ifft4),'y');
hold on;
for i=1:M;
 ifft_signal(:,i)=ifft((s2p(:,i)),16) %16 is the ifft point
end
%To plot ifft of whole signal of dimensions 16*4
figure(3);
plot(ifft_signal);
title('IFFT of Integrated Signal');
%parallel to serial conversion
p2s=reshape(ifft_signal, 1,N);
figure(4);
plot(real(p2s));
xlabel('time');
ylabel('amplitude');
title('OFDM signal to be transmitted')
