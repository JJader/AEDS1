% Gauss-Legendre-iterativo
% Integrar uma função pela quadratura de Gauss-Legendre iterativo
% Entrada: a,b limites toler e intermax, f = inline('f(x)')
% Saída: integral, delta,iter, e info

function [integral,delta,iter,info] = gauss_legendre_iterativo(a,b,toler,iterMax,f)
  
  iter = 1;
  n1 = 5;
  n2 = 8;
  
  [int,info] = gauss_legendre(a,b,n2,f);
  
  delta = toler + 1;
  
  while delta > toler && iter != iterMax
    iter = iter + 1;
    n = n1+n2;
    [integral,info] = gauss_legendre(a,b,n,f);
    
    if integral != 0
      delta = abs((integral-int)/integral);
    else
      delta = abs(integral-int);
    endif
    
    int = integral;
    n1 = n2;
    n2 = n;
  endwhile
  
  if delta <= toler
    info = 0;
  else
    info = 1;
  endif 
endfunction
