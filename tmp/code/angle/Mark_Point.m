function mark_point_matrix = Mark_Point(projection_matrix)
mark_point = zeros(size(projection_matrix));
for i = 1 : size(projection_matrix, 2)
    if projection_matrix(1,i) == 0
        flag = 0;
    else
        flag = 1;
    end
    for j = 2:size(projection_matrix, 1)
        if projection_matrix(j,i) == 0
            next_flag = 0;
        else
            next_flag = 1;
        end
        if next_flag ~= flag
            mark_point(j,i) = j;
        end
        flag = next_flag;
    end
end
mark_point_matrix = mark_point;
end
