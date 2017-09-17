function ff = myfilter(PR)

a = 1;
[Length, Count] = size(PR);
w = [-pi : (2 * pi) / Length : pi - (2 * pi) / Length];

rn1 = abs(2 / a * sin(a .* w ./ 2));
rn2 = sin(a .* w ./ 2);
rd = (a * w) ./ 2;
r = rn1 * (rn2 / rd)^2;

f = fftshift(r);
for i = 1:Count
    IMG = fft(PR(:, i));
    fimg = IMG .* f';
    ff(:, i) = ifft(fimg);
end
ff = real(ff);
end