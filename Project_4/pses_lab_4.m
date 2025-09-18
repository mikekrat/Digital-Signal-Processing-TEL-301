clear all;
close all;

%% EXERCISE 1
%Initial data
Wc = 0.4* pi;
Fs = 0.1* (10^3);
N = 21;

%Create Wc digital signal -> argument to cheby1()
Ws = 2* pi* Fs;
%Use Ws/2 to present it in the right format
Wc_d = Wc / (Ws/2);

Lp_1 = fir1(N-1, Wc_d, 'low', rectwin(N));
Lp_2 = fir1(N-1, Wc_d, 'low', hamming(N));
[H_1, w_1] = freqz(Lp_1, N);
[H_2, w_2] = freqz(Lp_2, N);

figure
x_1 = w_1/pi;
plot(x_1, abs(H_1), 'r')
hold on;
x_2 = w_2/pi;
plot(x_2, abs(H_2), 'b')
title('LP-FIR filter with hamming and rectangular windows')
legend('Rectangular', 'Hamming')
xlabel('f')
ylabel('dB')

%% Exercise 2
% A

Fs = 100;
W = 0.5 *pi;
Wc = W / (pi* Fs);
N1 = 21;
N2 = 41;

win1 = fir1(N1-1, Wc, hamming(N1));
[Ham1, W1] = freqz(win1,N1);

win2 = fir1(N2-1, Wc, hamming(N2));
[Ham2, W2] = freqz(win2,N2);

figure
subplot(1,2,1)
plot(W1, abs(Ham1))
grid on
title('Hamming window, N=21')
xlabel('Angular frequency')
ylabel('Ham1')

subplot(1,2,2)
plot(W2, abs(Ham2))
grid on
title('Hamming window, N=41')
xlabel('Angular frequency')
ylabel('Ham2')

win3 = fir1(N1-1, Wc, hanning(N1));
[Han1, W3] = freqz(win3, N1);

win4 = fir1(N2-1, Wc, hanning(N2));
[Han2, W4] = freqz(win4, N2);

figure
subplot(1,2,1)
plot(W3, abs(Han1))
grid on
title('Hanning window, N=21')
xlabel('Angular frequency')
ylabel('Han1')

subplot(1,2,2)
plot(W4, abs(Han2))
grid on
title('Hanning window, N=41')
xlabel('Angular frequency')
ylabel('Han2')

% B

Ts = 1 / Fs; 
t = 0: Ts: 500*Ts - Ts;
sizeof_t = length(t);
x = sin(15* t) + 0.25* sin(200* t);

figure
subplot(2,1,1)
plot(t, x)
grid on
title('x(t) before filtering')
xlabel('t(sec)')
ylabel('x(t)')

F = -Fs/2: Fs / sizeof_t: Fs/2 - Fs / sizeof_t;
X = fftshift(fft(x));

subplot(2,1,2)
plot(F, abs(X))
grid on
title('FFT of x(t) before filtering')
xlabel('Frequency')
ylabel('X(F)')

x_fil_Ham1 = filter(Ham1, 1, x);
x_fil_Ham2 = filter(Ham2, 1, x);
x_fil_Han1 = filter(Han1, 1, x);
x_fil_Han2 = filter(Han2, 1, x);

X_fil_Ham1 = abs(fftshift(fft(x_fil_Ham1)));
X_fil_Ham2 = abs(fftshift(fft(x_fil_Ham2)));
X_fil_Han1 = abs(fftshift(fft(x_fil_Han1)));
X_fil_Han2 = abs(fftshift(fft(x_fil_Han2)));

figure
subplot(2,2,1)
plot(F, X_fil_Ham1)
grid on
title('FFT of filtered x(t) with Hamming window, N=21')

subplot(2,2,2)
plot(F, X_fil_Ham2)
grid on
title('FFT of filtered x(t) with Hamming window, N=41')

subplot(2,2,3)
plot(F, X_fil_Han1)
grid on
title('FFT of filtered x(t) with Hanning window, N=21')

subplot(2,2,4)
plot(F, X_fil_Han2)
grid on
title('FFT of filtered x(t) with Hanning window, N=41')

% C

Fs=50;
Ts=1/Fs;
t = 0: Ts: 500*Ts - Ts;
sizeof_t = length(t);
x = sin(15* t) + 0.25* sin(200* t);

figure
subplot(2,1,1)
plot(t, x)
grid on
title('x(t) before filtering')
xlabel('t(sec)')
ylabel('x(t)')

F = -Fs/2: Fs / sizeof_t: Fs/2 - Fs / sizeof_t;
X = fftshift(fft(x));

subplot(2,1,2)
plot(F, abs(X))
grid on
title('FFT of x(t) before filtering')
xlabel('Frequency')
ylabel('X(F)')

x_fil_Ham1 = filter(Ham1, 1, x);
x_fil_Ham2 = filter(Ham2, 1, x);
x_fil_Han1 = filter(Han1, 1, x);
x_fil_Han2 = filter(Han2, 1, x);

X_fil_Ham1 = abs(fftshift(fft(x_fil_Ham1)));
X_fil_Ham2 = abs(fftshift(fft(x_fil_Ham2)));
X_fil_Han1 = abs(fftshift(fft(x_fil_Han1)));
X_fil_Han2 = abs(fftshift(fft(x_fil_Han2)));

figure
subplot(2,2,1)
plot(F, X_fil_Ham1)
grid on
title('FFT of filtered x(t) with Hamming window, N=21')

subplot(2,2,2)
plot(F, X_fil_Ham2)
grid on
title('FFT of filtered x(t) with Hamming window, N=41')

subplot(2,2,3)
plot(F, X_fil_Han1)
grid on
title('FFT of filtered x(t) with Hanning window, N=21')

subplot(2,2,4)
plot(F, X_fil_Han2)
grid on
title('FFT of filtered x(t) with Hanning window, N=41')

