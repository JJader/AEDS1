clc
clear
close all

addpath('Newton-cotes')
a = 1;
b = 7;
f = inline('1/x*20*sin(2*x)')

%-------------------------------------------------------------------------------
n = 1
m = 3
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(1)
plotGrafic(n,a,b,m,f)
title(["Grau 1 e 3 subintervalo"])

%--------------------------------------------------------------------------------
n = 1
m = 15
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(2)
plotGrafic(n,a,b,m,f)
title(["Grau 1 e 15 subintervalo"])

%--------------------------------------------------------------------------------
n = 2
m = 3
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(3)
plotGrafic(n,a,b,m,f)
title(["Grau 2 e 3 subintervalo"])

%--------------------------------------------------------------------------------
n = 2
m = 15
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(4)
plotGrafic(n,a,b,m,f)
title(["Grau 2 e 15 subintervalo"])

%--------------------------------------------------------------------------------
n = 3
m = 15
[integral,info] = newton_cotes(a,b,n,m,f)
Erro = integral - quad(f,a,b)

printf('\n\n\n')

figure(5)
plotGrafic(n,a,b,m,f)
title(["Grau 3 e 15 subintervalo"])

restoredefaultpath;

