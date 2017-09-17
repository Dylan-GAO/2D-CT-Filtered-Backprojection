function opt = GradientDescend(val_0,val_std,steps, eta, n, n_earlystop)
%Only can be used with Cost_1.
if size(val_0) ~= size(val_std)
    fprintf('different sizes!\n');
else
    cost_list = [];
    value_0 = reshape(val_0, 1, size(val_0,1).*size(val_0, 2));
    value_std = reshape(val_std, 1, size(val_std,1).*size(val_std, 2));
    opt = value_0;
    cost = CostFunction(value_0, value_std,n);
    fprintf('Cost = %.4f\n',cost);
    cost_list = [cost_list;cost];
    for i = 1:steps
        opt = opt - (eta.*cost(1)./(n.*(norm(opt - value_std, 2)).^2))*(opt - value_std);
        cost = CostFunction(opt, value_std,n);
        fprintf('Cost = %.4f\n',cost);
        cost_list = [cost_list;cost];
        fli_cost_list = flipud(cost_list);
        if fli_cost_list(1) >= fli_cost_list(2)
            eta = eta.^(n_earlystop);
        end
    end
end
end
