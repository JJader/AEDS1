clc
clear
close all

addpath('./gauss-Legendre')

a = 1;
b = 3;
f = inline('4*x.^2 + 5')

printf('\n\n')
n = 1
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quadgk(f,a,b)

printf('\n\n')
n = 2
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quadgk(f,a,b)

printf('\n\n')
n = 3
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quadgk(f,a,b)

%%-----------------------------------------------------------------------------------
printf('\n\n\n\n')
a = 1;
b = 3;
f = inline('3*(x.^3)*exp(x.^2)')

printf('\n\n')
n = 3
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

printf('\n\n')
n = 4
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

printf('\n\n')
n = 5
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

%%-----------------------------------------------------------------------------------
printf('\n\n\n\n')
a = -pi/4;
b = pi/2;
f = inline('3*x*cos(pi*x)')

printf('\n\n')
n = 1
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

printf('\n\n')
n = 2
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

printf('\n\n')
n = 3
[integral,info] = gauss_legendre(a,b,n,f)
Erro = integral - quad(f,a,b)

restoredefaultpath;