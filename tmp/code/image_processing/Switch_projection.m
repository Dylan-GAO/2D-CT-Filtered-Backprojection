function [pro_after_switch, pro_ref] = Switch_projection(pro, pro_ref)
if size(pro) ~= size(pro_ref)
    fprintf('different sizes!\n');
else
    project = reshape(pro, 1, size(pro,1) .* size(pro, 2));
    project_ref = reshape(pro_ref, 1, size(pro_ref,1) .* size(pro_ref, 2));
    for i = 1:size(project_ref, 2)
        if project_ref(i) ~= 0
            head_ref = i;
            break
        end
    end
    for j = 1:size(project_ref, 2)
        k = size(project_ref,2) - j + 1;
        if project_ref(k) ~= 0
            tail_ref = k;
            break
        end
    end
    for a = 1:size(project,2)
        if project(i) ~= 0
            head = i;
            break
        end
    end
    for b = 1:size(project, 2)
        c = size(project, 2) - b + 1;
        if project(c) ~= 0
            tail = c;
            break
        end
    end
    