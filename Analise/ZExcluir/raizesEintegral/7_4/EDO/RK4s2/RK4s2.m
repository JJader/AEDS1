% algoritmo RK4s2
% Resolver um PVI pelo m�todo de Dormand-Price(5,4)
%
% Entrada: 
%  a,b --> limites, 
%  y10 --> valor inicial 01, 
%  y20 --> valor inicial 02,
%  m --> n�mero de subintervalos, 
%  f = inline('f(x)')
%
%
% Sa�da: vetX, vetY1, vetY1


function [VetX, VetY, Erro] = RK4s2 (a, b, y10, y20, m, f1, f2)
  
  h = (b - a)/m; xt = a; y1t = y10; y2t = y20;
  VetX(1) = xt; VetY1(1) = y1t; VetY2(1) = y2t;
  for i = 1 : m
    x = xt;
    y1 = y1t; y2 = y2t;
    k11 = f1(x,y1,y2);
    k12 = f2(x,y1,y2);
    x = xt + h/2;
    y1 = y1t + h/2 * k11; y2 = y2t + h/2 * k12;
    k21 = f1(x,y1,y2);
    k22 = f2(x,y1,y2);
    y1 = y1t + h/2 * k21; y2 = y2t + h/2 * k22;
    k31 = f1(x,y1,y2);
    k32 = f2(x,y1,y2);
    y1 = y1t + h/2 * k31; y2 = y2t + h/2 * k32;
    k41 = f1(x,y1,y2);
    k42 = f2(x,y1,y2);
    x = a + i * h;
    y1t = y1t + h/6 * (k11 + 2 * (k21 + k31) + k41);
    y2t = y2t + h/6 * (k12 + 2 * (k22 + k32) + k42);
    VetX(i + 1) = xt; VetY1(i + 1) = y1t; VetY2(i + 1) = y2t;
  endfor

endfunction
