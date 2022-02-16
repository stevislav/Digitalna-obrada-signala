function [Bi, Ai] = uparivanje(r, rk, p, pk, n)

    Ait = poly([p, pk]);
    Ai = fix(Ait * 2 ^ n) / 2 ^ n;
    Bit = real([r + rk, -(r * pk + rk * p), 0]);
    Bi = fix(Bit * 2^n) / 2^n;
    
end

