clc
clear 

addpath('./Teste');


c = [3 -4 0 -1 2 -1];
n = 5;

printf("x = -5\n\n")
[y] = horner(n,c,-5)

printf("x = 6\n\n")
[y] = horner(n,c,6)

restoredefaultpath;