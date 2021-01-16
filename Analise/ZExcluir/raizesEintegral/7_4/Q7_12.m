clc
clear

addpath('./EDO/ABM4')

printf('7.12\n\n')

f = inline('x*cos(x) + y');
a = 0;
b = pi/2;
y0 = pi;
m = 20;

exato = inline('((x+1)*sin(x)-x*cos(x))/2 + pi*exp(x)');
[vetX, vetY, erro] = ABM4 (a, b, y0, m, f);

for i = 1:length(vetX)
  erro(i) = vetY(i) - exato(vetX(i));
endfor
erro
printf('\n\n\n')

restoredefaultpath;