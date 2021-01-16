clc
clear

addpath('./EDO/ABM4')

printf('7.13\n\n')

f = inline('(exp(x)*x -1)*y');
a = 1;
b = 2;
y0 = -1;
m = 100;

exato = inline('-exp((x-1)*exp(x)-x+1)');
[vetX, vetY, erro] = ABM4 (a, b, y0, m, f);

for i = 1:length(vetX)
  erro(i) = vetY(i) - exato(vetX(i));
endfor
erro
printf('\n\n\n')

restoredefaultpath;