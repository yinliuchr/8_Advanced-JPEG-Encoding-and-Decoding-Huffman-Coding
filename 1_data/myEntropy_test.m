function myEntropy_test()
% I = imread('..\data\shannon.jpg');
% I = imread('..\data\1_1.bmp');
% I = imread('..\data\Fig0801(b).tif');
I = 255*double(rand(256,256)>0.5);
close all
figure(1),
subplot(1,2,1),imshow(I)
subplot(1,2,2),
hist1 = histogram(I(:),0:256);
xlim([-1 256])
entropy1 = myEntropy(hist1.Values/sum(hist1.Values))
