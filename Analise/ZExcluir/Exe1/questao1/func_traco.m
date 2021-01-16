%
% Funçao Traço 
% Função que retorna o traço da matriz
% Entrada: matriz (A)
% Saída: troco da matriz
%

function traco = func_traco(A)
  
  traco = sum(diag(A));
  
endfunction