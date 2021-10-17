%multiple recursive generator (MRG) method to generate random number
clc;clear all;
num_sample=input('Number of samples: ');
num_bins = input('Number of bins: ');

%parameter for calculating of LCG
m=input('m is the integer modulus=');
b=input('b the increment {0 <= b < m}= ');
x_1=input(' the "seed" or "start value x1=');
x_2=input(' second value of x2=');
a=input('a the multiplier=');


x(1)=x_1;
x(2)=x_2;
for i=3:num_sample  
x(i)= mod( (a*x(i-1)+b*x(i-2)), m);   % (a*x(i-1) + b*x(i-2)) mod m (LCG recursive formula)
end
x=(x/(m-1))';                        %normalization to [0,1] interval

hist(x,num_bins);
title(" #bins: " + num2str(num_bins));