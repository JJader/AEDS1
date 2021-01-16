close all
clear
clc

x = linspace(-0.14,0.41,7);
y = 5*cos(x.^4) + 2*cos(x.^4) + 2*(x.^9) + 10*x.^10;

for i = 1:4
  pontos(i) =  rand()*0.41 -0.14;
endfor

pontos = sort(pontos);

A = [1 x(1) x(1)^2 x(1)^3; ...
    1 x(3) x(3)^2 x(3)^3;...
    1 x(5) x(5)^2 x(5)^3;...
    1 x(7) x(7)^2 x(7)^3]

b = [y(1); y(3); y(5); y(7)]

solu = A\b

interpolado = solu(1) + solu(2)*pontos + solu(3)*pontos.^2 + solu(4)*pontos.^3

plot(x,y, 'ro')
hold on
plot(pontos, interpolado)