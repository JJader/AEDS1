clc
clear

addpath('./EDO/ABM4')

printf('7.14\n\n')

f = inline('x^2*exp(x)+y');
a = 0;
b = 1;
y0 = -1;
m = 100;

exato = inline('(x^3/3-1)*exp(x)');
[vetX, vetY, erro] = ABM4(a, b, y0, m, f);

for i = 1:length(vetX)
  erro(i) = vetY(i) - exato(vetX(i));
endfor
erro
printf('\n\n\n')

restoredefaultpath;