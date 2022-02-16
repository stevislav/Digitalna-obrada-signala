function [out_sample, w] = cascade(w, sos, g, input_sample)

[y1, w(1, :)] = direct(w(1, :), sos(1, 1:3), sos(1, 4:6), input_sample * g);
[y2, w(2, :)] = direct(w(2, :), sos(2, 1:3), sos(2, 4:6), y1);
[y3, w(3, :)] = direct(w(3, :), sos(3, 1:3), sos(3, 4:6), y2);
[out_sample, w(4, :)] = direct(w(4, :), sos(4, 1:3), sos(4, 4:6), y3);

end

