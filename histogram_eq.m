function y = histogram_eq(im)

h = size(im,1);
w = size(im,2);
n = h*w;

eq = uint8(zeros(h,w));
freq = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cumm = zeros(256,1);
out = zeros(256,1);

for i = 1:h
    for j = 1:w
        tmp = im(i,j);        
        freq(tmp + 1) = freq(tmp+1) + 1;
        pdf(tmp + 1) = freq(tmp + 1)/n;
    end
end

sum = 0;
L = 255;
for i = 1:size(pdf)
    sum = sum + freq(i);
    cumm(i) = sum;
    cdf(i) = cumm(i)/n;
    out(i) = round(cdf(i)*L);
end

for i = 1:h
    for j = 1:w
        eq(i,j) = out(im(i,j)+1);
    end
end

y = eq;
end
