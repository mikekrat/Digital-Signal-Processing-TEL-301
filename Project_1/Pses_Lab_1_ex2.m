clear all;
close all;

%Sampling periods
Ts_a=1/48;
Ts_b=1/24;
Ts_c=1/12;
Ts_d=1/25;

%Time for each signal
t=0:1/500:0.5;
t_a=0:Ts_a:0.5;
t_b=0:Ts_b:0.5;
t_c=0:Ts_c:0.5;
t_d=0:Ts_d:0.5;

%Signal for different sampling periods
x=5*cos(2*pi*12*t)-2*sin(2*pi*0.75*t);
x_a=5*cos(2*pi*12*t_a)-2*sin(2*pi*0.75*t_a);
x_b=5*cos(2*pi*12*t_b)-2*sin(2*pi*0.75*t_b);
x_c=5*cos(2*pi*12*t_c)-2*sin(2*pi*0.75*t_c);
x_d=5*cos(2*pi*12*t_d)-2*sin(2*pi*0.75*t_d);

% the larger the sampling frequency
% The less information loss and the better the sampled signal analysis.

%Initial signal
figure(1);
subplot(5,1,1);
hold on;
plot(t,x,'b');
title('x(t)');
xlabel('t(s)');
ylabel('x(t)');
hold off;

%Signal with sampled period Ts=1/48s
subplot(5,1,2);
hold on;
plot(t,x,'b');
stem(t_a,x_a);
title('x(t) with sampled period Ts=1/48s');
xlabel('t(s)');
ylabel('x(t)');
hold off;

%Signal with sampled period Ts=1/24s
subplot(5,1,3);
hold on;
plot(t,x,'b');
stem(t_b,x_b);
title('x(t) with sampled period Ts=1/24s');
xlabel('t(s)');
ylabel('x(t)');
hold off;

%Signal with sampled period Ts=1/12s
subplot(5,1,4);
hold on;
plot(t,x,'b');
stem(t_c,x_c);
title('x(t) with sampled period Ts=1/12s');
xlabel('t(s)');
ylabel('x(t)');
hold off;

%Signal with sampled period Ts=1/25s
subplot(5,1,5);
hold on;
plot(t,x,'b');
stem(t_b,x_b);
title('x(t) with sampled period Ts=1/25s');
xlabel('t(s)');
ylabel('x(t)');
hold off;