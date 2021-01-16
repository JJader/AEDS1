% algoritmo Pegaso_rm
% Calcular raiz de equação pelo método de Pegaso_rm 
%
% Entrada: 
%  a,b --> limites, 
%  Toler, 
%  iterMax, 
%  f = inline('f(x)')
%
%
% Saída: raiz, f(raiz), iter, info
%  info = -1 função não muda de sinal nos extremos do intervalo
%  info = 1 raiz não convergiu com os parâmetros dados

function [raiz,zero,iter,info] = pegaso_rm(a,b,toler,iterMax,f)
  
  epsilon = precisao_maquina();
  df = return_derivative_fx(a,b,f)
  
  fa = f(a)
  fb = f(b)
  dfa = df(a)
  dfb = df(b)
  
  if abs(dfa) < epsilon || abs(dfb)<epsilon
    info = 2
    return
  endif
  
  ga =fa/dfa
  gb = fb/dfb
  gx = 1+toler
  iter = 0
  
  while true
    deltaX = gb*(b-a)/(gb-ga)
    x = b-deltaX
    
    fx = f(x)
    dfx = df(x)
    
    if (abs(deltaX)<=toler abs(gx)<=toler) || abs(dfx)<epsilon || iter>=iterMax
      break
    endif
    
    gx = fx/dfx
    
    if gb*gx<0
      a = b
      ga = gb
    else
      ga = ga*gb/(gb+gx)
    endif
    
    b = x
    gb = gx
    iter +=1
  endwhile
  
  raiz = x
  zero = f(x)
  
  if abs(deltaX)<=toler && abs(gx)<=toler
    info = 0
  else
    if abs(dfx)>=epsilon
      info = 1
    else
      info = 2
    endif
  endif
  
endfunction


