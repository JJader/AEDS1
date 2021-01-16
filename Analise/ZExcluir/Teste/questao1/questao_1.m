x = linspace(-0.48,1.44,7);
y = 10*x.^2 + 2*x.^5 + 9*x.^2 + 7*cos(x.^9);

for i = 1:4
  pontos(i) =  rand()*1.44 -0.48;
endfor

pontos = sort(pontos)

for i = 1:4
  pz = newton(x,y,pontos(i));
  interpolado(i) = pz;
endfor

plot(x,y)
hold on
plot(pontos, interpolado)