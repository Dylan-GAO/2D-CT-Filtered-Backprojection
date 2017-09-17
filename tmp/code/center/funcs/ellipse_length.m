function ellipse = ellipse_length(projection_matrix)
projection_length = GetLengthOfProjection(Mark_Point(projection_matrix));
ellipse_pre = zeros(1, size(projection_length, 2));
for i = 1:size(projection_length, 2)
    if projection_length(1, i) <= projection_length(2, i)
        maxnum = projection_length(2, i);
    else
        maxnum = projection_length(1, i);
    end
    ellipse_pre(i) = maxnum;
end
ellipse = ellipse_pre;
end
