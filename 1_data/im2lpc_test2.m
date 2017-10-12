function im2lpc_test2()
% Jianjiang Feng
% 2016-11-17
I = imread('..\data\Fig0834(a).tif');
I = double(I);

e = im2lpc(I);

[symbols, prob] = prob4huffman(e);
dict = huffmandict(symbols,prob);
hcode = huffmanenco(e(:),dict);
[huffmanCode,huffmanCodeLen] = huffmanDouble2Bin(hcode);

cr = imratio(uint8(I), huffmanCode)

hcode = huffmanBin2Double(huffmanCode,huffmanCodeLen);
e2 = huffmandeco(hcode, dict);
e2 = reshape(e2, size(I,1), size(I,2));
g = lpc2im(e2);
rmse = CompareImages(I, g)

% close all
% figure(1),
% subplot(1,2,1),imshow(uint8(I))
% subplot(1,2,2),imshow(e,[])
