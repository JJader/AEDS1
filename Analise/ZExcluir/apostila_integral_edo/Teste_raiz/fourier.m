% algoritmo Fourier
% Determinar o nḿero máximo de raízes reais no intervalo [a,b] pelo teorema de fourir 
% 
% Entrada: 
%  n --> grau do polinomio,
%  c --> os coeficientes de tal forma que:
%   ** p(x) =  c(1)x^n + c(2)x^n-1 ..... c(n)x + c(n+1)
%  a e b --> intervalo
%
%
% Saída: 
%  numMax --> número máximo de raízes reais no intervalo

function [numMax] = fourier(n,c,a,b)
  
  n1 = n+1;
  n2 = n+2;
  
  for i = 1:n
    derPol(i) = c(i);
  endfor
  
  derPol_a(1) = horner(n,c,a);
  derPol_b(1) = horner(n,c,b);
  
  for i = 1:n
    for j = 1:n1-i
      derPol(j) = derPol(j)*(n2-i-j);
    endfor
    derPol_a(i+1) = horner(n-i,derPol,a);
    derPol_b(i+1) = horner(n-i,derPol,b);
  endfor
 
  varSinal_a = troca_sinais(n,derPol_a);
  varSinal_b = troca_sinais(n,derPol_b);
  numMax = varSinal_a - varSinal_b;
endfunction
