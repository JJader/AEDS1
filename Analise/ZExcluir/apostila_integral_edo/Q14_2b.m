clc
clear
close all

addpath('./Euler')

a = 1;
b = 2;
y0 = 0;
f = inline('x^2 + y^2')

printf('\n\n')
for m = 2:2:8
  m
  [vetX,vetY] = euler(a,b,y0,m,f)
  printf('\n\n')
endfor

restoredefaultpath;