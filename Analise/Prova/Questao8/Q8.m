clc
clear

addpath('./Euler')

a = 0;
b = 50;
f = inline('2000/(200-t)')
m = 100;
y0 = 0;

[vetX,vetY] = euler(a,b,y0,m,f);

printf("A velocidade sera de ")
vetY(length(vetY))

restoredefaultpath;
