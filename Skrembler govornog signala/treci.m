clear, close all, clc

global y0 y1
[x1, Fs] = audioread('kum.wav');
x2 = x1';
y = skrembler(x2);
yP = skrembler(y1);

[H1, w] = freqz(x2, 1000);
[H2] = freqz(y, 1000);
[H3] = freqz(y0, 1000);
[H4] = freqz(y1, 1000);

figure,
subplot(2, 2, 1),
plot(w / pi, abs(H1))
title('amplitudska karakteristika x[n]')
subplot(2, 2, 2),
plot(w / pi, abs(H3))
title('amplitudska karakteristika y0[n]')  
subplot(2, 2, 3),
plot(w / pi, abs(H4))
title('amplitudska karakteristika y1[n]')
subplot(2, 2, 4),
plot(w / pi, abs(H2))
title('amplitudska karakteristika y2[n]')

%sound(y, Fs)
%sound(yP,Fs)

