x1 = [1 3 4 6 9 12 15];
x2 = sqrt(x1);
y = [-2.6 -1.5 1.8 2.1 8.8 10.2 15.9];

[b, r2, s2, ALCc, info] = regressao_linear_en(0,[x1',x2'],y)