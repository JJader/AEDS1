clc
clear
close all

addpath('./Euler')

a = 0;
b = 2;
y0 = 0;
f = inline('sqrt(x)')
exato = inline('2/3*x.^(3/2)') 

printf('\n\n')
for m = 2:5
  m
  [vetX,vetY] = euler(a,b,y0,m,f)
  printf('\n\n')
endfor

figure(1)
plot(vetX,vetY)
hold on
plot(vetX,exato(vetX))

restoredefaultpath;