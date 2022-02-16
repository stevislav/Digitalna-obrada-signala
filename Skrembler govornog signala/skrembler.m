function [y] = skrembler(x)
    
    global y0 y1
    fs = 16000;
    fc = 3300;
    w = 2 * pi * (fc / fs);
    
    h = filtar;
    s = @(n) 2 * cos(w * n);
    y0 = conv(h,x);
    n = length(y0);
    n1 = 0:n-1;
    y1 = y0 .* s(n1);
    y = conv(h, y1);
    
end