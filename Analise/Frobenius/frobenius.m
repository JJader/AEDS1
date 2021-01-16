%
% Questão 2 - Norma de Frobenius 
% Função que retorna a norma de Frobenius
% Entrada: matriz (A)
% Saída: Norma de Frobenius 
%

function norma = frobenius(A)
  if nargin != 0
    [linha, coluna] = size(A);  
    if linha == coluna
      matrizPow = A.^2;
      norma2 = sum(sum(matrizPow));
      norma = sqrt(norma2);
    else
      printf("A matriz de entrada não é quadrada\n")
    endif
  else
    printf("Parâmetro não identificado\n")
  endif