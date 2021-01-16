x1 = [-1 0 1 2 4 5 5 6];
x2 = [-2 -1 0 1 1 2 3 4];
y = [13 11 9 4 11 9 1 -1];

[b, r2, s2, ALCc, info] = regressao_linear_en(1,[x1',x2'],y);
printf("b0 = %f \n\n", b(1));
printf("b1 = %f \n\n", b(2));
printf("b2 = %f \n\n", b(3));