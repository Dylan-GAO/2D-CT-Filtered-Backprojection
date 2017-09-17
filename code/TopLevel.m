ellipse_a = ellipse_length(data_2);
edge = edge_length(data_2);
n1_1 = [ellipse_a(1:13) ellipse_a(22:61)];
n1_2 = [edge(1:13) edge(22:61)];

n2_1 = [ellipse_a(61:100) ellipse_a(109:180)];
n2_2 = [edge(61:100) edge(109:180)];

r = [];
for i = 1 : 1
    for j = 1 : 10
        tmp3 = cenfunc(n1_1(i), n1_2(i), n2_1(j), n2_2(j));
        if imag(tmp3) == 0
            r = [r; tmp3];
        end
    end
end

scatter(r(:,1),r(:,2));
axis([-50 50 -50 50]);