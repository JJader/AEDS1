function [x] = resolucao_LU(A,b)
  n = size(A,1);
  [LU, pivot] = decomposicao_LU(A);
  [L,U] = retornando_LU(LU);
  
  p = eye(n);
  p = p(pivot,:);
  b = p*b';
  
  y = substituicao_sucessiva(L,b);
  x = substituicao_retroativa(U,y);
  
endfunction