function angle_result = AngleSolve(projection_scale)
%projrction_scale = S(ellipse)/S(circle), angles used degree.
syms pro_angle
syms equ
equ = (5.*abs(tan(pro_angle)).*sqrt(64+9.*(tan(pro_angle)).^2))./(4.*(1+(tan(pro_angle)).^2)) - projection_scale;
angle_pre = solve(equ,'pro_angle');
k = 1;
angle_result = [];
for i = 1:size(angle_pre,1)
    if ~isreal(angle_pre(i))
        angle_result(k) = atan(imag(angle_pre(i))/real(angle_pre(i)));
        k = k+1;
    end
end
end