function length_projection = GetLengthOfProjection(mark_point_matrix)
length_vector = zeros(2,size(mark_point_matrix, 2));
for i = 1:size(mark_point_matrix, 2)
    not_zero = [];
    for j = 1:size(mark_point_matrix, 1)
        if mark_point_matrix(j,i) ~= 0
            not_zero = [not_zero, mark_point_matrix(j,i)];
        end
    end
    if isempty(not_zero)
        length_vector(:,i) = [0;0];
    elseif length(not_zero) == 2
        length_vector(:,i) = [not_zero(2)-not_zero(1);0];
    else
        length_vector(:,i) = [not_zero(2)-not_zero(1);not_zero(4)-not_zero(3)];
    end
end
length_projection = length_vector;
end