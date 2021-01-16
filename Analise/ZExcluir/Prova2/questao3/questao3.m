close all
clear
clc

x = linspace(-0.17,0.52,7);
y = 7*cos(x.^9) + 10*cos(x.^6) + x.^1 + 10*exp(x.^2);

for i = 1:4
  pontos(i) =  rand()*0.52 -0.17;
endfor

pontos = sort(pontos)

for i = 1:4
  interpolado(i) = gregory_newton(x,y,pontos(i));
endfor

interpolado

plot(x,y, 'ro')
hold on
plot(pontos, interpolado)