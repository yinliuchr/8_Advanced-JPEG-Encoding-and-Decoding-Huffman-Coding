% huffman_test()
% 2016-11-16

x = imread('..\data\Fig0801(a).tif');
close all
figure(1),
subplot(1,2,1),imshow(x)
subplot(1,2,2),
hist1 = histogram(x(:),0:256);
xlim([-5 260])
entropy1 = myEntropy(hist1.Values/sum(hist1.Values))

idx = find(hist1.Values>0);
symbols = hist1.BinEdges(idx);
prob = hist1.Values(idx)/sum(hist1.Values);
dict = huffmandict(symbols,prob);

disp('Show huffman dictionary')
for k = 1:size(dict,1)
    fprintf('%3d %.2f ',dict{k,1}, prob(k));
    fprintf('%d',dict{k,2});
    fprintf('\n');
end

sig = double(x(:));
hcode = huffmanenco(sig,dict);
dhsig = huffmandeco(hcode,dict);
isequal(sig,dhsig)

compress_ratio = length(sig)*8/length(hcode)