clc
clear

addpath('./EDO/DP54')
addpath('./EDO/RK4')

printf('7.8\n\n')

f = inline('-sin(x)*y');
a = 0;
b = pi;
y0 = -1;
m = 10;

exato = inline('-exp(cos(x)-1)');
[vetX_dp54,vetY_dp54,dify] = DP54(a,b,y0,m,f);
[vetX_rk4,vetY_rk4] = rk4(a,b,y0,m,f);

for i = 1:length(vetX_dp54)
  erro_dp54(i) = vetY_dp54(i) - exato(vetX_dp54(i));
endfor
erro_dp54

for i = 1:length(vetX_rk4)
  erro_rk4(i) = vetY_rk4(i) - exato(vetX_rk4(i));
endfor
erro_rk4



restoredefaultpath;