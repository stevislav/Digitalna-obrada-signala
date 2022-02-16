function [h] = filtar

    M = 150;
    fs = 16000;
    fc = 3300;

    wn = (1/(fs/2)) * fc;
    h = fir1(M, wn, 'low', window(@hann,M+1));

end