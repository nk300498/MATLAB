clc;clear all;
num_sample=input('Number of samples: ');
num_bins = input('Number of bins: ');

%parameter for calculating of LCG
m=input('m is the integer modulus=');
b=input('b the increment {0 <= b < m}= ');
x_1=input(' the "seed" or "start value x=');
a=input('a the multiplier=');


x(1)=x_1;        
for i=2:num_sample
x(i)= mod( (a*x(i-1)+b), m);          % (a*x + b) mod m (LCG recursive formula)
end
x=(x/(m-1))';                         %normalization to [0,1] interval

hist(x,num_bins);
title(" #bins: " + num2str(num_bins));