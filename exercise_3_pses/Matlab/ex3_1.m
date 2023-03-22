function []=ex3_1()
    clear all;
    close all; 
    %Data declaration
    Fs=10000;
    wp=2*pi*3000;
    ws=2*pi*4000;
    rs=30;
    rs2=50;
    rp=3;
    Ts=1/Fs;
    
    %rs = 30
    [N,wn]=buttord(wp,ws,rp,rs,'s')
    [z,p,k] = buttap(N);            % Butterworth analog lowpass filter prototype.
    [b,a]= zp2tf(z,p,k);            % Specify filter in polynomial form
    [num,den]=lp2lp(b,a,wn);        % Change cutoff frequency
 
    step = Fs/(2*2048);
    f = 0:step:Fs/2-step;
    H = freqs(num,den, length(f));  % Frequency response of analog filter
   
    plot(f,abs(H))
    hold on;
    [numd,dend]=bilinear(num,den,Fs);
    Hdig = freqz(numd,dend,length(f));
    plot(f,abs(Hdig));
    title('Shared Graph of analog and digital Butterworth filter with Rs = 30dB')
    xlabel('f(Hz)');
    ylabel('|H|');
    legend('analog','digital')
    
    %rs = 50
    [N,wn]=buttord(wp,ws,rp,rs2,'s');
    [z,p,k] = buttap(N);            % Butterworth analog lowpass filter prototype.
    [b,a]= zp2tf(z,p,k);            % Specify filter in polynomial form
    [num,den]=lp2lp(b,a,wn); % Change cutoff frequency
    
    step = Fs/(2*2048);
    f = 0:step:Fs/2-step;
    H = freqs(num,den, length(f));  % Frequency response of analog filter
    
    figure
    plot(f,abs(H))
    hold on;
    [numd,dend]=bilinear(num,den,Fs);
    Hdig = freqz(numd,dend,length(f));
    plot(f,abs(Hdig));
    title('Shared Graph of analog and digital Butterworth filter with Rs = 50dB')
    xlabel('f(Hz)');
    ylabel('|H|');
    legend('analog','digital')
end