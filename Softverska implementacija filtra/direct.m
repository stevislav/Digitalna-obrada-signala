function [out_sample, w] = direct(w, B, A, input_sample)

x = input_sample;

N = length(B) - 1;
b0 = B(1);
b = B(2 : end);
a = A(2 : end);

w0 = x;
for i = 1 : N
    w0 = w0 - a(i) * w(i);
end

out_sample = b0 * w0;
for i = 1 : N
    out_sample = out_sample + w(i) * b(i);
end

w(2 : end) = w(1 : end - 1);
w(1) = w0;

end