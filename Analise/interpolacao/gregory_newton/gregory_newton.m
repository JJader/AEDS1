%Objetivo: Interpolar valor usando poliômio de Gregory Newton
%Entrada:
% x = vetor abscissas
% y = vetor ordenadas
% z = valor a interpolar
%Saída'
% pz = valor interpolado
function pz = gregory_newton(x,y,z)
  m = size(y,2);
  dely = zeros(1,m);

  for i = 1:m 
    dely(i) = y(i);
  endfor

  for i = 1:m-1
    for k = m:-1:i+1
      dely(k) = dely(k) - dely(k-1);
    endfor
  endfor
  
  u = (z - x(1))/(x(2) - x(1));
  pz = dely(m);
  
  for i = m-1:-1:1
    pz = pz*(u-i+1)/i + dely(i);
  endfor
endfunction