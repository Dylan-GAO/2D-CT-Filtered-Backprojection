function z = Phantom(x,y)

size = max([abs(x),abs(y)]);

[x,y] = meshgrid(x,y);

z1 = (16*(x.*x) + (y.*y))< (size/1.5)^2;

xx = x-15;
yy = y;
z2 = ( xx.*xx + yy.*yy )< (size/8)^2;

z = 0.9*(z2) + .5*(z1);
