hdct2d = vision.DCT;
I = double(imread('cameraman.tif'));
J = step(hdct2d, I);
figure(1),imshow(log(abs(J)),[]), colormap(jet(64)), colorbar

hidct2d = vision.IDCT;
J(abs(J) < 10) = 0;
figure(4),imshow(log(abs(J)),[]), colormap(jet(64)), colorbar
It = step(hidct2d, J);
figure(2), imshow(I, [0 255]), title('Original image')
figure(3), imshow(It,[0 255]), title('Reconstructed ');