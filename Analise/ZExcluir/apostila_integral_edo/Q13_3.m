clc
clear
close all

addpath('./Teste_raiz')

c = [4 2 0 -3]
n = 3;
x = 2;

[y, n_raiz] = horner_modificado(n,c,x, -10,10)


c = [5 -10 4 -1 250 -5]
n = 4;
x = 2;

[y, n_raiz] = horner_modificado(n,c,x, -10,10)



c = [25 0 0 0 0 0 0 0 0 7 -32 4]
n = 11;
x = 2;

[y, n_raiz] = horner_modificado(n,c,x, -10,10)

restoredefaultpath;