function edge = edge_length(projection_matrix)
mark_point_matrix = Mark_Point(projection_matrix);
edge_list = zeros(1,size(mark_point_matrix, 2));
for i = 1:size(mark_point_matrix, 2)
    not_zero = [];
    for j = 1:size(mark_point_matrix, 1)
        if mark_point_matrix(j,i) ~= 0
            not_zero = [not_zero, mark_point_matrix(j,i)];
        end
    end
    if (i >= 1)&&(i<= 61)
        edge_list(i) = 512 - not_zero(2) + 1;
    elseif (i >= 62)&&(i <= 109)
        edge_list(i) = 512 - not_zero(1) + 1;
    else
        edge_list(i) = 512 - not_zero(3) + 1;
    end
end
edge = edge_list;
end

        
