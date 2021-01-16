close all
clc
clear 

x1 = [8.1710 6.8664 1.3960 0.8992 -2.7101];
y1 = [39.2053 30.7299 11.2640 2.8130 -4.1482];
figure(1)
plot(x1,y1, 'ro')

x = [x1(1) 1 ; x1(5) 1];
y = [y1(1); y1(5)];
solu = x\y;

b0 = solu(2);
b1 = solu(1);
z = b0 + b1*x1;
hold on
plot(x1,z)

erro1 = abs(y1 - z)

[b, r2, s2, ALCc] = regressao_linear_en(1,x1',y1');
printf("Coeficiente de determinação: %f\n\n\n",r2)
z0 = b(1) + x1*b(2);
hold on
plot(x1,z0, 'g')
%%------------------------------------------------------------------------------

x2 = [7.6784 3.1249 2.1721 1.3425 -5.2367];
y2 = [0.2369 -1.2767 -1.2050 -2.8443 -8.4783];
figure(2)
plot(x2,y2, 'ro')

x = [x2(1) 1 ; x2(5) 1];
y = [y2(1); y2(5)];
solu = x\y;

b0 = solu(2);
b1 = solu(1);
z = b0 + b1*x2;
hold on
plot(x2,z)

erro2 = abs(y2 - z)

[b, r2, s2, ALCc] = regressao_linear_en(1,x2',y2');
printf("Coeficiente de determinação: %f\n\n\n",r2)
z0 = b(1) + x2*b(2);
hold on
plot(x2,z0, 'g')
%%------------------------------------------------------------------------------

x3 = [3.7796 1.8787 -1.0432  -4.1964 -6.7271];
y3 = [0.3356 0.0450 0.0535 -0.0329 -0.0214];
figure(3)
plot(x3,y3, 'ro')

x = [x3(1) 1 ; x3(5) 1];
y = [y3(1); y3(5)];
solu = x\y;

b0 = solu(2);
b1 = solu(1);
z = b0 + b1*x3;
hold on
plot(x3,z)

erro3 = abs(y3 - z)

[b, r2, s2, ALCc] = regressao_linear_en(1,x3',y3');
printf("Coeficiente de determinação: %f\n\n\n",r2)
z0 = b(1) + x3*b(2);
hold on
plot(x3,z0, 'g')
%%------------------------------------------------------------------------------

x4 = [1.2867 -0.5849 -0.8381 -0.9192 -4.1909];
y4 = [16.4650 23.2295 22.8824 43.1092 77.7867];
figure(4)
plot(x4,y4, 'ro')

x = [x4(1) 1 ; x4(5) 1];
y = [y4(1); y4(5)];
solu = x\y;

b0 = solu(2);
b1 = solu(1);
z = b0 + b1*x4;
hold on
plot(x4,z)

erro4 = abs(y4 - z)

[b, r2, s2, ALCc] = regressao_linear_en(1,x4',y4');
printf("Coeficiente de determinação: %f\n\n\n",r2)
z0 = b(1) + x4*b(2);
hold on
plot(x4,z0, 'g')
%%------------------------------------------------------------------------------

 