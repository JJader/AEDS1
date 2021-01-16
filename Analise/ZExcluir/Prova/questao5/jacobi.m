%
% Questão 3 - Função de resolução de sistema jacobi 
% Este script retorna a matriz com resposta para o sistema dado por Ax = b
% Entrada: n (ordem da matriz), A (Matriz de coeficientes) b (matriz dos termos independentes) toler (tolerância) iterMax (numero de interação)
% Saída: x (matriz de solução) iter (numero de interação) erro
%

function [x, iter, erro] = jacobi(A,b,toler,iterMax)
  n = size(A,1);  
  x = ones(size(b));
  v = ones(size(b));
  
  for i = 1:n
    r = 1/A(i,i);
    for j = 1:n
      if i != j
        A(i,j) = A(i,j)*r;
      endif
    endfor
    b(i) = b(i)*r;
    x(i) = b(i);
  endfor
  iter = 0;
  
  while(1)
    iter = iter + 1;
    for i = 1:n
      soma = 0;
      for j = 1:n
        if i != j
          soma = soma + A(i,j)*x(j);
        endif
      endfor
      v(i) = b(i)-soma;
    endfor
    norma1 = 0;
    norma2 = 0;
    for i = 1:n
      if abs(v(i)-x(i)) > norma1;
        norma1 = abs(v(i)-x(i));
      endif
      if abs(v(i)) > norma2
        norma2 = abs(v(i));
      endif
      x(i) = v(i);
    endfor
    
    difMax = norma1/norma2;
    
    if (difMax < toler || iter >= iterMax)
      break
    endif
  endwhile
  
  if difMax <= toler 
    erro  =  0
  else
    erro = 1
  endif
  
endfunction
