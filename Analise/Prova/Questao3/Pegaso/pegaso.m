% algoritmo pégaso
% Calcular raiz de equação pelo método pégaso 
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


function [raiz,iter,info] = pegaso(a,b,toler,iterMax,f)
  
  fa = f(a);
  fb = f(b);
  iter = 0;
  
  while(true)
    deltaX = fb*(b-a)/(fb-fa);
    x = b-deltaX;
    fx = f(x);
  
    if (deltaX<=toler && abs(fx)<=toler ) || iter>=iterMax
      break
    endif
  
    if fb*fx < 0
      a = b;
      fa = fb;
    else
      fa = fa*fb/(fb+fx);
    endif
    
    b = x;
    fb = fx;
    iter = iter + 1;
  endwhile
  
  raiz = x;
  
  if abs(deltaX)<=toler && abs(fx)<=toler
    info = 0;
  else
    info = 1;
  endif  