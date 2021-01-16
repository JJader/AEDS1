x = linspace(-0.03,0.09,7);
y = 3*exp(x.^2) + 7*exp(x.^8) + 2*x.^10 + 5*sin(x.^2) ;

for i = 1:4
  pontos(i) =  rand()*-0.03 + 0.09;
endfor

pontos = sort(pontos)

for i = 1:4
  pz = newton(x,y,pontos(i));
  interpolado(i) = pz;
endfor

plot(x,y)
hold on
plot(pontos, interpolado)

interpolado