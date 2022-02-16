clear, close all, clc 

fs = 16000;
fc = 3300;
f1 = 300;
f2 = 3000;
f3 = 5000;
n = 0:16000-1 ;
w1 = 2 * pi * (f1 / fs);
w2 = 2 * pi * (f2 / fs);
w3 = 2 * pi * (f3 / fs);

a = @(n) sin(w1 * n);
b = @(n) sin(w2 * n);
c = @(n) sin(w3 * n);

x = [a(n)  b(n)  c(n)];

skrembl = skrembler(x);
[H1, w] = freqz(x, 1000);
[H2] = freqz(skrembl, 1000);

figure,
subplot(2, 1, 1),
plot(w / pi, abs(H1))
title('amplitudska karakteristika ulaznog signala')
subplot(2, 1, 2),
plot(w / pi, abs(H2))
title('amplitudska karakteristika izlaznog signala')




