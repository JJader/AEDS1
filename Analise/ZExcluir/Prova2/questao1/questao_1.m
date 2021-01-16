x = linspace(-0.5,0.5,7);
y = 10*cos(x.^7) + 8*exp(x.^5) + 4*(x.^6) + 2*exp(x.^1);

for i = 1:4
  pontos(i) =  rand()*0.5 -0.5;
endfor

pontos = sort(pontos);

interpolado = splines_avaliar(x,y,pontos,0);

interpolado = interpolado(1:4)

plot(x,y, 'ro')
hold on
plot(pontos, interpolado)
