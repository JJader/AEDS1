%Objetivo: Montar a matriz de variáveis explicativas para regressão linear múltipla
%Entrada:
% v = numero de variáveis explicativas
% p = número de parâmetros do modelo
% ii = indicação de interseção
% x = submatriz com variáveis explicativas originais
%Saída'
% matX = matriz das variáveis explicativas
% info = informação sobre erro. info = 0 sem erro; info = 1 p < v; 
%  info = 2 ii != 1 != 0; info = 3 modelo não permitido 

function [matX, info] = matriz_explicativas(ii,x)
  n = size(x,1);
  v = size(x,2);
  p = v + ii;
  matX = zeros(n,p);
  
  if ii != 1 && ii != 0 
    info = 2;
    return
  endif
  
  if (v != 1 || v > p) && (v <= 1)
    info = 3;
    return
  endif
  
  info = 0;
  
  if v == 1
    
    if ii != 0
      for i = 1:n
        matX(i,1) = 1;
      endfor
      
    else
      for i = 1:n
        matX(i,1) = x(i,1);
      endfor
    endif
    
    for j = 2:p
      j1 = j-1;
      for i = 1:n
        matX(i,j) = matX(i,j1)*x(i,1);
      endfor
    endfor
    
  else
    
    if ii != 0
      for i = 1:n
        matX(i,1) = 1;
      endfor
    endif
    
    m = 0;
    for j = ii+1:p
      m += 1;
      for i = 1:n
        matX(i,j) = x(i,m);
      endfor
    endfor
    
  endif 
endfunction
