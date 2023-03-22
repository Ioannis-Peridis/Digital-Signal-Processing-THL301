close all;
clc;
clear all;

figure(1)
nx=[-20:20];  % chronos tou simatos x
x = cos(nx);  % first signal is cos(nx) 
subplot(2,1,1);
stem(nx,x);
title('First signal')
xlabel('n')
ylabel('x[n]')


nk=[-30:30];  % chronos toy k - dialegw epitides diaforetiko
k =(2/3).^abs(nk); % second signal is 2/3^|n|
subplot(2,1,2);
stem(nk,k);
title('Second signal')
xlabel('n')
ylabel('k[n]')

%zero padding process

nz = [nx(1) + nk(1) : nx(end) + nk(end)]; %convolution time
lenz=length(nz); 
lenx=length(x);
lenk= length(k);

L = lenx + lenk-1 ; %convolution size

x0 = [zeros(1,lenk-1) x zeros(1,lenk-1)];



% figure(2)
% subplot(2,1,1)
% stem(nx,x)
% subplot(2,1,2)
% stem(nx0,x0)

%dimioyrgo to sima k[-n] ( anaklasi)

kanak = k(end:-1:1);




%convolution vasei orismou

for i=1:lenz 
    kanak0 = [zeros(1,(i-1)) kanak zeros(1,(lenz-i))];
    z1(i)=sum(x0.*kanak0);
end


figure(2)

subplot(2,2,2);
stem(nz,z1);
title('Convolution by definition')
xlabel('n')
ylabel('x[n]*k[n]')



%Convolution using the conv function

convol=conv(x,k);
subplot(2,2,1)
stem(nz,convol)
title('Convolution using the conv function')
xlabel('n')
ylabel('x[n]*k[n]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% B erotima
% Efarmozo fourier transform sto katallilo mikos

X=fft(x,L);
K=fft(k,L);

%epanafero sto pedio toy xronoy gia na kano realistiki sigrisi
res=ifft(X.*K);

subplot(2,2,3)
stem(nz,res);
xlabel('n')
ylabel('X*K')
title('Proof for B')

subplot(2,2,4)
stem(2*res-convol-z1)
title('Difference')





