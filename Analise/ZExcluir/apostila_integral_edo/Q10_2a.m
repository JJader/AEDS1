clc
clear
close all

addpath('Newton-cotes')
a = -1;
b = 2;
f = inline('-3*x.^3 + 3/2*x.^2 + 5')

%-------------------------------------------------------------------------------
n = 1
m = 1
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(1)
plotGrafic(n,a,b,m,f)
title(["Grau 1 e 1 subintervalo"])

%--------------------------------------------------------------------------------
n = 1
m = 18
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(2)
plotGrafic(n,a,b,m,f)
title(["Grau 1 e 18 subintervalo"])

%--------------------------------------------------------------------------------
n = 2
m = 18
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(3)
plotGrafic(n,a,b,m,f)
title(["Grau 2 e 18 subintervalo"])

%--------------------------------------------------------------------------------
n = 3
m = 18
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(4)
plotGrafic(n,a,b,m,f)
title(["Grau 3 e 18 subintervalo"])

restoredefaultpath;

