clc
clear

addpath('./Newton-cotes')


t = input('Entre com o valor da temperatura: ');

a = 4*10^-5;
b = 7*10^-5;
n = 5;
m = 100;

fstring = 'x^5*(exp(1.432/';
fstring = strcat(fstring,num2str(t),'*x)-1)');
fstring = strcat(fstring,'*',num2str(t),'^4');
fstring = strcat('1/', fstring);

f = inline(fstring);

[integral,info] = newton_cotes(a,b,n,m,f)




restoredefaultpath;