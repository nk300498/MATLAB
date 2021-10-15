%Capacity plot for AWGN single-input single output (SISO) channel.
clc;
SNR=-10:2:40;%This SNR is in db given in problem
x=10.^((SNR/10));%But in Capacity formula SNR is not in db,
%so conversion from db;
C=log2(1+x );
plot(SNR,C);
grid;
xlabel("SNR(db)");
ylabel("Capacity(bit/sec)");
title("Capacity plot for AWGN single-input single output (SISO) channel");

