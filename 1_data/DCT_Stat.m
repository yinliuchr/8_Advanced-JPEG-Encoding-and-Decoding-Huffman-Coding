function DCT_Stat()
%DCT_STAT 计算一组图像DCT系数的直方图

I = imread('..\data\1_1.bmp');
I = im2double(I)-128/256;
blockSize = 8;
D = dctmtx(blockSize);
fun = @(block_struct) (D*block_struct.data*D');
T = blockproc(I,[blockSize blockSize],fun,'PadPartialBlocks',true);

close all
figure(1),imshow(I,[]);
figure(2),imshow(T,[]);

B = im2col(T,[blockSize blockSize],'distinct');
h = [];
figure(3)
edges = -4:0.2:4;
for m = 1:blockSize
    for n = 1:blockSize
        index = sub2ind([blockSize blockSize],m,n);
%         h{m,n} = histogram(B(index,:),edges);
        subplot(blockSize,blockSize,index),histogram(B(index,:),edges);
    end
end