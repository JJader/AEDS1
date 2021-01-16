%
% Questão 5 - Função de substituição retroativa 
% Jamisson Jader Moraes Pereira Junior
%
%

clc
A = [1 3 4; 3 2 2; 4 2 3];
b = [10.5; 8.5; 11];

determinante_a = det(A);

if determinante_a == 0 
  printf("Sistema não possui uma unica solucao \n\n")
  return
endif

[solucao_jacobi, inter, erro] = jacobi(A,b,1e-3,1000);
[solucao_LU, L, U] = resolucao_LU(A,b);

if erro == 1
  printf("Não é possivel solucionar com o método jacobi\n\n")
else
  printf("Alimento 1: ")
  solucao_jacobi(1)
  printf("Alimento 2: ")
  solucao_jacobi(2)
  printf("Alimento 3: ")
  solucao_jacobi(3)
endif

printf("Alimento 1: ")
solucao_LU(1)
printf("Alimento 2: ")
solucao_LU(2)
printf("Alimento 3: ")
solucao_LU(3)

if inter > 10
  printf("\n\nNo método de jacobi o sistema é mau condicionando\n\n")
endif

determinante_a = det(L)*det(U)

printf("\n\nNão é possível resolver com os dois métodos\n\n")
