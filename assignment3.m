clc;clear all;
s=0;
SNR_db=-5:2:15;
snr=10.^(SNR_db/10);   %conversion of snr from db to linear 
Bit_length=10^7;       %given number of bit>10^6
Real_power=1/2;
Imag_power=1/2;

                  
%% Simulated Bit error rate calculation of BPSK in AWGN channel



% When Bit transmitted some noise added i.e y=x+n;
%after receiving of bit to evaluate the bit 
 Noise_var = Real_power/snr(i);
N_r= sqrt(Noise_var)*(randn(1,Bit_length));  %real_gaussian_noise generation
N_i= sqrt(Noise_var)*(randn(1,Bit_length));  %Imag gaussian noise geneartion
n=N_r +j*N_i;

y=x+n;

for t=1:Bit_length
    if y(t)>=0
        r(t,1)=1;
    else
        r(t,1)=0;
    
    
    end
end
c=xor(b,r);
BER(i)=length(c(c>0));

BER=BER/Bit_length;
semilogy(SNR_db,BER,"k->","linewidth",2)


grid;
xlabel("SNR(db)");
ylabel("BER");
axis tight;
title("BER versus SNR curve for QPSK in AWGN channel")
