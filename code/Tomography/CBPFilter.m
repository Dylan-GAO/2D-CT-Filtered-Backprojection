function [h,n] = CBPFilter(L)

n = -L:1:L;

h = (1/2)*sinc(n) - (1/4)*(sinc(n/2)).^2;

