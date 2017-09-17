function ImgData = CTplot(OriData, Theta, x0, y0, d, option)

if option == 1
    oc = sqrt(x0^2 + y0^2);
    koc = y0 / x0;

    for i = 1 : size(OriData, 2)
        tmp = round(oc * sin(Theta(i) - atan(abs(koc))) / d);
        if tmp >= 0
            for j = size(OriData, 1) : -1 : 1 + tmp
                OriData(j, i) = OriData(j - tmp, i);
            end
        else
            for j = 1 : size(OriData, 1) + tmp
                OriData(j, i) = OriData(j - tmp, i);
            end
        end
    end
end

ImgData = rebuild(OriData, rad2deg(Theta));
imagesc(ImgData);
end