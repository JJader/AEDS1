% Algoritmo Horner 
% Avaliar um polinômio de grau n na abscissa a 
%
% Entrada: 
%  n --> grau do polinomio,
%  c --> os coeficientes de tal forma que:
%   ** p(x) =  c(1)x^n + c(2)x^n-1 ..... c(n)x + c(n+1)
%
%  a --> o valor da abscissa onde sera avaliado
%
%
% Saída: 
%  y --> ordenada p(a)
%

function [y] = horner(n,c,a)
  
  y = c(1);
  
  for i = 2:n+1
    y = y*a + c(i);
  endfor
endfunction
