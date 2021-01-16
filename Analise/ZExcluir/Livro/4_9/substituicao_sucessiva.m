%
% Questão 3 - Função de resolução de substituição sucessiva 
% Este script retorna a matriz com resposta para o sistema dado por Ax = b
% Entrada: n (ordem da matriz), L (matriz resultante do método LU) c (matriz dos termos independentes) pivot (vetor pivo, resultante do método LU)
% Saída: x (matriz que será enviada para a substituição_retroativa)
%
function x = substituicao_sucessiva(A,b)
  n = size(A,1);
  x = ones(size(b));
  
  for i = 1:n
    soma = 0;
    for j = 1:i-1
      soma = soma + A(i,j)*x(j);
    endfor
    x(i) = (b(i)-soma)/A(i,i);
  endfor
endfunction
