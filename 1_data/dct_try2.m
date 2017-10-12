% Jianjiang Feng
% 2016-11-16
Z = [16 11 10 16 24 40 51 61;...
    12 12 14 19 26 58 60 55;...
    14 13 16 24 40 57 69 56;...
    14 17 22 29 51 87 80 62;...
    18 22 37 56 68 109 103 77;...
    24 35 55 64 81 104 113 92;...
    49 64 78 87 103 121 120 101;...
    72 92 95 98 112 100 103 99];

quality = 4;

I = double(imread('..\data\1_1.bmp'));
% I = double(imread('cameraman.tif'));
figure(1),imshow(I,[]);
while 1
    figure(1),
    [x,y] = ginput(1);
    if isempty(x)
        break
    end
    
    x = round(x); y = round(y);
    f = I(y:y+7,x:x+7);
    T = dct2(f-128); % 2D DCT
    T2 = round(T./(Z*quality)); % quantization

    % decompression
    T3 = T2.*Z;
    f2 = round(idct2(T3)); % inverse 2D DCT
    f2 = f2 + 128;
    figure(2),clf,
    subplot(2,2,1),imshow(imresize(uint8(f), 30, 'nearest'))
    subplot(2,2,2),imshow(imresize(uint8(f2), 30, 'nearest'))
    subplot(2,2,3),imshow(imresize(T2~=0, 30, 'nearest'))
%     subplot(2,2,4),imshow(imresize(uint8(f2), 30, 'nearest'))
end