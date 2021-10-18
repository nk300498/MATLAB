clc;clear all;
%in this section parameter given or assume by myself

SNR=-10:2:40;              %This SNR is in db given in problem
x=10.^((SNR/10));         %But in Capacity formula SNR is not in db,
Nr=5;                      %Given in question we take total 5 number of receiving antenna
Nt=5;                     %Given in question we take total 5 number of receiving antenna
v=1/2;
sum=0;
sum1=0;
N=1000;                %i take total iteration 1000




%% (Problem 1) calculation of capacity of SIMO channel total rx. antenna is 5 and single transmitting antenna
for j=1:N  %this loop is used for calculation of expectation
h=(sqrt(v))*(randn(Nr,1)+1i*randn(Nr,1)); %in question given take     
for i = 1:length(x)
    Capacity_SIMO(i) = (log2(1+((norm(h,2)^(2))*x(i))));
    
end
a{j}=Capacity_SIMO';
 sum=sum+a{j};
end
Ergodic_Capacity_SIMO=sum/N;%we find expectation of Capacity of SIMO




%% (Problem 2) Capacity of MIMO channel total rx. antenna is 5 and 5 transmitting antenna used.
for j=1:N   %this loop is used for calculation of expectation
h=(sqrt(v))*(randn(Nr,Nt)+1i*randn(Nr,Nt)); %in question given take
for i = 1:length(x)      %this loop is used for calculation of capacity at diiferent SNR value
    Capacity_MIMO(i) = log2(det(eye(Nr)+h*h'*x(i)));
    
end
a1{j}=Capacity_MIMO';
 sum1=sum1+a1{j};
end
Ergodic_Capacity_MIMO=real(sum1/N);



%%  plotting of graph and marking the parameter
hold on;
plot(SNR,Ergodic_Capacity_SIMO,"r-o","linewidth",1);
plot(SNR,Ergodic_Capacity_MIMO,"b-o","linewidth",1.5);
grid;
xlabel("SNR(db)");
ylabel("Ergodic Capacity(bit/sec/Hz)");
title("Ergodic Capacity plot for SIMO and MIMO channel")
legend("SIMO:Nr=5,Nt=1","MIMO:Nr=5,Nt=5","location","northwest")

