clc
clear
close all

addpath('./Teste_raiz')

n = 3;
c = [4 25 14 -1];
[L] = limites_raizes_modificado(n,c);

restoredefaultpath;