function DctCheck()
% Jianjiang Feng
% 2016-11-14

M = 8; N = 8;

% I = zeros(M,N,1,M*N);
[DX,DY] = meshgrid(0:M-1);
close all
figure(1)
for p = 0:M-1
    for q = 0:N-1
        base = cos(pi*(2*DX+1)*p/(2*M)).*cos(pi*(2*DY+1)*q/(2*N));
        index = sub2ind([M N],p+1,q+1);
%         I(:,:,1,index) = base;
        subplot(M,N,index),
        imshow(0.5*(base+1));
    end
end

% montage(I);