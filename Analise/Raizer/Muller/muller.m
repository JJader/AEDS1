% algoritmo Muller
% Calcular raiz de equação pelo método de muller 
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

function [raiz,iter,info] = muller(a,b,toler,iterMax,f)
  
  fa = f(a);
  fb = f(b);
  x = (a+b)/2;
  fx = f(x);
  iter = 0;
  
  while(true)
    ha = x-a;
    hb = b-x;
    
    da = (fa-fx)/ha;
    db = (fb-fx)/hb;
    
    aa = (da+db)/(ha+hb);
    bb = (ha*db - hb*da)/(ha+hb);
    cc = fx;
    delta = sqrt(bb^2 - 4*aa*cc);
    
    if abs(bb+delta) > abs(bb-delta)
      v = -2*cc/(bb+delta);
    else
      v = -2*cc/(bb-delta);
    endif
    
    t = x;
    ft = fx;
    x = x+v;
    fx = f(x);
    
    if (abs(v)<=toler && abs(fx)<=toler) || iter>=iterMax
      break
    endif
    
    a = b;
    fa = fb;
    b = t;
    fb = ft;
    iter =iter + 1;
  endwhile
  
  raiz = x;
  
  if abs(v)<=toler && abs(fx)<=toler
    info = 0;
  else
    info = 1;
  endif 
endfunction
