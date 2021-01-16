%Objetivo: Calcular os coeficientes de poliômio interpolador
%Entrada:
% x = vetore da abscissa
% y = vetore da ordenada
%Saída:
% c = vetore coeficiente do polinomio
% p(x) = c(1) + c(2)x + c(3)x^3 ... x(n)*x^n 
function c = coeficientes_polinomio(n,x,y)
  
  c = zeros(1,n);
  
  for i = 1: n +1
    c(i) = y(i);
  endfor
  
  for i = 1:n
    for k = n+1:-1:i+1
      c(k) = (c(k)-c(k-1))/(x(k)-x(k-i));
    endfor
  endfor
  
  for i = n:-1:1
    for k = i:n
      c(k) = c(k) - c(k+1)*x(i);
    endfor
  endfor
endfunction
