ImgData = CTplot(data_2,a,x_cen,y_cen,0.2774,1);
Ab_std= zeros(256);
for i=1:2:512
    for j=1:2:512
        Ab_std((i+1)/2,(j+1)/2) = ImgData(i,j)+ImgData(i+1,j)+ImgData(i,j+1)+ImgData(i+1,j+1);
    end
end
temp = Ab_std(Ab_std>2);
k = sum(temp)/size(temp,1);
Ab_std = Ab_std- data_1*k;