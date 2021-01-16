% Objetivo: Calcular as derivadas segundas dos splines cúbicos extrapolados
%Entrada:  
% x = vetor abscissas em ordem
% y = vetor oderdenadas
%Saida
% s2 = Derivada segundas
% info = 0 não houve erro, -1 numero de pontos < 4; -2 abscissas não está em ordem 
function [s2, info] = splines_extrapolados(x,y)
  n = size(y,2);
  s2 = zeros(1,n);
  
  if (n < 4)
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
  hb = x(3) - x(2);
  
  deltaa = (y(2)-y(1))/ha;
  deltab = (y(3) - y(2))/hb;
  
  d = zeros(1,n);
  c = zeros(1,n);
  e = zeros(1,n);
  
  d(1) = (ha + hb)*(ha + 2*hb)/hb;
  c(2) = hb - ha^2/hb;
  s2(2) = 6*(deltab - deltaa);
  
  for i = 2:m-1
    ip1 = i+1;
    ip2 = i+2;
    
    ha = hb;
    deltaa = deltab;
    hb = x(ip2) - x(ip1);
    deltab = (y(ip2)-y(ip1))/hb;
    
    d(i) = 2*(ha + hb);
    e(i-1) = ha;
    c(ip1) = hb;
    s2(ip1) = 6*(deltab - deltaa);
  endfor
  
  ha = hb;
  deltaa = deltab;
  hb = x(n) - x(n-1);
  deltab = (y(n)-y(n-1))/hb;
  d(m) = (ha + hb)*(hb + 2*ha)/ha;
  e(m-1) = ha - hb^2/ha;
  s2(m+1) = 6 *(deltab - deltaa);
  
  for i = 2:m
    ip1 = i+1;
    im1 = i-1;
    t = e(im1)/d(im1);
    d(i) = d(i)-t*c(i);
    s2(ip1) = s2(ip1) - t*s2(i);
  endfor
  
  s2(m+1) = s2(m+1)/d(m);
  
  for i = m:-1:2
    s2(i) =(s2(i) - c(i)*s2(i+1))/d(i-1);
  endfor
  
  ha = x(2) - x(1);
  hb = x(3) - x(2);
  s2(1) = ((ha + hb)*s2(2) - ha*s2(3))/hb;
  
  ha = x(n-1) - x(n-2);
  hb = x(n) - x(n-1);
  s2(n) = ((ha + hb)*s2(n-1) - hb*s2(n-2))/ha;
  
endfunction