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
%  n_raiz --> quantidade de raizes

function [y, n_raiz] = horner_modificado(n,c,x, a,b)
  
  [n_raiz] = fourier(n,c,a,b);
  [y] = horner(n,c,x);
  
endfunction
