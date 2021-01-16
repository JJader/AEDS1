x = [0 1 2 4 8];
y = 2*x.^3-4*x.^2 + x -5;

c = coeficientes_polinomio(x,y);
c4 = c(4)