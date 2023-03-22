%Lab 4-PSES


%Exercise 1
close all;
clear all;
clc;

Fs=100; %Hz %change it to 50Hz for the second part
Wc_analog=0.4*pi; %rad/s
ws=2*pi*Fs;
wc_dig=(2*Wc_analog)/ws ;%convert analog freq to digital
N=21; %window length

figure(1)
hold on;
grid on;
lp1=fir1((N-1),wc_dig,rectwin(N));
[H1,w1]=freqz(lp1,N);
plot(w1,abs(H1));
grid on;

lp2=fir1((N-1),wc_dig,hamming(N));
[H2,w2]=freqz(lp2,N);
plot(w2,abs(H2));
grid on;
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Amplitude of frequency response');
legend('\color{blue} rectangular','\color{red} hamming');


%Exercise 2

Wc_an2=0.5*pi;
wc_dig2=(2*Wc_an2)/ws;
N2=41;

figure(2)
lp3=fir1((N-1),wc_dig2,hamming(N));
[H,w]=freqz(lp3,N);
subplot(1,2,1);
plot(w,abs(H));
grid on;
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Amplitude of frequency response- Hamming with N=21');
hold on;
lp4=fir1((N2-1),wc_dig2,hamming(N2));
[H4,w4]=freqz(lp4,N2);
subplot(1,2,2);
plot(w4,abs(H4));
grid on;
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Amplitude of frequency response- Hamming with N=41');


figure(3)
lp5=fir1((N-1),wc_dig2,hanning(N));
[H5,w5]=freqz(lp5,N);
subplot(1,2,1);
plot(w5,abs(H5));
grid on;
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Amplitude of frequency response- Hanning with N=21');
hold on;
lp6=fir1((N2-1),wc_dig2,hanning(N2));
[H6,w6]=freqz(lp6,N2);
subplot(1,2,2);
plot(w6,abs(H6));
grid on;
xlabel('\omega');
ylabel('|H(e^{j\omega})|');
title('Amplitude of frequency response- Hanning with N=41');


%Exercise 2- part 2
Ts=1/Fs;
t=0:Ts:10;
x=sin(15*t)+0.25*sin(200*t);
figure(4)
plot(t,x)
xlabel("t(sec)")
ylabel("x(t)")
title("Plot of the signal x(t)=sin(15t)+0.25sin(200t)")
grid on;

%FFT of x(t)

f=-Fs/2:Fs/length(t):Fs/2 - Fs/length(t);
X=fftshift(fft(x));
figure(5)
plot(f,abs(X));
grid on;
xlabel('f(Hz)');
ylabel('|X(f)|');
title('FFT of the x(t) signal');


figure(6)
grid on;

f1=filter(lp3,1,x);
f2=filter(lp4,1,x);
f3=filter(lp5,1,x);
f4=filter(lp6,1,x);

F1=fftshift(fft(f1));
subplot(2,1,1)
plot(f,abs(F1))
grid on;
ylabel("|Y(f)|")
xlabel("f(Hz)")
title("Fourier of f1(x), with x filtered with hamming (N=21)")
%axis([-10,10,0,400]);

F2=fftshift(fft(f2));
subplot(2,1,2)
plot(f,abs(F2))
grid on;
ylabel("|Y(f)|")
xlabel("f(Hz)")
title("Fourier of f2(x), with x filtered with hamming (N=41)")
%axis([-10,10,0,400]);

figure(7)

F3=fftshift(fft(f3));
subplot(2,1,1)
plot(f,abs(F3))
grid on;
ylabel("|Y(f)|")
xlabel("f(Hz)")
title("Fourier of f3(x), with x filtered with hanning (N=21)")
%axis([-10,10,0,400]);
F4=fftshift(fft(f4));
subplot(2,1,2)
plot(f,abs(F4))
grid on;
ylabel("|Y(f)|")
xlabel("f(Hz)")
title("Fourier of f4(x), with x filtered with hanning (N=41)")
%axis([-10,10,0,400]);



%Further comparisons
figure(8)
hold on;
plot(f,abs(F1),'b')
plot(f,abs(F2),'r')
grid on;
title('Hamming');
legend('\color{blue} N=21','\color{red} N=41');

figure(9)
hold on;
plot(f,abs(F3),'b')
plot(f,abs(F4),'r')
title('Hanning');
grid on;
legend('\color{blue} N=21','\color{red} N=41');


figure(10)
hold on;
plot(f,abs(F1),'b*')
grid on;
plot(f,abs(F3),'r')
title('N=21');
grid on;
l1=legend('\color{blue} hamming','\color{red} hanning');

figure(11)
hold on;
plot(f,abs(F2),'b*')
grid on;
plot(f,abs(F4),'r')
grid on;
title('N=41');
l=legend('\color{blue} hamming','\color{red} hanning');


