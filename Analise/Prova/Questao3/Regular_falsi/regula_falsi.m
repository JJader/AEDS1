% algoritmo regula falsi
% Calcular raiz de equação pelo método da regula falsi 
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

function [raiz,iter,info] = regula_falsi(a,b,toler,iterMax,f)
  
  fa = f(a);
  fb = f(b);
  
  if fa*fb > 0
    info = -1;
    return
  endif
  
  iter = 0;
  
  while(true)
    deltaX = fb*(b-a)/(fb-fa);
    x = b-deltaX;
    fx = f(x);
    
    if (abs(deltaX)<=toler && abs(fx)<=toler) || iter>=iterMax
      break
    endif
    
    if fb*fx < 0
      a = b;
      fa = fb;
    endif
    
    b = x;
    fb = fx;
    iter += 1;
  endwhile
  
  raiz = x;
  
  if abs(deltaX)<=toler && abs(fx)<=toler
    info = 0;
  else
    info = 1;
  endif
endfunction