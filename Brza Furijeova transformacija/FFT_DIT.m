function [ y ] = FFT_DIT( x )                                            
p = nextpow2(length(x));                                                   % provera velicine ulaznog niza
x = [x zeros(1,(2^p) - length(x))];                                        % punjenje nulama
N = length(x);                                                             % duzina niza
S = log2(N);                                                               % broj faza
Half = 1;                                                                  % inicijalna "Half" vrednost
x = bitrevorder(x);                                                        % invertovanje bitova
for faza = 1 : S;                                                          % faze transformacije
    for index = 0 : (2^faza) : (N-1);                                      % broj "leptira" za svaku fazu
        for n = 0 : (Half - 1);                                            % kreiranje "leptira" i cuvanje vrednosti
            pos = n + index + 1;                                           % pozicioni indeks
            pow = (2^(S - faza)) * n;                                      % deo za stepenovanje kompleksnih brojeva
            w = exp((-1i) * (2 * pi) * pow / N);                           % kompleksno mnozenje
            a = x(pos) + x(pos + Half) .* w;                               % prvi deo leptira
            b = x(pos) - x(pos + Half) .* w;                               % drugi deo leptira
            x(pos) = a;                                                    % cuvanje vrednosti prvog dela
            x(pos + Half) = b;                                             % cuvanje vrednosti drugog dela
        end;
    end;
Half = 2 * Half;                                                           % racunanje nove "Half" vrednosti
end;
y = x;                                                                     % rezultat funkcije
end