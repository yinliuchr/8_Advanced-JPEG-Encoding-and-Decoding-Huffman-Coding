function im2lpc_test1()

I = imread('..\data\Fig0819(a).tif');
I = double(I);
E = I(:,2:end)-I(:,1:end-1); % prediction error

close all
figure(1),
subplot(2,2,1),imshow(I,[])
subplot(2,2,3),imshow(E,[])
subplot(2,2,2),histogram(I(:));
xlim([0 255])
subplot(2,2,4),histogram(E(:));
xlim([-255 255])

std1 = std(I(:))
std2 = std(E(:))

hist1 = histogram(I(:),0:255);
entropy1 = myEntropy(hist1.Values/sum(hist1.Values))

hist2 = histogram(E(:),-255:255);
entropy2 = myEntropy(hist2.Values/sum(hist2.Values))
