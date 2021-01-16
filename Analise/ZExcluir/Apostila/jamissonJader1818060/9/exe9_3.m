x = [-6.0866 -5.9294 -5.2795 -5.0197 -4.7357 -1.8721 -0.2061 0.1073 0.2787 7.3624];
y = [-509.9181 -493.0127 -291.7017 -160.6647 -182.8648 44.4050 -85.4323 -33.8353 -19.6766 679.0813];

plot(x,y, 'ro')
hold on

printf("\n\nGrau 1\n");
[b, r2, s2, ALCc, info] = regressao_linear_en(1,x',y',2);
y1 = b(1) + b(2)*x;
r2
s2 
ALCc
plot(x,y1, 'b')
hold on

printf("\n\nGrau 2\n");
[b, r2, s2, ALCc, info] = regressao_linear_en(1,x',y',3);
y2 = b(1) + b(2)*x + b(3)*x.^2 ;
r2
s2 
ALCc
plot(x,y2, 'g')
hold on

printf("\n\nGrau 3\n");
[b, r2, s2, ALCc, info] = regressao_linear_en(1,x',y',4);
y3 = b(1) + b(2)*x + b(3)*x.^2 + b(4)*x.^3;
r2
s2 
ALCc
plot(x,y3, 'm')
hold on

printf("\n\nGrau 4\n");
[b, r2, s2, ALCc, info] = regressao_linear_en(1,x',y',5);
y4 = b(1) + b(2)*x + b(3)*x.^2 + b(4)*x.^3 + b(5)*x.^4;
r2
s2 
ALCc
plot(x,y4, 'y')
hold on

printf("\n\nGrau 5\n");
[b, r2, s2, ALCc, info] = regressao_linear_en(1,x',y',6);
y5 = b(1) + b(2)*x + b(3)*x.^2 + b(4)*x.^3 + b(5)*x.^4 + b(6)*x.^5;
r2
s2 
ALCc
plot(x,y5, 'k')
hold on
