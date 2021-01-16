x1 = [-1 0 1 2 4 5 5 6];
x2 = [-2 -1 0 1 1 2 3 4];
y = [13 11 9 4 11 9 1 -1];

[b, r2, s2, ALCc, info] = regressao_linear_dvs(1,[x1',x2'],y)