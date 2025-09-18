clear all;
close all;

%% 1_b

fs=1;
ts=1/fs;
numerator = [0, 0.2, 0];
denominator = [1, -0.7, -0.18];
Hz = tf(numerator,denominator,ts);

figure(1)
zplane(numerator,denominator);
title('Poles - Zeros diagram')

%% 1_d

step = pi / 128;
F = -pi : step : pi;

figure(2)
freqz(numerator, denominator, F)
title('System Frequency Response')

figure(3)
freqz(numerator, denominator)
title('System Frequency Response without passing F as a parameter to freqz')

%% 1_e

figure(4)
numerator = [ 0, 0.2, 0, 0 ];
denominator = [ 1, -1.7, 0.52, 0.18 ];
freqz(numerator, denominator, F)
title('System Frequency Response with a pole "added" on z=1')

%% 2.a
numerator=[4 -3.5 0];
denominator=[1 -2.5 1];
[r,p,k]=residuez(numerator,denominator);
syms z
H=r(1)/(1-p(1)*z^(-1)) + r(2)/(1-p(2)*z^(-1));
pretty(H)


%% 2.b
h=iztrans(H)


