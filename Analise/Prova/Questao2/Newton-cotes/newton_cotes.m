% Newton-cotes
% Integrar uma função pela fóruma de Newton-Cotes
% Entrada: a e b limites inferior e superior, n grau do polinômio, m numero de subintervalos
% f = inline(f(x)) função a ser integrada
% Saída: integral, info
%

function [integral,info] = newton_cotes(a,b,n,m,f)
  
  integral = 0;
  info = 0;
  
  [d,c,info] = coeficientes_Cotes(n);
  
  if rem(m,n)!=0 || m<0
    info = info -10;
  endif
  
  if info != 0
    return
  endif
  
  h = (b-a)/m;
  j = 0;
  
  for i = 0:m
    x = a+i*h;
    y = f(x);
    j = j+1;
    k = c(j);
    
    if rem(i,n)==0 && i!=0 && i!=m
      k = k+k;
      j = 1;
    endif
    
    integral = integral + y*k;
  endfor
  
  integral = n*h/d*integral; 
endfunction
