% algoritmo Euler
% Resolver um PVI pelo método de Euler 
%
% Entrada: 
%  a,b --> limites, 
%  y0 --> valor inicial, 
%  m --> número de subintervalos, 
%  f = inline('f(x)')
%
%
% Saída: vetX, vetY

function [vetX,vetY] = euler(a,b,y0,m,f)
  
  h = (b-a)/m;
  x = a;
  y = y0;
  
  vetX(1) = x;
  vetY(1) = y;
  fxy = f(x,y);
  
  for i = 1:m
    x = a + i*h;
    y = y + h*fxy;
    fxy = f(x,y);
    
    vetX(i+1) = x;
    vetY(i+1) = y;
  endfor  
endfunction
