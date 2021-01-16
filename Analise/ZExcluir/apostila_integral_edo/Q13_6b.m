clc
clear
close all

addpath('./Teste_raiz')

n = 4;
c = [1 -2 -13 14 24];
[L] = limites_raizes_modificado(n,c);

restoredefaultpath;