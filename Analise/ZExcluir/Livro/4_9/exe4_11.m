x1 = [1.4 2.1 3.0 4.4 5.1 5.8 6.5 7];
y1 = [4.2 3.3 2.9 2.1 1.5 1.1 0.8 0.2];

[b, r2, s2, ALCc, info] = regressao_linear_en(1,x1',y1);
r2
s2
ALCc

%% Exercicio 4.12
printf("O melhor polinômio é o de grau 6");

