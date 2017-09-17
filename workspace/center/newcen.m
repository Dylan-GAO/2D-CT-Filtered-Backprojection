%load ../data.mat data_2

tmp1 = [];
for i = 1 : 13
    tmp1 = [tmp1 data_2(:,i)];
end

for i = 1 : 13
    for j = 371 : 512
        tmp1(j, i) = 0;
    end
end

for i = 1 : 512
    for j = 1 : 13
        if tmp1(i, j) ~= 0
            tmp1(i, j) = 1;
        end
    end
end

n1_1 = sum(tmp1);

n1_2 = [];
for i = 1 : 13
    for j = 512 : -1 : 1
        if tmp1(j,i)~=0
            n1_2 = [n1_2 j];
            break;
        end
    end
end
n1_2 = 512 - n1_2 + 1;

%%

tmp1=[];
for i = 140 : 152
    tmp1 = [tmp1 data_2(:, i)];
end

for i = 1 : 13
    for j = 1 : 80
        tmp1(j,i) = 0;
    end
end

for i = 1 : 512
    for j = 1 : 13
        if tmp1(i, j) ~= 0
            tmp1(i, j) = 1;
        end
    end
end

n2_1 = sum(tmp1);

n2_2 = [];
for i = 1 : 13
    for j = 1 : 512
        if tmp1(j, i) ~= 0
            n2_2 = [n2_2 j];
            break;
        end
    end
end
n2_2 = 512-n2_2+1;

%disp(n1_1);
%disp(n1_2);
%disp(n2_1);
%disp(n2_2);

r = [];
for i = 1 : 13
    for j = 1 : 13
        tmp3 = cenfunc(n1_1(i), n1_2(i), n2_1(j), n2_2(j));
        if imag(tmp3) == 0
            r = [r; tmp3];
        end
    end
end


figure
scatter(r(:, 1), r(:, 2));
hold on

% scatter(-9.5471, -6.9475);

x_cen = mean(r(:,1));
y_cen = mean(r(:,2));
scatter(x_cen,y_cen);
disp([x_cen y_cen]);
axis([-50 50 -50 50])