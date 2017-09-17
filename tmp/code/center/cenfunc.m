function res = cenfunc(n1_1, n1_2, n2_1, n2_2)
% origin data
d = 0.2774;
a = 40;
b = 15;
c = sqrt(a^2 - b^2);
e = c / a;
n3 = 279;

% 1st line
y0_2 = (a^2 - (2 * a * b / (n1_1 * d))^2) / e^2;
x0_2 = (1 - y0_2 / a^2) * b^2;
y0 = sqrt(y0_2);
x0 = sqrt(x0_2);
y1_k = - x0 * a^2 / (b^2 * y0);
y1_bias = a^2 / y0;
y1_bias = y1_bias + n1_2 * d / sin(pi / 2 + atan(y1_k));

% 2nd line
y0_2 = (a^2 - (2 * a * b / (n2_1 * d))^2) / e^2;
x0_2 = (1 - y0_2 / a^2) * b^2;
y0 = -sqrt(y0_2);
x0 = sqrt(x0_2);
y2_k = - x0 * a^2 / (b^2 * y0);
y2_bias = a^2 / y0;
y2_bias = y2_bias + n2_2 * d / cos(atan(y2_k));

% 3rd line
y3_k = 0;
y3_bias = n3 * d;

% move
res = [y2_bias/sqrt(y2_k^2+1)-y1_bias/sqrt(y1_k^2+1) y2_bias/sqrt(y2_k^2+1)-y3_bias/sqrt(y3_k^2+1)]/...
    [y1_k/sqrt(y1_k^2+1)-y2_k/sqrt(y2_k^2+1) y3_k/sqrt(y3_k^2+1)-y2_k/sqrt(y2_k^2+1);
     1/sqrt(y1_k^2+1)-1/sqrt(y2_k^2+1) 1/sqrt(y3_k^2+1)-1/sqrt(y2_k^2+1)];
end