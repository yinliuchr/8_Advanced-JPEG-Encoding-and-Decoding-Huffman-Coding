x = rand(20,20);
figure(1),imshow(imresize(x,50,'nearest'))

y = rand(20,20)>0.9;
figure(2),imshow(imresize(y,50,'nearest'))
