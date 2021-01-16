%% exercicio 4.1

x = [0.5 1.2 2.1 3.5 5.4];
y = [5.1 3.2 2.8 1 0.4];
plot(x,y,'ko')

%% exercicio 4.2
printf("\n\nExercicio 2 \n\n")
x1 = [1 x(1); 1 x(2)];
y1 = [y(1); y(2)];
solu = x1\y1;

b0 = solu(1);
b1 = solu(2);
z = b0 + b1*x;
soma_quadrado = sum((z - y).^2)

%% exercicio 4.3
printf("\n\nExercicio 3 \n\n")
x1 = [1 x(3); 1 x(5)];
y1 = [y(3); y(5)];
solu = x1\y1;

b0 = solu(1);
b1 = solu(2);
z = b0 + b1*x;
soma_quadrado = sum((z - y).^2)

%% exercicio 4.4
printf("\n\nExercicio 4 \n\n")
x1 = [5 sum(x); sum(x) sum(x.^2)];
y1 = [sum(y); sum(y.*x)];
solu = x1\y1;

b0 = solu(1);
b1 = solu(2);
z = b0 + b1*x;
soma_quadrado = sum((z - y).^2)


%% exercicio 4.5
printf("\n\nExercicio 5 \n O menor resultado é o da questão 4.4\n")
