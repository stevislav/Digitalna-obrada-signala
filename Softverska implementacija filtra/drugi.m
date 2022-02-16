clear, close all, clc

L = 1024;
%N = [3, 6, 12];
N = [9, 12, 15];
for i = 1 : 3
    x = [1, zeros(1, L - 1)];
    [B, A] = elipfilter();
    [sos, g] = tf2sos(B, A);
    sos2 = fix(sos * 2 ^ N(i)) / 2 ^ N(i);
    g2 = fix(g * 2^N(i)) / 2^N(i);
    w = zeros(5, 2);
    y = [];

    %pomocna funkcija
    for n = 1 : length(x)
        [y1, w(1, :)] = direct(w(1, :), sos2(1, 1:3), sos2(1, 4:6), x(n) * g2);
        [y2, w(2, :)] = direct(w(2, :), sos2(2, 1:3), sos2(2, 4:6), y1);
        [y3, w(3, :)] = direct(w(3, :), sos2(3, 1:3), sos2(3, 4:6), y2);
        [y4, w(4, :)] = direct(w(4, :), sos2(4, 1:3), sos2(4, 4:6), y3);
        [y(n), w(5, :)] = direct(w(5, :), sos2(5, 1:3), sos2(5, 4:6), y4);
    end

    Y = fft(y, L);
    figure,
    plot(abs(Y))

end
