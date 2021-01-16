x = [1 2 4 5 8 9];
y = [1 1.4142 2 2.2361 2.8284 3];
z = [1.1 2.2 4.3 5.7 8.8 8.9];

spline = splines_avaliar(x,y,z,0)
exato = sqrt(x)

n = size(spline,2);
error = zeros(1,n);

for i = 1:n
  error(i) = abs(spline(i) - exato(i)) ;
endfor

error

