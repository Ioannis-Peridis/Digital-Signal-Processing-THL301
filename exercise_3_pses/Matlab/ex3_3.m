%Exercise 3
close all;
clear all;
clc;

%3a
%Parameters
Fs=10000;
Ts=1/Fs;
k=1:500;
x=1+cos(1000*k*Ts)+cos(16000*k*Ts)+cos(30000*k*Ts);

%Signal after sampling
figure(1)
stem(k,x)

xlabel('k');
ylabel('x');
title('x(k*Ts) after the sampling process')

%FFT
F=-Fs/2:Fs/length(k):Fs/2 - Fs/length(k);
X=fftshift(fft(x));

%filter parameters 
wp=2*pi*3000;
ws=2*pi*4000;
rs=30;
rp=3;
    
%filter creation
[N,wn]=buttord(wp,ws,rp,rs,'s');
F_cut=wn/(2*pi);
F_nyq=Fs/2;
F_but=F_cut/F_nyq;
[num,denum]=butter(N,F_but);

%filtering process
x_filter=filter(num,denum,x);


%creation of 50 db filter and 
% then repetition of the previous steps
rs=50;
[N_new,wn_new]=buttord(wp,ws,rp,50,'s');
[num_new,denum_new]=butter(N_new,F_but);

%filtering process
x_filter_new=filter(num_new,denum_new,x);

%comparisons -graphs -fasma
figure(2)
subplot(3,1,1)
plot(F,abs(X))
title('signal before the filtering process(low-pass)')
axis([-6000, 6000, 0, 600])
grid on;
subplot(3,1,2)
X_Filter=fftshift(fft(x_filter));
plot(F,abs(X_Filter))
axis([-6000, 6000,0,5 ])
title('signal after the filtering process(30db)')
grid on;
subplot(3,1,3)
X_Filter_new=fftshift(fft(x_filter_new));
plot(F,abs(X_Filter_new))
axis([-6000, 6000, 0, 5])
title('signal after the filtering process (50db)')
grid on;

%Signal
figure(3)
subplot(3,1,1)
plot(k*Ts,x);
xlabel('k*Ts');
ylabel('x');
title('Signal before filtering process ')
% axis([-6000, 6000, 0, 600])
grid on;
subplot(3,1,2)
plot(k*Ts,x_filter)
% axis([-6000, 6000,0,5 ])
title('signal after the filtering process(30db)')
grid on;
subplot(3,1,3)
plot(k*Ts,x_filter_new)
% axis([-6000, 6000, 0, 5])
title('signal after the filtering process (50db)')
grid on;


%3b
%new Ts and Fs
Ts=0.2;
Fs=1/Ts;
k=1:500;
F_nyq=Fs/2;

%filter parameters
wc=2;
F_c=wc/(2*pi);
F_cheby=F_c/F_nyq;

%Cheby function - 16th class
[num,denum]=cheby1(16,3,F_cheby,'high');

%signal parameters - fft
y=1+cos(1.5*k*Ts)+cos(5*k*Ts);
F=-Fs/2:Fs/length(k):Fs/2 - Fs/length(k);
Y=fftshift(fft(y));

y_filter=filter(num,denum,y);
Y_Filter=fftshift(fft(y_filter));

%Fasma
figure(4)
subplot(2,1,1)
plot(F, abs(Y))
axis([-2.5, 2.5, 0, 600])
title('before the filtering process (high-pass)')
grid on;
subplot(2,1,2)
plot(F, abs(Y_Filter))
axis([-2.5, 2.5, 0, 600])
title('after the filtering process')
grid on;

%Signal 
figure(5)
subplot(2,1,1)
plot(k*Ts,y)
% axis([-2.5, 2.5, 0, 600])
title('before the filtering process (high-pass)')
grid on;
subplot(2,1,2)
plot(k*Ts, y_filter)
% axis([-2.5, 2.5, 0, 600])
title('after the filtering process')
grid on;



figure(6)
plot(F, abs(Y_Filter))
title('after the filtering process (zoomed in graph)')
grid on;

