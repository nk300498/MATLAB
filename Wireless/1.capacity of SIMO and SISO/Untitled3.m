%Generate an independent and identically distributed Gaussian noise sequence
clc;
%this Section used for generation of independent and identically
%distributed Gaussian noise sequence
mu=0;
sigma=12.5;
v=randn(1000,1000)*sigma+mu; %Gaussian noise sequence
figure;
histogram(v,'Normalization','pdf');
%this section used to verify identically distributed noise sequence is
%Gaussian or not if histogram fit in these gaussian fuction
x =-50:50;
y = normpdf(x,mu,sigma);
%this section used for ploting of graph
hold on;
title(" identically distributed Gaussian noise sequence verified ")
plot(x,y,"r","linewidth",7);
xlabel("x");
ylabel("pdf");
legend('simulated graph','theoretical graph');
grid;