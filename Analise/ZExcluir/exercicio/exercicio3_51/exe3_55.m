h = 6/(13-1);
x = -2:h:4;
y = zeros(size(x));
erro = zeros(size(x));
z = [-1.55 -0.35 0.45 1.55 2.35 3.45];
exato = zeros(size(z));

for i = 1:size(y,2)
  if x(i) <= 0
    y(i) = exp(x(i));
  else
    y(i) = x(i)*sin(5*x(i)) + 1;
  endif
endfor

spline = splines_avaliar(x,y,z,1)

for i = 1:size(z,2)
  if z(i) <= 0
    exato(i) = exp(z(i));
  else
    exato(i) = z(i)*sin(5*z(i)) + 1;
  endif
endfor

exato

for i = 1:size(exato,2)
  error(i) = abs(spline(i) - exato(i)) ;
endfor

error