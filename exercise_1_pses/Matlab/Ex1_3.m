% MATLAB CODE
clear all;
close all;
clc;
format compact;

% ex3.1 
% Construction of signal
step = 0.001;
t = 0:step:0.5;
x = 10*cos(2*pi*20*t)-4*sin(2*pi*40*t+5);
plot(t,x)
title('Continous signal x(t)=10cos(2\pi20t)-4sin(2\pi40t+5)');
xlabel('t');
ylabel('x(t)');


% Sampling with f = 100Hz > fnyquist = 2fmax = 80 Hz
noOfSamples = 128;
fs = 100;
Ts = 1/fs;
% x[n] = xa(nTs)
n = 0:noOfSamples-1;
xn = 10*cos(2*pi*20*n*Ts)-4*sin(2*pi*40*n*Ts+4);
figure
stem(n,xn)
title('Discrete signal xn sampled with fs=100Hz');
xlabel('n');
ylabel('x[n]');

% Discrete Fourier Transform of xn
figure
%Nfft =  2^nextpow2(length(xn)); % (power of 2) number of samples in frequency spectrum
f = -fs/2: fs/noOfSamples: fs/2 - fs/noOfSamples;
Xf = fftshift(fft(xn)/noOfSamples); %fftshift needed in order to depict the zero-frequency component in the middle of the spectrum
plot(f,abs(Xf))
title('Discrete Fourier Transform Xf of x[n]');
xlabel('f');
ylabel('Xf');

% ex3.2
clear all
% phi = 37(our team's number),
phi = 37;
fs = 8000;
Ts = 1/fs;
noOfSamples = 256; % random number of samples in discrete signal(a power of 2 is given in order to achieve better accuracy)
n = -noOfSamples/2:1:noOfSamples/2-1;
f = -fs/2: fs/noOfSamples: fs/2 - fs/noOfSamples;

% for differnt f0 << fs the FFT is:
for f0 = 100:125:475
    figure
    % x(t) = sin(2*pi*f0*t+37)  and x[n] = x(nTs) = x(n/fs) = sin(2*pi*f0/fs*n+37)
    x=sin(2*pi*(f0/fs)*n+phi);
    Xf = fftshift(fft(x)/noOfSamples);  %fft of the sequence with fo<<Fs
    plot(f,abs(Xf))
    xlim([-1000 1000])
    title("Discrete Fourier Transform Xf of x[n] f0 = "+ f0+" Hz and \phi: "+ phi)
    xlabel('Frequency (Hz)')
    ylabel('|X(f)|')
    grid on;
end

% for differnt f0 comparable to fs the FFT is:
for f0 = 7525:125:7900
    figure
    % x(t) = sin(2*pi*f0*t+37)  and x[n] = x(nTs) = x(n/fs) = sin(2*pi*f0/fs*n+37)
    x=sin(2*pi*f0/fs*n+phi);
    Xf = fftshift(fft(x)/noOfSamples);  %fft of the sequence with fo comparable to Fs
    plot(f,abs(Xf))
    xlim([-1000 1000])
    title("Discrete Fourier Transform Xf of x[n] f0 = "+ f0+" Hz and \phi: "+ phi)
    xlabel('Frequency (Hz)')
    ylabel('|X(f)|')
    grid on;
end 




