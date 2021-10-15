%BER versus SNR curve for BPSK
%under additive white Gaussian noise (AWGN) communication channel.
clc;clear all;
SNR_db=-5:2:15; %given in problem
snr=10.^(SNR_db/10); %conversion of snr from db to linear
Bit_length=10^7; %given number of bit>10^6
mean=1;
variance=0.8;
std=sqrt(variance);
%% Simulated Bit error rate calculation of BPSK in AWGN channel
for i=1:length(snr)
% generation of random bit 0 and 1
%and assigning of 0 and 1 to -1 and +1;
b = randi([0 1],Bit_length,1);
for j=1:Bit_length
if b(j)==0
x(j)=-1;
else
x(j)=1;
end
end
% When Bit transmitted some noise added i.e y=x+n;
%after receiving of bit to evaluate the bit
n= std*randn(1,Bit_length)+mean; %real_gaussian_noise generation
y=(sqrt(snr(i))*x)+n;
for t=1:Bit_length
if y(t)>=0
r(t,1)=1;
else
r(t,1)=0;
end
end
c=xor(b,r);
BER(i)=length(c(c>0));
end
BER=BER/Bit_length;
semilogy(SNR_db,BER,"k->","linewidth",1.5)
hold on;

%% Theoretical BER of AWGN
BER_AWGN=0.5*exp(-(snr/2));
semilogy(SNR_db,BER_AWGN,"b-","linewidth",1.5)
%%
grid;
xlabel("SNR(db)");
ylabel("Bit Error Rate");
axis tight;
legend('simulated',' Theoretical')
title("BER versus SNR curve for BPSK in AWGN channel")
hold off;