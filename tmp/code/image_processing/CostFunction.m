function [Cost_1, Cost_2] = CostFunction(pro_test, pro_std, n)
%Cost_1 is sensitive to edge error, while Cost2 is sensitive to average
%error, n is a parameter to control the sensitivity.
if size(pro_test) ~= size(pro_std)
    fprintf('different sizes!\n');
else
    project_test = reshape(pro_test, 1, size(pro_test,1).*size(pro_test, 2));
    project_std = reshape(pro_std, 1, size(pro_std,1).*size(pro_std, 2));
    deffer = project_test - project_std;
    std_sum = sum(project_std, 2);
    Cost_1 = (norm(deffer,2)./ norm(project_std - (std_sum(1)./(size(project_std, 2)))*ones(size(project_std,1), size(project_std,2)), 2)).^(1/n);
    Cost_2 = (norm(deffer,1)./norm(project_std,1)).^(1/n);
end
end