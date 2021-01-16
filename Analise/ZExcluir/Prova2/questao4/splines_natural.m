% Objetivo: Calcular as derivadas segundas dos splines cúbicos naturais 
%Entrada:  
% x = vetor abscissas
% y = vetor oderdenadas
%Saida
% s2 = Derivada segundas
% info = 0 não houve erro, -1 numero de pontos < 3; -2 abscissas não está em ordem 
function [s2, info] = splines_natural(x,y,z)
  n = size(x,2);
  s2 = zeros(1,n);
  
  if (n < 3)
    info = -1;
    return
  endif
  
  ordenado = true;
  
  for i = 2:n
    ordenado = ordenado && x(i-1) < x(i);
    if (!ordenado)
      info = -2;
      return
    endif   
  endfor
  
  info = 0;
  m = n-2;
  
  ha = x(2) - x(1);
  deltaa = (y(2) - y(1))/ha;
  
  e = zeros(1,n);
  d = zeros(1,n);
  
  for i = 1:m
    ip1 = i + 1;
    ip2 = i + 2;
    hb = x(ip2) - x(ip1);
    deltab = (y(ip2) - y(ip1))/hb;
    
    e(i) = hb;
    d(i) = 2*(ha + hb);
    s2(ip1) = 6*(deltab - deltaa) ; 
    ha = hb;
    deltaa = deltab;
  endfor
  
  for i = 2:m
    ip1 = i + 1;
    im1 = i - 1;
    t = e(im1)/d(im1);
    d(i) = d(i)-t*e(im1);
    s2(ip1) = s2(ip1) - t*s2(i);
  endfor
  
  s2(m+1) = s2(m+1)/d(m);
  
  for i = m:-1:2
    ip1 = i+1;
    im1 = i - 1;
    s2(i) = (s2(i)-e(im1)*s2(ip1))/d(im1);
  endfor
  
  s2(1) = 0;
  s2(n) = 0;
endfunction
