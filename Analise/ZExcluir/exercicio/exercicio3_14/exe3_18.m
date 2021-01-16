x = [ 110 120 130];
y = [2.0414 2.0792 2.1139];

c = coeficientes_polinomio(x,y);

printf(" %d + %d*x + %d*x^2\n\n\n", c(1), c(2), c(3))

z = c(1) + c(2)*115 + c(3)*115^2