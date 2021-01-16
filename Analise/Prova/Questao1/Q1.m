clc
clear

addpath('./Newton-cotes')

f = inline('3*cos(x.^10) + 1*x.^4 + 6*(x.^2) + 7*cos(x.^8)')
b = -0.75;
a = -1.82;
m = 6; 

[integral,info] = newton_cotes(a,b,2,m,f)




restoredefaultpath;