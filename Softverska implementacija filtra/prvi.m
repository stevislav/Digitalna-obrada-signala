clear, close all, clc

N = 9;
wp = 0.8;
Rp = 1;
Rs = 60;
[B, A] = ellip(N, Rp, Rs, wp, 'high');

[H, w] = freqz(B, A, 1024);
tau = grpdelay(B, A, 1024);

figure,
subplot(2, 2, 1),
plot(w / pi, abs(H))
title('Amplitudska karakteristika')
subplot(2, 2, 2),
plot(w / pi, unwrap(phase(H)))
title('Fazna karakteristika')
subplot(2, 2, 3),
plot(w / pi, tau)
title('Grupno kasnjenje')