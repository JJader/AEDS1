%
% Função de substituição retroativa 
% Este script retorna a matriz com resposta para o sistema dado por Ax = b
% Entrada: A matriz coeficientes, b matriz dos coeficientes independentes 
% Saída: x (matriz de solução)
%

function [x,erro] = resolucao_cholesky(A,b)
  
  [L,det,erro] = decomposicao_cholesky(A);
  y = substituicao_sucessiva(L,b);
  x = substituicao_retroativa(L',y);
  
endfunction