% algoritmo Newton_Raphson
% Calcular raiz de equação pelo método de Newton_Raphson 
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


function [raiz,iter,info] = newton_raphson(a,b,toler,iterMax,f)
  
  epsilon = precisao_maquina();
  deltaX = 1+toler;
  iter = 0;
  derivate_fx = return_derivative_fx(a,b,f);
  
  x = a;
  
  while (true)
    fx = f(x);
    dfX = derivate_fx(x);
    
    if (abs(deltaX) <= toler && abs(fx)<=toler) || abs(dfX)<epsilon || iter >=iterMax
      break
    endif
    
    deltaX = fx/dfX;
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

