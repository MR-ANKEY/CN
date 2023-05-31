pkg load symbolic;
clc;
clear all;
clc;
clear all;
N=1000000;
L=4;
for SNRdb=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60];
    SNR=10.^(SNRdb/10);
    display(SNR);
    p=(SNR/(2+SNR)).^0.5;
    display(p);
    q=((1-p)/2).^L;
    %r=((1+p)/2);

    for index=0:1:L-1;
      n=L+index-1;
      display(n);
      k=index;
      display(index);
      n_factorial=factorial(n);
      k_factorial=factorial(k);
      display(k_factorial);
      n_minus_k_factorial=factorial(n-k);

      combi=n_factorial/(k_factorial.* n_minus_k_factorial);
      syms index
      f = combi.*(((1+p)/2).^index);
      V = subs(f, k, 0:3)
      BER = sum(V)
      display(BER);

      %syms index;
      %BER = symsum((combi.*(r.^index)),index,0,3);
      BERdb=10.*log10(BER);
      BERdb_perbit=BERdb/N;
      display(BERdb_perbit);
      %plot(SNRdb,BER,'r');

     end
     ezplot(BERdb_perbit,[0,60]);
     hold on;
end

xlabel('SNR in Decibel');
ylabel('BER in Decibel per bit');
grid on;


