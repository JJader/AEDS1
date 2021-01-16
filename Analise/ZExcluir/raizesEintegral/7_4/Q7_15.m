clc
clear

addpath('./EDO/ABM4')

printf('7.15\n\n')

f = inline('5*x^3+2*x^2+x-1 -y');
a = 0;
b = 2;
y0 = 1;
m = 200;

exato = inline('29*exp(-x) + 5*x^3 -13*x^2 + 27*x -28');
[vetX, vetY, erro] = ABM4(a, b, y0, m, f);

for i = 1:length(vetX)
  erro(i) = vetY(i) - exato(vetX(i));
endfor
erro
printf('\n\n\n')

restoredefaultpath;