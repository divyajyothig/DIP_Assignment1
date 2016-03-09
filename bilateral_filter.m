function out = bilateral_filter(im,n,d,r)
out = zeros(size(im));
l = size(im);

[x,y] = meshgrid(-n:n,-n:n);
G = exp(-(x.^2+y.^2)/(2*d^2)); % Gaussian filter formula

for i = 1:l(1)
    imin = max(i-n,1);
    imax = min(i+n,l(1));
    for j = 1:l(2)      
        jmin = max(j-n,1);
        jmax = min(j+n,l(2));
        I = im(imin:imax,jmin:jmax,:);
        dif = I-im(i,j);
        wght = exp(double(-(dif.^2)/(2*r^2)));
        tmp = wght .* G((imin:imax)-i+n+1,(jmin:jmax)-j+n+1);
        out(i,j) = sum(sum((tmp).*I))/sum(tmp(:));
   end
end