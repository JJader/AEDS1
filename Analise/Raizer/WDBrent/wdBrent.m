% algoritmo WdBrent
% Calcular raiz de equação pelo método de van Winjngaarden-Dekker-Brent 
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

function [raiz,iter,info] = wdBrent(a,b,toler,iterMax,f)
  
  epsilon = precisao_maquina();
  fa = f(a);
  fb = f(b);
  
  if fa*fb>0
    info = -1;
    return
  endif
  
  c = b;
  fc = fb;
  iter = 0;
  
  while(true)
    if fb*fc>0
      c = a;
      fc = fa;
      d = b-a;
      e = d;
    endif
    
    if abs(fc)<abs(fb)
      a = b;
      b = c;
      c = a;
      fa = fb;
      fb = fc;
      fc = fa;
    endif
    
    tol = 2*epsilon*abs(b) + 0.5*toler;
    z = 0.5*(c-b);
    
    if abs(z)<=tol || fb==0 || iter>=iterMax
      break
    endif
    
    if abs(e)>=tol && abs(fa)>abs(fb)
      s = fb/fa;
      
      if a==c
        p = 2*z*s;
        q = 1-s;
      else
        q = fa/fc;
        r = fb/fc;
        p = s*(2*z*q*(q-r) - (b-a)*(r-1));
        q = (q-1)*(r-1)*(s-1);
      endif
      
      if p>0
        q = -q;
      endif
      
      p = abs(p);
      
      if 2*p<min([3*z*q - abs(tol*q),abs(e*q)])
        e = d;
        d = p/q;
      else
        d = z;
        e = d;
      endif
      
    else
      d = z;
      e = d;
    endif
    
    a = b;
    fa = fb;
    
    if abs(d)>tol
      b = b+d;
    else
      b = b + z/abs(z)*tol;
    endif
    
    fb = f(b);
    iter = iter+1;
  endwhile
  
  raiz = b;
  
  if abs(z)<=tol || fb==0 
    info = 0;
  else
    info = 1;
  endif
endfunction
