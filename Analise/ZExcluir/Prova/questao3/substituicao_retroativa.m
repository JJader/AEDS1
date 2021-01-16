%
% Questão 3 - Função de substituição retroativa 
% Este script retorna a matriz com resposta para o sistema dado por Ax = b
% Entrada: n (ordem da matriz), U (resultante do método LU) c (matriz resultante da substituição_sucessiva)
% Saída: x (matriz de solução)
%
function x = substituicao_retroativa(A, b)
  n = size(A,1);
  x = zeros(size(b));
  x(n) = b(n)/A(n,n);
  
  for i = n-1:-1:1
    soma = 0;
    for j = i+1:n
      soma = soma + A(i,j)*x(j);
    endfor
    x(i) = (b(i) - soma)/A(i,i);
  endfor
endfunction
