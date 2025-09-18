clear all;
close all;

%% A
fs_A = 256;
samplesNum = 128;
n_A = 0 : samplesNum-1;
Ts = 1 / fs_A;
%samples multiplied by sampled period
t = Ts * n_A;
x_A = 10* cos(2*pi*20* t) - 4* sin(2*pi*40*t +5);

figure
subplot(2,1,1);
stem(t , x_A);
title('128 samples of x(t)')

%fourier transform

f_A = -fs_A/2 : fs_A/samplesNum : fs_A/2 - fs_A/samplesNum;
%period of one frequency stepped by fs/N (I sample in N samples)
X_A = fftshift(fft(x_A)) / samplesNum;
subplot(2,1,2)
stem(f_A , X_A)
title('Fourier transform of x[n]')

%% Â

teamNum = 25;
% ö choice doesn't shift the signal, but changes it
% its measure and the sign and the measure of its fft. 
% To succeed signal shift its spectrum must be multiplied by one complex exponential.
fs_B = 8000;
f0_B = 100: 125: 475; 
n_B = -100 : 0.1 : 100;

counter = 1;
figure
for j = f0_B
    fd = j / fs_B;
    f_B = -fd/2 : fd/samplesNum : fd/2 - fd/samplesNum;
    x_B = sin(2*pi*fd*n_B + teamNum);
    X_B = fftshift(fft(x_B , samplesNum)) / samplesNum;
    
    subplot(4,1,counter)
    stem(f_B , X_B)
    str = sprintf(['For f0_B = ', num2str(j)]);
    title(str);
    
    counter = counter + 1;
end

f0_B = 7525 : 125 : 7900;

counter = 1;
figure
for j = f0_B
    fd = j / fs_B;
    f_B = -fd/2 : fd/samplesNum : fd/2 - fd/samplesNum;
    x_B = sin(2*pi*fd*n_B + teamNum);
    X_B = fftshift(fft(x_B , samplesNum)) / samplesNum;
    
    subplot(4,1,counter)
    stem(f_B , X_B)
    str = sprintf(['For f0_B = ', num2str(j)]);
    title(str);
    
    counter = counter + 1;
end
