A = [8.11 -1.5 -1.61; -1.50 20.66 -9.16; -1.61 -9.16 14.77];
b = [17.81; -2.73; 12.02];

determinante = det(A)

if (determinante < 0)
  printf("Sistema nao tem solucao\n")
else
  x = resolucao_cholesky(A,b)
endif
