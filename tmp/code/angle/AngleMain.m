function angle_result_list = AngleMain(projection_matrix)
scale_list = GetScale(GetLengthOfProjection(Mark_Point(projection_matrix)));
angle_result = [];
for i = scale_list
    if i * 8 >= 80
        angle_result = [angle_result, 0];
    elseif i * 8 <= 30
        angle_result = [angle_result, pi / 2];
    else
        angle_result = [angle_result, AngleSolve(i * 8)];
    end
end
angle_result_list = [angle_result(1 : 64), -angle_result(65 : 152),...
    angle_result(153 : 180) - pi);
end
