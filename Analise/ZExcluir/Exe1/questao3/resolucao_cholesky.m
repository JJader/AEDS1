function [x] = resolucao_cholesky(A,b)
  
  L = decomposicao_cholesky(A);
  y = substituicao_sucessiva(L,b);
  x = substituicao_retroativa(L',y);
  
endfunction