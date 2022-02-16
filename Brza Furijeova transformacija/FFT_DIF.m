function [ y ] = FFT_DIF( x )                                          
p = nextpow2(length(x));                                                   % provera velicine ulaznog niza
x = [x zeros(1, (2^p) - length(x))];                                       % punjenje nulama
N = length(x);                                                             % duzina niza
S = log2(N);                                                               % broj faza
Half = N / 2;                                                              % polovina duzine niza
for faza = 1 : S;                                                          % faze transformacije
    for index = 0 : (N / ( 2^(faza - 1))) : (N - 1);                       % broj "leptira" za svaku fazu
        for n = 0 : (Half - 1);                                            % kreiranje "leptira" i cuvanje vrednosti
            pos = n + index + 1;                                           % pozicioni indeks
            pow = (2^(faza - 1)) * n;                                      % deo za stepenovanje kompleksnih brojeva
            w = exp((-1i) * (2 * pi) * pow / N);                           % kompleksno mnozenje
            a = x(pos) + x(pos + Half);                                    % prvi deo leptira
            b =(x(pos) - x(pos + Half)).*w;                                % drugi deo leptira
            x(pos) = a;                                                    % cuvanje vrednosti prvog dela
            x(pos + Half) = b;                                             % cuvanje vrednosti drugog dela
        end;
    end;
Half = Half / 2;                                                           % racunanje nove "Half" vrednosti
end;
y = bitrevorder(x);                                                        % invertovanje bitova i vracanje rezultata
end
