x = [1 2];
y = sqrt(x + 1) - sin(x) - 1;

a = [1 x(1); 1 x(2)];
b = y';
solu = a\b;

resp = (0 - solu(1))/solu(2)

diferenca = abs(2.22241 - resp)