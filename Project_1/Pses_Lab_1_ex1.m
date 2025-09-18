% u[n-2] * (1/2)^|n|

nx = [-15:1:15];
ny = [-10:1:10];

x = (nx>=2);
y = (1/2).^abs(ny);

nz = nx(1) + ny(1):nx(end) + ny(end);
LenX = length(x);
LenY = length(y);
LenZ = length(nz);

x0 = [zeros(1,LenY-1), x, zeros(1,LenY-1)]; %zero padding
nx0 = nx(1) - (LenY-1): nx(end) + (LenY-1);

y_rev = y(end:-1:1);

for i=1:LenZ
    y_rev0 = [zeros(1,(i-1)) y_rev zeros(1, (LenZ-i))]; % i indicates shifting
    z(i) = sum(x0.*y_rev0);    
end

% z without conv
figure(1);
stem(nz, z);
title('Convolution without using conv command');
ylabel('z[n]');
xlabel('n');
xlim([-30 30]);
%z with conv
z2 = conv(x,y);
figure(2);
stem(nz, z2);
title('Convolution using conv command');
ylabel('z[n]');
xlabel('n');
xlim([-30 30]);


% B erwthma



F1 = fft(x, length(nz));
F2 = fft(y, length(nz));
F = F1.*F2;
% z with fft and ifft
figure(3);
stem(nz, ifft(F));
title('z by multiplying X and Y');
ylabel('z[n]');
xlabel('n');
xlim([-30 30]);
ylim([-0.5 3]);