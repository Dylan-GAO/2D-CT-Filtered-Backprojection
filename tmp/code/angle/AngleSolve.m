function angle = AngleSolve(s1)
syms pro_angle
syms equ
equ = 10 * sqrt(((64 + 9 * (tan(pro_angle))^2)) / (1 + (tan(pro_angle))^2)) - s1;
angle_result = roundn(eval(solve(equ, 'pro_angle')), -4);
%angle_result = rad2deg(angle_result)
angle = abs(angle_result(1));
end