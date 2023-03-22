%Psifiaki Epeksergasia Simatos
%exercise 1.2 

% MATLAB CODE
% Initialization of Matlab fields.
clear all;
close all;
clc;
format compact;

% Construction of signal
step = 0.001;
t = 0:step:0.5;
x = 5*cos(24*pi*t)-2*sin(1.5*pi*t);
plot(t,x)
hold on
% Now we take samples with different sampling periods
% Sampling period Ts = 1/48
Ts1 = 1/48;
t_sample1 = 0:Ts1:0.5;
x_sample1 = 5*cos(24*pi*t_sample1)-2*sin(1.5*pi*t_sample1);
stem(t_sample1,x_sample1);
title('Continous and Sampled signal with Ts = 1/48');
xlabel('t');
ylabel('x(t) and x_a(nT)');
legend('x(t)','x(n) = x_a(nT)');


% With Sampling period Ts = 1/24
figure
plot(t,x)
hold on
Ts2 = 1/24;
t_sample2 = 0:Ts2:0.5;
length(t_sample2)
x_sample2 = 5*cos(24*pi*t_sample2)-2*sin(1.5*pi*t_sample2);
stem(t_sample2,x_sample2);
title('Continous and Sampled signal with Ts = 1/24');
xlabel('t');
ylabel('x(t) and x_a(nT)');
legend('x(t)','x(n) = x_a(nT)');

% With Sampling period 1/12
figure
plot(t,x)
hold on
Ts3 = 1/12;
t_sample3 = 0:Ts3:0.5;
length(t_sample3)
x_sample3 = 5*cos(24*pi*t_sample3)-2*sin(1.5*pi*t_sample3);
stem(t_sample3,x_sample3);
title('Continous and Sampled signal with Ts = 1/12');
xlabel('t');
ylabel('x(t) and x_a(nT)');
legend('x(t)','x(n) = x_a(nT)');

% With Sampling period 1/A where A = 37 from our team's number
figure
plot(t,x)
hold on
Ts4 = 1/37;
t_sample4 = 0:Ts4:0.5;
x_sample4 = 5*cos(24*pi*t_sample4)-2*sin(1.5*pi*t_sample4);
stem(t_sample4,x_sample4);
title('Continous and Sampled signal with Ts = 1/A = 1/37');
xlabel('t');
ylabel('x(t) and x_a(nT)');
legend('x(t)','x(n) = x_a(nT)');

