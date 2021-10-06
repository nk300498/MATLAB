clc;clear all;
N=100;


%% Part 1
x=rand(1,N);
%analytical way to generate CDF
if ( x < 0 )
    Fx = 0;
  elseif ( x>1 )
    Fx = 1.0;
  else
    Fx = x;
end

hold on;
plot(x,Fx,"g-*","linewidth",2)

%% Part-2
%Emperically generated CDF
N=100;                                %Given in question N=100
X=randi([-1 2],1,N)' ;                 %generated uniform random variable

a = (1:N).'/N;
f = reshape([a a].',2*length(a),1); %geneartion of Emperical CDF
Px1 = [0; f(1:(end-1))];

b= sort(X);
x = reshape([b b].',2*N,1);

plot(x, Px1,"r-","linewidth",2);



%% part -3

N=10000;                                %Given in question N=100
X=(rand(1,N))' ;                 %generated uniform random variable

a = (1:N).'/N;
f1 = reshape([a a].',2*length(a),1); %geneartion of Emperical CDF
Px2 = [0; f1(1:(end-1))];

b= sort(X);
x = reshape([b b].',2*N,1);

plot(x, Px2,"B-","linewidth",2);



%%
xlabel('X');
ylabel('F(X)');
title(' cumulative distribution function');
grid on;
legend("analytical CDF","Emperical CDF N=100","Emperical CDF N=10000")
hold off;

%% Mean of Emperical CDF
for i=1:N
    sum=0;
    sum=sum+X(i);
end
Emperical_mean=sum/N
    
    
    
    