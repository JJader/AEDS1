clc
clear

addpath('./Newton-cotes')

fx = inline('8*exp(x.^7) + 3*cos(x.^8)')
ax = -3.62;
bx = -2.00;
m = 6; 

[integral_x,info] = newton_cotes(ax,bx,3,m,fx)

printf('\n\n')
fy = inline('10*sin(y.^7) + 5*sin(y.^2)')
ay = -4.42;
by = -1.04;
m = 6; 

[integral_y,info] = newton_cotes(ay,by,3,m,fy)

printf('\n\n')
integral_resultante = integral_x+integral_y


restoredefaultpath;