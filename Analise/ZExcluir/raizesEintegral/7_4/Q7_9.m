clc
clear

addpath('./EDO/DP54')
addpath('./EDO/RK4')

printf('7.9\n\n')

f = inline('(sqrt(x)+1)*y');
a = 1;
b = 3;
y0 = 1;
m = 20;

exato = inline('exp((2*sqrt(x^3)+3*x-5)/3)');
[vetX_dp54,vetY_dp54,dify] = DP54(a,b,y0,m,f);
[vetX_rk4,vetY_rk4] = rk4(a,b,y0,m,f);

for i = 1:length(vetX_dp54)
  erro_dp54(i) = vetY_dp54(i) - exato(vetX_dp54(i));
endfor
erro_dp54

printf('\n\n\n')

for i = 1:length(vetX_rk4)
  erro_rk4(i) = vetY_rk4(i) - exato(vetX_rk4(i));
endfor
erro_rk4



restoredefaultpath;