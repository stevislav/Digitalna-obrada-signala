clear, close all, clc

L = 1024;
N = [3, 6, 12];
for i= 1 : 3
    x = [1, zeros(1, L - 1)];
    [B, A] = elipfilter;
    [r, p, k] = residuez(B, A);
    w = zeros(5, 2);
    y = [];
    
    for n = 1 : length(x)
        [B1, A1] = uparivanje(r(1), r(2), p(1), p(2), N(i));
        [y1, w(1, :)] = direct(w(1, :), B1, A1, x(n));
        [B2, A2] = uparivanje(r(3), r(4), p(3), p(4), N(i));
        [y2, w(2, :)] = direct(w(2, :), B2, A2, x(n));
        [B3, A3] = uparivanje(r(5), r(6), p(5), p(6), N(i));
        [y3, w(3, :)] = direct(w(3, :), B3, A3, x(n));
        [B4, A4] = uparivanje(r(7), r(8), p(7), p(8), N(i));
        [y4, w(4, :)] = direct(w(4, :), B4, A4, x(n));
        [y5, w(5, :)] = direct(w(5, :), [fix(r(9)* 2^N(i))/2^N(i),0,0], [1, fix(-p(9)* 2^N(i))/2^N(i),0], x(n));
        y(n) =  k * x(n) + y1 + y2 + y3 + y4 + y5;
    end
    
    Y = fft(y,L);
    figure,
    plot(abs(Y))

end
