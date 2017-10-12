function e = myEntropy(p)
% assert(isempty(find(p<=0, 1)));
% assert(sum(p)==1);
p(p==0) = []; % remove 0
p = p/sum(p);
e = sum(p.*log2(1./p));