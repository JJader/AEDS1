x1 = datenum('01-06', 'dd-mm');
x2 = datenum('16-06', 'dd-mm');
x3 = datenum('01-07', 'dd-mm');
x4 = datenum('16-07', 'dd-mm');

datas = [x1, x2, x3, x4];
horas = [20.9333 22.4 22.0167 20.73333];

c = coeficientes_polinomio(datas,horas);
z = c(1) + c(2)*datas + c(3)*datas.^2;

%derivada_z = c(2) + 2*c(3)*x
x_max = -c(2)/(2*c(3));

data = datestr(x_max, 'dd-mm')
Hora_maxima = c(1) + c(2)*x_max + c(3)*x_max^2

plot(datas,horas, 'ro')
hold on
plot(datas,z)