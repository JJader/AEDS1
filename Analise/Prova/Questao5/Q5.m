
clc
clear

addpath('./RK4')
a = -1.65;
b = 1.72;
y0 = 0.03;
m = 100;

f = inline('1*y^1 + 3*sin(y^5) + 4*x^8 + 2*sin(x^8)')
[vetX,vetY] = rk4(a,b,y0,m,f)

plot(vetX,vetY)

restoredefaultpath;