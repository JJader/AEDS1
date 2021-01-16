clc
clear

addpath('./EDO/Euler')

printf('\n\n7.1\n\n')
f = inline('sqrt(x)')
a = 0;
b = 2;
y0 = 0;
m = 5; 
[vetX,vetY] = euler(a,b,y0,m,f)

printf('\n\n7.2\n\n')
f = inline('x^2+y^2')
a = 1;
b = 2;
y0 = 0;
m = 8; 
[vetX,vetY] = euler(a,b,y0,m,f)

printf('\n\n7.3\n\n')
f = inline('x*y')
a = 0;
b = 1;
y0 = 1;
m = 10; 
[vetX,vetY] = euler(a,b,y0,m,f)



restoredefaultpath;