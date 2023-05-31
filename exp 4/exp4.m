clc;
clear all;
k=1.38*(10^(-23)); %Boltzmann Constant
T=273; % temperature
F=5; % Noise Figure

PSD=k*T*F; % Power Spectral Density

B=30*(10^3):(10^3):40*(10^3); % Bandwidth

NP=10*log10(PSD*B); %Noise Power in db
BER=10^(-4); %Bit Error Rate

% Calculation of Signal To Noise Ratio
x=(1-(2*BER));
display(x);
SNR=((x^2)/(1-(x^2)))*2;
display(SNR);
SNRdB=10*log10(SNR);
display(SNRdB);

%Given Data
Gt=12;
Gr=5;
L=167;
M=10;
LC=3;

%Transmitted Power
Pt=SNRdB-Gt-Gr+L+M+LC+NP;
display(Pt);
plot(B,Pt,'r');
xlabel('Bandwidth');
ylabel('Transmitted Power');
