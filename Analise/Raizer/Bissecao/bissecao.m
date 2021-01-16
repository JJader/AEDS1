% algoritmo Bisseção
% Calcular raiz de equação pelo método de bisseção 
%
% Entrada: 
%  a,b --> limites, 
%  Toler, 
%  iterMax, 
%  f = inline('f(x)')
%
%
% Saída: raiz, iter, info
%  info = -1 função não muda de sinal nos extremos do intervalo
%  info = 1 raiz não convergiu com os parâmetros dados


function [raiz,iter,info] = bissecao(a,b,toler,iterMax,f)

  fa = f(a);
  fb = f(b);
  
  if fa*fb >0
    info = -1;
    return
  endif
  
  deltaX = abs(b-a);
  iter = 0;
  
  while(true)
    deltaX = deltaX/2;
    x = (a+b)/2;
    fx = f(x);
  
    if (deltaX<=toler && abs(fx)<=toler ) || iter>=iterMax
      break
    endif
  
    if fa*fx > 0
      a = x;
      fa = fx;
    else
      b = x;
      fb = fx;
    endif
    
    iter = iter + 1;
  endwhile
  
  raiz = x;
  
  if (deltaX<=toler && abs(fx)<=toler)
    info = 0;
  else
    info = 1;
  endif  
endfunction

