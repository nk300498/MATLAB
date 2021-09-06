%assignment-4(Bit Error rate of QPSK vs SNR In AWGN/Rayleigh channel)
clc;clear all;
SNR_db=-5:2:25;
snr=10.^(SNR_db/10); %conversion of snr from db to linear
b=10^6; %given number of bit>10^4
total_power_QPSK=2;

c = randi([0 1],b,1); % generate 0's and 1's randomly
d = randi([0 1],b,1); % generate 0's and 1's randomly
Q1= 2*c-1;
Q2= 2*d-1;
QPSK_generated_randomly=(Q1+1i*Q2)';

%% When Bit transmitted noise added in Rayleigh channel i.e y=hx+n;

for i1=1:length(snr)
N_v = total_power_QPSK/snr(i1);
N_r= sqrt(N_v)*sqrt(1/2)*(randn(1,b));   %real gaussian noise
N_i= sqrt(N_v)*sqrt(1/2)*(randn(1,b));   %Imag gaussian noise
n = N_r + 1i*N_i;
h=sqrt(1/2)*(randn(1,b)+1i*randn(1,b));  %complex fadding coefficient
y =(h.* QPSK_generated_randomly + n)./h;  %after passing through rayleigh channel output
 

for j=1:b                                  %detection of recived signal
if real(y(j))>0 && imag(y(j))>0
detected(j)=1+1*1i;
elseif real(y(j))<0 && imag(y(j))>0
detected(j)=-1+1*1i;
elseif real(y(j))<0 && imag(y(j))<0

detected(j)=-1-1*1i;

else

detected(j)=1-1*1i;

end
end
E = abs(detected - QPSK_generated_randomly);      %number of error calculation

N_E=0;
for k = 1:b
if (E(k)~=0)
N_E=N_E+1;
end
end
BER(i1)=N_E/b;                                     %BER of QPSK in  Rayleigh channel
end
%%


for a=1:length(snr)
N_v1 = total_power_QPSK/snr(a);
N_r1= sqrt(N_v1/2)*(randn(1,b));            %real gaussian noise
N_i1= sqrt(N_v1/2)*(randn(1,b));            %Imag gaussian noise
n1 = N_r1 + 1i*N_i1;
y1 = QPSK_generated_randomly + n1;         %passing through AWGN channel

for b1=1:b                                  %detection of recived signal
if real(y1(b1))>0 && imag(y1(b1))>0
detected1(b1)=1+1*1i;
elseif real(y1(b1))<0 && imag(y1(b1))>0
detected1(b1)=-1+1*1i;
elseif real(y1(b1))<0 && imag(y1(b1))<0

detected1(b1)=-1-1*1i;

else

detected1(b1)=1-1*1i;

end
end
E1 = abs(detected1 - QPSK_generated_randomly); %number of error

N_E1=0;
for k1 = 1:b
if (E1(k1)~=0)
N_E1=N_E1+1;
end
end
BER1(a)=N_E1/b;
end


%%plotting of graph between BER and SNR
semilogy(SNR_db,BER,"-*","linewidth",2)

hold on;

semilogy(SNR_db,BER1,"->","linewidth",2)

hold off;
xlabel("SNR(db)");
ylabel("BER");
title("BER versus SNR curve for QPSK in AWGN/Rayleigh channel")
legend('Rayleigh channel',' AWGN channel')
grid;


%if we obserbe the graph we found 