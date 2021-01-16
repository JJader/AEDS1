clc
clear
close all

addpath('./Teste_raiz')

n = 3;
c = [1 -3 -10 24];
[L] = limites_raizes_modificado(n,c);

restoredefaultpath;