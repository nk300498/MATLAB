%num_bins=rand;
%num_samples = num_bins;
%num samples = num bins
clc;clear all;
num_sample = input('Enter the number of samples: ');
num_bins = input('Enter the number of bins: ');
var=rand(1,num_sample);
hist(var,num_bins);
title("Name: Nitish Kumar Thakur, Roll No: 21531010, #bins: " + num2str(num_bins));
