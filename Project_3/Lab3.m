clear all;
close all;

%% Exercise 1
%Case 1 (Attenuation = 30 db)
%Butterworth filter

%Sample Frequency
fs = 10000;

%Passband zone in rad/sec
Wp = 2*pi*3000;

%Stopband zone in rad/sec
Ws = 2*pi*4000;

%Ripple
Rp = 3;
 
%Attenuation
Rs1 = 30;

%Frequency Samples
N = 2048;

%Frequecy Range
f = 0: fs/(N-1): fs/2;

%n order of the filter 
[n, Wn] = buttord(Wp, Ws, Rp, Rs1, 's');

%Butterworth filter prototype
%z=zeroes,p=poles,k=gain
[z, p, k] = buttap(n); 

%Convertion of zero-pole-gain filter parameters to transfer
%function form
[numerator, denominator] = zp2tf(z, p, k);

%Analog lowpass filter converted into a lowpass filter with cutoff 
%angular frequency Wn
[num, den] = lp2lp(numerator, denominator, Wn);

%Frequency response of the analog filter returned
f_res_a = freqs(num, den, length(f));

%Converts the s-domain transfer function to discrete equivalent
[numer_30, denom_30] = bilinear(num, den, fs);

%Frequency respone of digital filter returned
f_res_d = freqz(numer_30, denom_30,length(f));


figure(1);
plot(f, (abs(f_res_a)));
hold on;
plot(f, (abs(f_res_d)));
hold off;
legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Butterworth Lowpass Filter with 30 db attenuation');

figure(2);
%Converts the magnitude to decibels with mag2db
plot(f, mag2db(abs(f_res_a)));
hold on;
plot(f, mag2db(abs(f_res_d)));
hold off;
legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('Butterworth Lowpass Filter with 30 db attenuation');

%Case 2 (Attenuation = 50 db)

%Attenuation
Rs2 = 50;

%n order of the filter 
[n, Wn] = buttord(Wp, Ws, Rp, Rs2, 's');

%Butterworth filter prototype
%z=zeroes,p=poles,k=gain
[z, p, k] = buttap(n); 

%Convertion of zero-pole-gain filter parameters to transfer
%function form
[numerator, denominator] = zp2tf(z, p, k);

%Analog lowpass filter converted into a lowpass filter with cutoff 
%angular frequency Wn
[num, den] = lp2lp(numerator, denominator, Wn);

%Frequency response of the analog filter returned
f_res_a = freqs(num, den, length(f));

%Converts the s-domain transfer function to discrete equivalent
[numer_50, denom_50] = bilinear(num, den, fs);

%Frequency respone of digital filter returned
f_res_d = freqz(numer_50, denom_50, length(f));

figure(3);
plot(f,(abs(f_res_a)));
hold on;
plot(f,(abs(f_res_d)));
hold off;
legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Butterworth Lowpass Filter with 50 db attenuation');

figure(4);
%Converts the magnitude to decibels with mag2db
plot(f,mag2db(abs(f_res_a)));
hold on;
plot(f,mag2db(abs(f_res_d)));
hold off;
legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('Butterworth Lowpass Filter with 50 db attenuation');

%% Exercise 2
%Filter Order
n1 = 2;
n2 = 16;

%Sample Period
Ts = 0.2;

%Sample Frequency
Fs = 1/Ts;

%Passband Ripple
Rp = 3;

%Cutoff Angular in rad/sec
Wc = 2;

%Wc_dig = Wc / (Ws/2) 
%Cutoff Frequency
Fc = Wc/ (2*pi);

%Samples
N = 256;

%Range
Freq_Range = 0: 1/(N - 1): 1;

[b, a] = cheby1(n1, Rp, Fc/(Fs/2), 'high');
%Frequency respone of digital filter returned
f_res_d1 = freqz(b,a,N);

[b1, a1] = cheby1(n2, Rp, Fc/(Fs/2), 'high');
%Frequency respone of digital filter returned
f_res_d2 = freqz(b1, a1, N);

figure(5);
%Converts the magnitude to decibels with mag2db
plot(Freq_Range, mag2db(abs(f_res_d1)));
hold on;
plot(Freq_Range, mag2db(abs(f_res_d2)));
hold off;
legend('n1 = 2', 'n2 = 16');
xlabel('Frequency (rad/sample)');
ylabel('Amplitude (dB)');
title('Chebyshev Highpass Filter');

%% Exercise 3
% A

Wp = 2* pi* 3000;
Ws = 2* pi* 4000;
Ts = 1 / fs;
t = 0: 499;
sizeof_t = length(t);
x = 1 + cos(1000 *t *Ts) + cos(16000 *t *Ts) + cos(30000 *t *Ts);

figure(6);
subplot(2,1,1);
plot(t, x);
grid on;
title('x(t) before filtering');
xlabel('t(sec)');
ylabel('x(t)');

F = -fs/2: fs / sizeof_t: fs/2 - fs / sizeof_t;
X = fftshift(fft(x));

subplot(2,1,2);
plot(F, abs(X));
title('FFT of x(t) before filtering');
xlabel('Frequency');
ylabel('X(F)');

x_fil30 = filter(numer_30, denom_30, x);

figure(7);
subplot(2,1,1);
plot(t, x_fil30);
grid on;
title('x(t) after filtering with attenuation stopband zone 30db');
xlabel('t(sec)');
ylabel('x(t)');

X_fil30 = fftshift(fft(x_fil30));

subplot(2,1,2);
plot(F, abs(X_fil30));
title('FFT of x(t) after filtering with attenuation stopband zone 30db');
xlabel('Frequency');
ylabel('X(F)');

x_fil50 = filter(numer_50, denom_50, x);

figure(8);
subplot(2,1,1);
plot(t, x_fil50);
grid on;
title('x(t) after filtering with attenuation stopband zone 50db');
xlabel('t(sec)');
ylabel('x(t)');

X_fil50 = fftshift(fft(x_fil50));

subplot(2,1,2);
plot(F, abs(X_fil50));
title('FFT of x(t) after filtering with attenuation stopband zone 50db');
xlabel('Frequency');
ylabel('X(F)');

%B

Ts = 0.2;
Fs = 1/Ts;
x = 1 + cos(1.5* t* Ts) + cos(5* t* Ts);

figure(9);
subplot(2,1,1);
plot(t,x);
grid;
title('x(t) before filtering');
xlabel('time(Sec)');
ylabel('x(t)');

F = -Fs/2: Fs/sizeof_t: Fs/2 - Fs/sizeof_t;
X = fftshift(fft(x));
subplot(2,1,2);
plot(F, abs(X));
title('FFT of x(t) before filtering');
xlabel('Frequency');
ylabel('X(F)');

x_fil2 = filter(b1, a1, x);

figure(10);
subplot(2,1,1);
plot(t, x_fil2);
grid on;
title('x(t) after filtering with Chebyshev Highpass Filter n=16');
xlabel('t(sec)');
ylabel('x(t)');

X_fil2 = fftshift(fft(x_fil2));

subplot(2,1,2);
plot(F, abs(X_fil2));
title('FFT of x(t) after filtering with Chebyshev Highpass Filter n=16');
xlabel('Frequency');
ylabel('X(F)');