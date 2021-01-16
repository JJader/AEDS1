%
% Questão 3 - Função decomposição de cholesky 
% Este script retorna a matriz resultante da decomposição de Cholesky
% Entrada: n (ordem da matriz), A (Matriz de coeficientes)
% Saída: L (matriz decomposta) det (determinante) erro
%

function [L, det, erro] = decomposicao_cholesky(A)
  det = 1;
  n = size(A,1);
 
  for j = 1:n
    soma = 0;
    for k = 1:j-1
      soma = soma + L(j,k)^2;
    endfor
    t = A(j,j) - soma;
    det = det*t;
    erro = t <= 0;
    
    if erro
      printf("A matriz não é definida positiva")
      break
    else
      L(j,j) = sqrt(t);
      r = 1/L(j,j);
    endif
    
    for i = j+1:n
      soma = 0;
      for k = 1:j-1
        soma = soma + L(i,k)*L(j,k);
      endfor
      L(i,j) = (A(i,j) - soma)*r;
    endfor
    
  endfor  
endfunction
