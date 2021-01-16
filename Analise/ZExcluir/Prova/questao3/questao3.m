%
% Questao 3
% Jamisson Jader Moraes Pereira 
%

A = [17.15 8.15; 8.15 18.15];
b = [8.90; 1.13];

determinante = det(A)

if (determinante < 0)
  printf("Sistema nao tem solucao\n")
else
  [x,erro] = resolucao_cholesky(A,b);
  if erro
    printf('O sistema não é possivel de se resolver pelo método')
  else
    x
  endif
endif
