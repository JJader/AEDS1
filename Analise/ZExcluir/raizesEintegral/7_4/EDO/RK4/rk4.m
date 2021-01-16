% algoritmo Euler
% Resolver um PVI pelo método de runge-kutta de ordem 4 
%
% Entrada: 
%  a,b --> limites, 
%  y0 --> valor inicial, 
%  m --> número de subintervalos, 
%  f = inline('f(x)')
%
%
% Saída: vetX, vetY

function [vetX,vetY] = rk4(a,b,y0,m,f)
  
  h = (b-a)/m;
  xt = a;
  yt  = y0;
  vetX(1) = xt;
  vetY(1) = yt;
  
  for i = 1:m
    x = xt;
    y = yt;
    k1 = f(x,y);
    
    x = xt + h/2;
    y = yt + h/2*k1;
    k2 = f(x,y);
    
    y = yt + h/2*k2;
    k3 = f(x,y);
    
    x = xt+h;
    y = yt+h*k3;
    k4 = f(x,y);
    
    xt = a+i*h;
    yt = yt+h/6*(k1+2*(k2+k3)+k4);
    
    vetX(i+1)=xt;
    vetY(i+1)=yt;
  endfor
endfunction
