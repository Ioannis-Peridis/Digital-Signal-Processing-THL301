% Exercise 2 - PSES 
%1.b 
close all;
clear all;
clc;
format compact;

num=[0 0.2 0]; 
denom=[1 -0.7 -0.18];

zeros=roots(num);
poles=roots(denom);

H=tf(num,denom);

figure(1)
zplane(zeros,poles)
grid on;
title('Plot of zeros and poles')
xlabel('Re');
ylabel('Im');
legend('zeros','poles');

%1.d
step=pi/128;
F=[-pi:step:pi];

figure(2)
freqz(num,denom,F);
title('freqz diagram')
grid on;

figure(3) 
freqz(num,denom);
title('freqz without the third argument')
grid on;

%1.e - H with an extra pole at z=1
numerator=[0 0 0.2 0]; 
denominator=[-1 1.7 -0.52 -0.18];

figure(4)
freqz(numerator, denominator, F)
title('New H(z) with an extra pole at 1');
grid on;

% Excercise 2
% Calculation of transfer function
numer=[4 -3.5 0];
denom=[1 -2.5 1];
H2=tf(numer, denom, -1);

% Usage of residuez to convert H into simple fractions
[R, P, K]=residuez(numer, denom);
A=R(1); % The first residue
B=R(2); % The second residue

syms z;

% Calculation of H
H= [A/(1-P(1)*z^(-1))] + [B/(1-P(2)*z^(-1))];

% pretty function to print symbolic expression in mathematical form.
pretty(H)

% The h(t) signal
h=iztrans(H) 






