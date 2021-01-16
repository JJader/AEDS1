% Algoritmo Limites-raízes
% Calcular os limites das raízes reais de uma equação algébrica
%
% Entrada: 
%  n --> grau do polinomio,
%  c --> os coeficientes de tal forma que:
%   ** p(x) =  c(1)x^n + c(2)x^n-1 ..... c(n)x + c(n+1)
%
%
% Saída: 
%  L --> vetor com os limites superior e inferio das raízes

function [L] = limites_raizes_modificado(n,c)
  
  [L] = limites_raizes(n,c)
  
  close all;
  figure(1);
  
  for i = 1:2:length(L)
    x = linspace(L(i),L(i+1),10);
    y = polyval(c,x);
    
    plot(x,y)
    hold on
    
  endfor
endfunction
