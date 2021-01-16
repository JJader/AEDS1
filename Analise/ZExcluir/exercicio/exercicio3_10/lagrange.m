% Objetivo: Interpolar valor usando polinômio de Lagrange
%Entrada:  
% x = vetor abscissas
% y = vetor oderdenadas
% z = valor a interpolar
%Saida
% pz = Valor interpolado

function pz = lagrange(x,y,z)
  pz = 0;
  m = size(x,2);
  
  for i=1:m
    c = 1;
    d = 1;
    
    for j = 1:m
      if (j != i)
        c = c*(z-x(j));
        d = d*(x(i) - x(j));
      endif
    endfor
    
    pz = pz + y(i) * c/d;
  endfor
endfunction