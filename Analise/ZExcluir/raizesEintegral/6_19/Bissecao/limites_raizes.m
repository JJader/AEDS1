% Algoritmo Limites-raízes
% Calcular os limites das raízes reais de uma equação algébrica
%
% Entrada: 
%  n --> grau do polinomio,
%  c --> os coeficientes de tal forma que:
%   ** p(x) =  c(1)x^n + c(2)x^n-1 ..... c(n)x + c(n+1)
%
%
% Saída: 
%  L --> vetor com os limites superior e inferio das raízes

function [L] = limites_raizes(n,c)
  
  n1 = n+1;
  
  if rem(n,2) == 0
    sinal = 1;
  else
    sinal = -1;
  endif
  
  for i = 1:n1
    matC(i,1) = c(i);
    matC(n1+1-i,2) = c(i);
    matC(i,3) = sinal*c(i);
    sinal = -sinal;
    matC(n1+1-i,4) = matC(i,3);
  endfor
  
  for j = 1:4
    if matC(1,j)<0
      for i = 1:n1
        matC(i,j) = -matC(i,j);
      endfor
    endif
    
    b = 0;
    for i = n1:-1:2
      if matC(i,j)<0
        k = i;
        if abs(matC(i,j))>b
          b = abs(matC(i,j));
        endif
      endif
    endfor
    
    if b != 0
      L(j) = 1 + (b/matC(1,j))^(1/(k-1));
    else
      L(j) = 10^10;
    endif
  endfor
  
  aux = L(1);;
  L(1) = 1/L(2);
  L(2) = aux;
  L(3) = -L(3);
  L(4) = -1/L(4);
endfunction
