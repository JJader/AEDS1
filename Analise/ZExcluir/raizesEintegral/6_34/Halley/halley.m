% algoritmo Halley
% Calcular raiz de equação pelo método de Halley
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

function [raiz,iter,info] = halley(a,b,toler,iterMax,f)
  
  deltaX = 1+toler;
  iter = 0;
  derivate_fx = return_derivative_fx(a,b,f);
  derivate2_fx = return_derivative_fx(a,b,f);
  
  x = a;
  
  while (true)
    fx = f(x);
    dfX = derivate_fx(x);
    df2X = derivate2_fx(x);
    
    if (abs(deltaX) <= toler && abs(fx)<=toler) || iter >=iterMax
      break
    endif
    
    deltaX = 2*fx*dfX/(2*dfX^2 - fx*df2X);
    x = x-deltaX;
    iter +=1;
  endwhile
  
  raiz = x;
  
  if abs(deltaX) <= toler && abs(fx)<=toler
    info = 0;
  else
    info = 1;
  endif
  
endfunction

