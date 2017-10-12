%������

clear all;
clc;
f = imread('F0004.bmp');  % ����10�����ÿ�ζ�һ��ͼ���д���

s = [1,5,10,20];
for ind = 1:4
    dict(ind) = huffmandproduce(s(ind));
    c(ind) = im2jpeg(f, s(ind));
    img(ind,:,:) = jpeg2im(c(ind));
    cr_origin(ind) = imratio(f, c(ind));
    rmse_origin(ind) = CompareImages(f, permute(img(ind,:,:),[2 3 1]));  %permute����ά��˳�򣬱��img(:,:,ind)
    
    c1(ind) = im2jpeg_LPC(f, s(ind));
    img1(ind,:,:) = jpeg2im_LPC(c1(ind));
    cr_lpc(ind) = imratio(f, c1(ind));
    rmse_lpc(ind) = CompareImages(f, permute(img1(ind,:,:),[2 3 1]));
    
    c2(ind) = im2jpeg_considerzeros(f, s(ind));
    img2(ind,:,:) = jpeg2im_considerzeros(c2(ind));
    cr_zeros(ind) = imratio(f, c2(ind));
    rmse_zeros(ind) = CompareImages(f, permute(img2(ind,:,:),[2 3 1]));
    
    C(ind) = im2jpeg_fixeddict(f, s(ind),dict(ind).huffmanDict);
    Img(ind,:,:) = jpeg2im_fixeddict(C(ind),dict(ind).huffmanDict);
    cr_fixdict(ind) = imratio(f, C(ind));
    rmse_fixdict(ind) = CompareImages(f, permute(Img(ind,:,:),[2 3 1]));
end

%��ֵд��excel���
xlswrite('a.xlsx',[cr_origin; cr_lpc; cr_zeros; cr_fixdict; zeros(1,4); rmse_origin; rmse_lpc; rmse_zeros; rmse_fixdict],4,'B2'); 
% ĳ��ͼ��ѹ���Ⱥͷ��������д��excel����һ��sheet�У���10��sheet
close all

for k = 1:4
    figure(k),
    ax(1)=subplot(2,2,1);imshow(permute(img1(k,:,:),[2 3 1]));
    ax(2)=subplot(2,2,2);imshow(permute(img2(k,:,:),[2 3 1]));
    ax(3)=subplot(2,2,3);imshow(permute(Img(k,:,:),[2 3 1]));
    ax(4)=subplot(2,2,4);imshow(permute(img(k,:,:),[2 3 1]));
    linkaxes(ax);
end