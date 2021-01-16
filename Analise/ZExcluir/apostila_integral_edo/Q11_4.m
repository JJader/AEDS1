clc
clear
close all

addpath('./gauss-Legendre')
addpath('./Newton-cotes')

a = 1;
b = 3;
f = inline('4*x.^2 + 5')

printf('\n\n')
n = 1
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 2
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 3
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

%%-----------------------------------------------------------------------------------
printf('\n\n\n\n')
a = 1;
b = 3;
f = inline('3*(x.^3)*exp(x.^2)')

printf('\n\n')
n = 3
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 4
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 5
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

%%-----------------------------------------------------------------------------------
printf('\n\n\n\n')
a = -pi/4;
b = pi/2;
f = inline('3*x*cos(pi*x)')

printf('\n\n')
n = 1
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 2
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

printf('\n\n')
n = 3
[integralGL,info] = gauss_legendre(a,b,n,f)
[integralNC,info] = newton_cotes(a,b,n,n,f)

Erro = integralGL-integralNC

restoredefaultpath;