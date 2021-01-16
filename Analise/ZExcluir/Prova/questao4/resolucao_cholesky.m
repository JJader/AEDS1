function [x,erro] = resolucao_cholesky(A,b)
  
  [L,det,erro] = decomposicao_cholesky(A);
  y = substituicao_sucessiva(L,b);
  x = substituicao_retroativa(L',y);
  
endfunction