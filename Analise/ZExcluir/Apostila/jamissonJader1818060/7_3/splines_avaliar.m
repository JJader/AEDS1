% Objetivo: Avaliar os splines cúbicos naturais e extrapolados
%Entrada:  
% x = vetor abscissas
% y = vetor oderdenadas
% z = valores a interpolar
% ts = tipo de splins
%Saida
% sz = Derivada segundas
% info = 0 não houve erro, -1 numero de pontos < 3 ou < 4; -2 abscissas não está em ordem n > 0 
% numero de tentativas estrapoladas 
function [sz, info] = splines_avaliar(x,y,z,ts)
  n = size(x,2);
  m = size(z,2);
  sz = zeros(1,m);
  
  if ts == 0
    [s2,info] = splines_natural(x,y);
  else
    [s2,info] = splines_extrapolados(x,y);
  endif
  
  if info < 0
    return
  endif
  info = 0;
  
  for j = 1:m
    if z(j) >= x(1) && z(j) <= x(n)
      inf = 1;
      sup = n;
      
      while(sup - inf > 1)
        ind = floor((inf+sup)/2);
        if x(ind) > z(j)
          sup = ind;
        else
          inf = ind;
        endif
      endwhile
      
      h = x(sup) - x(inf);
      a = (s2(sup) - s2(inf))/(6*h);
      b = s2(inf)/2;
      c = (y(sup) - y(inf))/h - (s2(sup) + 2*s2(inf))*h/6;
      d = y(inf);
      h = z(j) - x(inf);
      sz(j) = ((a*h + b)*h+ c)*h + d;
      
    else
      sz(j) = 0;
      info = info + 1;
    endif
  endfor
endfunction
