clc
clear

addpath('./Euler')

f = inline('7.0*x.^2 + 3.0*sin(x.^10) + cos(x.^9.0) + 6.0*x.^4')
a = -1.63;
b =  0.78;
y0 = -0.43;
m = 100;

[vetX,vetY] = euler(a,b,y0,m,f)

plot(vetX,vetY)
restoredefaultpath;