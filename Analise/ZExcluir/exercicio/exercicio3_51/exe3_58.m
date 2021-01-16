x = [0 0.5 1 1.5 2 2.5 3];
y = [0.5 0.69146 0.84134 0.93319 0.97725 0.99379 0.99865];
t = 0.3;
solu = zeros(size(x));
exato = 0.61791 

for i = 2:size(x,2)
  xaux = x(1:i);
  yaux = y(1:i);
  g = newton(xaux,yaux,t);
  solu(i-1) = g; 
endfor

printf("a) ")
solu

printf("b) ")
solu_a = splines_avaliar(x,y,t,0);
splines_natural = solu_a(1)

printf("c) ")
solu_b = splines_avaliar(x,y,t,0);
splines_extrapolados = solu_b(1)

printf("d) \n")

for i = 1:size(solu,2)-1
  erro = abs(exato - solu(i));
  printf("Erros n%d = %f\n", i, erro)
endfor

erro_splines_natural = abs(exato - splines_natural)
erro_splines_extrapolados = abs (exato - splines_extrapolados)