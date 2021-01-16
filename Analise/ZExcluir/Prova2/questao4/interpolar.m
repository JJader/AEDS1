% Objetivo: Interpolar o valor z
%Entrada:  
% x = vetor abscissas
% y = vetor oderdenadas
%Saida
% pz = valor interpolado
% info = 0 não houve erro, -1 numero de pontos < 4; -2 abscissas não está em ordem 

function [pz, info] = interpolar(x,y,z)
  [sx,i] = sort(x);
  
  for j = 1:size(x,2);
    sy(j) = y(i(j));
  endfor
  
  [pz, info] = splines_avaliar(sx,sy,z,1);
  pz = pz(1);
  
endfunction
