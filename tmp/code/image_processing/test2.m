load angle.mat a
load data.mat data_2
data = CTplot(data_2,a,-9.1185,-6.2401,0.2774,1);
A = imrotate(data,-5);
imagesc(A);

NewImg = [];

for i = 1 : 360
    for j = 1 : 360
        NewImg(i, j) = img2(100 + i, 100 + j);
    end
end

imagesc(NewImg);