clc
clear

f = inline('e^x');

a = 0;
b = 1;
m = 1;

printf("\n\nPor regra do trapezio \n")
[integral,info] = newton_cotes(a,b,1,m,f)

printf("\n\nPor regra do gauss_legendre \n")
[integral,info] = gauss_legendre(a,b,2,f)

