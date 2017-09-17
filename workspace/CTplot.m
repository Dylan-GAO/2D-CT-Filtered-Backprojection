function CTplot(OriData, Theta)
ImgData = rebuild(OriData, Theta);
figure
imagesc(ImgData);
end