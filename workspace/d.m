data = data_2;
data(:, 14 : 108) = 0;
for i = 1 : 13
data(1 : 370, i) = 0;
end
for i = 109 : 180
data(112 : 512, i) = 0;
end
b=[];
for i = 1 : 180
b = [b length(find(data(:,i)))];
end
b = [b(1:13) b(109:180)];
d = 8 / mean(b);
disp(d);