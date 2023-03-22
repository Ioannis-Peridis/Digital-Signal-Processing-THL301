function []=ex3_2()
    clear all;
    close all;
    clc
    
    %data declaration
    wc=2;
    F_cut=wc/(2*pi);
    Ts=0.2;
    Fs=1/Ts;
    F_nyq=Fs/2;
    F_cheby=F_cut/F_nyq;
    Nf=256;
    
    
    [num1,denum1]=cheby1(2,3,F_cheby,'high')
    [H1,w1]=freqz(num1,denum1,Nf);
    H1_cheby_dB=20*log10(abs(H1));
    
    [num2,denum2]=cheby1(16,3,F_cheby,'high')
    [H2,w2]=freqz(num2,denum2,Nf);
    H2_cheby_dB=20*log10(abs(H2));
    
    figure(1)
    plot(w1,H1_cheby_dB,w1,H2_cheby_dB,'r'); hold on;
    axis([0 2 -250 10])
    grid on;
    title('Frequency responses of the 2 Chebyshev highpass filters')
    
    
    
    n=0:1:499;
    y_t=1+cos(5*n*Ts)+cos(1.5*n*Ts)
    figure(2)
    plot(n,y_t)
    grid on;
   
    
    %
    F=-Fs/2:Fs/length(n):Fs/2 - Fs/length(n);
    Y1=fftshift(fft(y_t))
    figure(3)
    plot(F,abs(Y1))
    grid on;
    
    %Filtering
    y_filter=filter(num2,denum2,y_t)
    figure(4)
    plot(n,y_filter)
    grid on;
    
    %After filter
    Y_FILTER=fftshift(fft(y_filter))
    figure(5)
    plot(F,abs(Y_FILTER))
    grid on;
    
end