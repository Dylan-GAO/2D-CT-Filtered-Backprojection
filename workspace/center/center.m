%
% n1_1 = 209.5;
% n1_2 = 140.5;
% n2_1 = 210.5;
% n2_2 = 401.5;
%
% cenfunc(n1_1, n1_2, n2_1, n2_2)
%

% origin data
d = 0.2774;
a = 40;
b = 15;
c = sqrt(a^2 - b^2);
e = c / a;

% 1st line
% parameter
n1_1 = 209.5; % data_2(:, 13) num of tuoyuan
n1_2 = 140.5;

y0_2 = (a^2 - (2 * a * b / (n1_1 * d))^2) / e^2;
x0_2 = (1 - y0_2 / a^2) * b^2;
y0 = sqrt(y0_2);
x0 = sqrt(x0_2);
y1_k = - x0 * a^2 / (b^2 * y0);
y1_bias = a^2 / y0;
fprintf('y1 = %f*x + %f\n', y1_k, y1_bias);
% y1 = -1.1046*x + 43.2957;

y1_bias = y1_bias + n1_2 * d / sin(pi / 2 + atan(y1_k));
fprintf('y1_edited = %f*x + %f\n', y1_k, y1_bias);
% y1_edited = -1.104572*x + 101.367747;

% memory clear
clear n1_1 n1_2 x0_2 y0_2 y0 x0

% 2nd line
% parameter
n2_1 = 210.5; % data_2(:, 109) num of tuoyuan
n2_2 = 401.5;

y0_2 = (a^2 - (2 * a * b / (n2_1 * d))^2) / e^2;
x0_2 = (1 - y0_2 / a^2) * b^2;
y0 = -sqrt(y0_2);
x0 = sqrt(x0_2);
y2_k = - x0 * a^2 / (b^2 * y0);
y2_bias = a^2 / y0;
fprintf('y2 = %f*x + %f\n', y2_k, y2_bias);
% y2 = 1.0916*x - 43.2214;

y2_bias = y2_bias + n2_2 * d / cos(atan(y2_k));
fprintf('y2_edited = %f*x + %f\n', y2_k, y2_bias);
% y2_edited = 1.091554*x + 208.099009;

% memory clear
clear n2_1 n2_2 x0_2 y0_2 y0 x0

% 3rd line
% parameter
n3 = 279;

y3_k = 0;
y3_bias = n3 * d;
fprintf('y3 = %f*x + %f\n', y3_k, y3_bias);
% y3 = 0.000000*x + 77.394600;

% test
%y3_bias = 0;

% plot
x = -100 : 0.1 : 100;
y1 = y1_k * x + y1_bias;
y2 = y2_k * x + y2_bias;
y3 = y3_k * x + y3_bias;
figure
%axis([-50 50 -50 50])
plot(x, y1);
hold on
plot(x, y2);
hold on
plot(x ,y3);

% move
% res = [y3_bias-y2_bias y3_bias-y1_bias] / [y2_k-y3_k y1_k-y3_k; -2 -2];
res = [y2_bias/sqrt(y2_k^2+1)-y1_bias/sqrt(y1_k^2+1) y2_bias/sqrt(y2_k^2+1)-y3_bias/sqrt(y3_k^2+1)]/...
    [y1_k/sqrt(y1_k^2+1)-y2_k/sqrt(y2_k^2+1) y3_k/sqrt(y3_k^2+1)-y2_k/sqrt(y2_k^2+1);
     1/sqrt(y1_k^2+1)-1/sqrt(y2_k^2+1) 1/sqrt(y3_k^2+1)-1/sqrt(y2_k^2+1)];

x_cen = res(1);
y_cen = res(2);
fprintf('x_cen = %f, y_cen = %f\n', x_cen, y_cen);

% plot
plot(x,sqrt((1-x.^2/15^2)*40^2));
plot(x,-sqrt((1-x.^2/15^2)*40^2));
scatter(x_cen, y_cen);
