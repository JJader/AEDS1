%
% Questão 3 - Função retornando_LU 
% Este script retorna a matriz L e U separadas tendo como entrada a matriz A = L + U - I
% Entrada: matriz A 
% Saída: matriz L e a matriz  U
%

function [L, U] = retornando_LU(A)
  
  U = triu(A);
  L = eye(size(A)) + tril(A,-1);

endfunction
