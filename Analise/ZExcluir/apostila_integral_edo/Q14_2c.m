clc
clear
close all

addpath('./Euler')

a = 0;
b = 1;
y0 = 1;
f = inline('x*y')

printf('\n\n')
for m = 4:2:10
  m
  [vetX,vetY] = euler(a,b,y0,m,f)
  printf('\n\n')
endfor

restoredefaultpath;