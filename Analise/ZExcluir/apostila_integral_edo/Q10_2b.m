clc
clear
close all

addpath('Newton-cotes')
a = -0.5;
b = 0.5;
f = inline('4*x.^2/exp(5*x)')

%-------------------------------------------------------------------------------
n = 3
m = 32
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(1)
plotGrafic(n,a,b,m,f)
title(["Grau 3 e 32 subintervalo"])

%--------------------------------------------------------------------------------
n = 4
m = 32
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(2)
plotGrafic(n,a,b,m,f)
title(["Grau 4 e 32 subintervalo"])

%--------------------------------------------------------------------------------
n = 5
m = 32
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(3)
plotGrafic(n,a,b,m,f)
title(["Grau 5 e 32 subintervalo"])

restoredefaultpath;

