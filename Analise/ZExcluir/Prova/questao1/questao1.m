%
% Questao 1 
% Jamisson Jader Moraes Pereira 
%

for i = 0:1000
  
  tamanho_matriz = randi(10);
  
  A = randi(100,tamanho_matriz);
  B = randi(100,tamanho_matriz);
  
  AB = A+B;
  somaTraco = func_traco(A) + func_traco(B);
  
  if func_traco(AB) != somaTraco
    AB
    somaTraco
    printf("Propriedade falsa \n");
    break
  endif
endfor

printf("Propriedade válida \n")