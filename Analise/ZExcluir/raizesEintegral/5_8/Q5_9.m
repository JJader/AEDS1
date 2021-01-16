clc
clear

f = inline('sin(x)/e^(x-1)');
a = 0;
b = pi;
m = 12;

% a)
printf("\n\nIntegral pelo trapezio\n")
[integral,info] = newton_cotes(a,b,1,m,f)

% b)
printf("\n\nIntegral pelo 1/3 de simpson\n")
[integral,info] = newton_cotes(a,b,2,m,f)

printf("\n\nIntegral pelo 3/8 de simpson\n")
% c)
[integral,info] = newton_cotes(a,b,3,m,f)
