function DisplayImg(z,x,y)

figure
map = [0:255; 0:255; 0:255]'/255;
colormap(map)
z = 255*z/(max(max(z)));
image(x,y,z);
axis('image')
