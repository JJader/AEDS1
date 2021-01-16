% algoritmo Secante
% Calcular raiz de equação pelo método da secante 
% Entrada: a,b limites, Toler, iterMax, f = inline('f(x)')
% Saída: raiz, iter, info
% info = -1 função não muda de sinal nos extremos do intervalo
% info = 1 raiz não convergiu com os parâmetros dados

function [raiz,iter,info] = secante(a,b,toler,iterMax,f)
  
  epsilon = precisao_maquina();
  fa = f(a);
  fb = f(b);
  
  a0 = a;
  b0 = b;
  iter = 0;
  
  while(true)
    deltaX = fb*(b-a)/(fb-fa);
    x = b - deltaX;
    fx = f(x);
    
    if (abs(deltaX)<=toler && abs(fx)<=toler) || abs(fb-fx)<epsilon || iter>=iterMax
      break
    endif
    
    a = b;
    fa = fb;
    b=x;
    fb = fx;
    iter += 1;
  endwhile
  
  raiz = x;
  if (abs(deltaX)<=toler && abs(fx)<=toler)
    if raiz>=a0 && raiz<=b0
      info = 0;
    else
      info = 2;
    endif
  else
    info = 1;
  endif
endfunction
