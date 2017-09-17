function Ab_data = AbCount( ImgData, Ab_std)
%ABCOUNT counts the absorption rate(256*256) of ImgData(512*512).

Ab_data = zeros(256);
for i=1:2:512
    for j=1:2:512
        Ab_data((i+1)/2,(j+1)/2) = ImgData(i,j)+ImgData(i+1,j)+ImgData(i,j+1)+ImgData(i+1,j+1);
    end
end
Ab_data = (Ab_data - Ab_std)/k;

end