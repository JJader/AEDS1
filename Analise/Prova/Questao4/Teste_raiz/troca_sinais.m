% Algoritmo troca-sinais
% Contar o número de troca de sinais dos coeficientes de um polinômio 
%
% Entrada: 
%  n --> grau do polinomio,
%  c --> os coeficientes de tal forma que:
%   ** p(x) =  c(1)x^n + c(2)x^n-1 ..... c(n)x + c(n+1)
%
%
% Saída: 
%  Var --> número de variações de sinais

function [var] = troca_sinais(n,c)
  n = n+1;
  var = 0;
  i = 1;
  
  for j = 2:n
    if c(j) != 0
      if c(i)*c(j)<0
        var = var + 1;
      endif
      i = j;
    endif
  endfor
endfunction
