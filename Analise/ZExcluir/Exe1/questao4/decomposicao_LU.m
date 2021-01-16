%
% Questão 3 - Decomposição LU 
% Método de resolução de sistema utilizando a Decomposição LU
% Entrada: ordem (n) e matriz a ser decomposta (A)
% Saída: matriz A = L + U - I
%
function [A,pivot,det] = decomposicao_LU(A)
  if nargin != 0
    
    n = size(A,1);
    pivot = ones(1,n);
    det = 1;
    
    for i = 1:n
      pivot(i) = i;
    endfor
    
    for j = 1:n-1
      p = j;
      Amax = abs(A(j,j));
      
      for k = j+1:n
        if abs(A(k,j)) > Amax
          Amax = abs(A(k,j));
          p = k;
        endif
      endfor
      
      if p != j
        for k = 1:n
          t = A(j,k);
          A(j,k) = A(p,k);
          A(p,k) = t;
        endfor  
        t = pivot(j);
        pivot(j) = pivot(p);
        pivot(p) = t;
        det = -det;
      endif
      
      det = det*A(j,j);
      
      if abs(A(j,j)) != 0
        r = 1/A(j,j);
        for i = j+1:n
          m = A(i,j)*r;
          A(i,j) = m;
          for k = j+1:n
            A(i,k) = A(i,k) -m*A(j,k);
          endfor
        endfor
      endif
    endfor
  endif
  det = det*A(n,n);
endfunction