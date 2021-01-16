% Gauss-Legendre 
% Integrar uma função pela quadratura de Gauss-Legendre
% Entrada: a,b limites e n numero de pontos, f = inline('f(x)')
% Saída: integral e info

function [integral,info] = gauss_legendre(a,b,n,f)
  
  [T,W,info] = gauss_legendre_absPes(n);
  
  if info != 0
    return
  endif
  
  integral = 0;
  info = 0;
  ba2 = (b-a)/2;
  for i = 1:n
    x = a+ba2*(T(i)+1);
    y = f(x);
    integral = integral + y*W(i);
  endfor
  
  integral = ba2*integral;
endfunction
