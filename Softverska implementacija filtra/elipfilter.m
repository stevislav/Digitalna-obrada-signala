function [B,A] = elipfilter()

    N = 9;
    Wp = 0.8;
    Rp = 1;
    Rs = 60;
    [B, A] = ellip(N, Rp, Rs, Wp, 'high');

end

