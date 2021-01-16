x = [0.9 1.1 2];
y = [3.211 2.809 1.614];

c = coeficientes_polinomio(x,y);

printf(" %d + %d*x + %d*x^2\n\n\n", c(1), c(2), c(3))

z = c(1) + c(2)*1.2 + c(3)*1.2^2