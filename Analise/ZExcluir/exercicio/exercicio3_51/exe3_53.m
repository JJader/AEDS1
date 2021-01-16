x = [1 2 4 5 8 9];
y = [1 1.4142 2 2.2361 2.8284 3];
z = [1.1 2.2 4.3 5.7 8.8 8.9];

spline_natural = splines_avaliar(x,y,z,0);
exato = sqrt(x)
spline_extrapolados = splines_avaliar(x,y,z,1)

n = size(x,2);
error_exato = zeros(1,n);
error_splines = zeros(1,n);

for i = 1:n
  error_exato(i) = abs(spline_extrapolados(i) - exato(i)) ;
endfor

for i = 1:n
  error_splines(i) = abs(spline_natural(i) - spline_extrapolados(i)) ;
endfor

error_exato
error_splines

