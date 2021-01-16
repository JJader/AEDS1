h = [35 40 45 50 55 60 65 70 75 80 85 90 95];
v = [7.9 7.7 7.4 7.1 6.8 6.5 6.1 5.8 5.4 4.9 4.4 3.9 3.2];

plot(h,v, 'ro');
[b, r2, s2, ALCc, info] = regressao_linear_dvs(1,h',v,4)

printf("\n\n%f + %fx + %fx^2 + %fx^3\n\n",b(1),b(2),b(3),b(4))

x = 82
vazao_prevista = b(1) + b(2)*x + b(3)*x^2 + b(4)*x^3
