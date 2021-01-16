%
% Questão 4 - Função de substituição retroativa 
% Jamisson Jader Moraes Pereira Junior
%

A = [45.04 -14.64 2.06 5.69 -12.65; -14.64 39.50 3.73 5.68 12.45; 2.06 3.73 33.21 14.01 -9.41; ...
5.69 5.68 14.01 33.41 5.03; -12.65 12.45 -9.41 5.03 40.54];
b = [-11.80; 14.68; -14.20; -7.76; -16.57];

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
