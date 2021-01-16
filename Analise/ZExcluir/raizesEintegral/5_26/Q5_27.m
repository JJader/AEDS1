clc
clear

f = inline('e^x + 2*x ');

a = 0;
b = 3;
m = 4;

printf("\n\nPor regra do 1/3 de simpson \n")
[integral,info] = newton_cotes(a,b,2,m,f)

printf("\n\nPor regra do gauss_legendre \n")
[integral,info] = gauss_legendre(a,b,5,f)