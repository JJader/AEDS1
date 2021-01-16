%Objetivo: Interpolar valor usando polinômio de Newton
%Entrada:
% x = vetor da abscissas
% y = vetor das ordenadas
% z = valor interpolar
%Saída:
% pz = valor interpolado
function pz = newton(x,y,z)
  m = size(y,2);
  dely = zeros(1,m);
  
  for i = 1:m
    dely(i) = y(i);
  endfor
  
  for i = 1:m-1
    for k = m:-1:i+1
      dely(k) = (dely(k) - dely(k-1))/(x(k) - x(k-i));
    endfor
  endfor
  
  pz = dely(m);
  for i = m-1:-1:1
    pz = pz*(z-x(i)) + dely(i);
  endfor
endfunction
