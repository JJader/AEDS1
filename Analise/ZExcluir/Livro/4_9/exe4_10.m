x1 = [-2 -1.5 0 1 2.2 3.1];
y = [-30.5 -20.2 -3.3 8.9 16.8 21.4];

[b, r2, s2, ALCc, info] = regressao_linear_en(1,x1',y,3);
printf("b0 = %f \n\n", b(1));
printf("b1 = %f \n\n", b(2));
printf("b2 = %f \n\n", b(3));