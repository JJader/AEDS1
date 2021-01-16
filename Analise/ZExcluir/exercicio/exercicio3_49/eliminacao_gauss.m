% Objetivo: Escalonar uma matriz
%Entrada:  
% A = matriz dos coeficientes
% B = vetor de termos independentes
%Saida
% A = matriz dos coef escalonada
% B = vetor de termos ind ajustado
      
 function [A,B] = eliminacao_gauss(A,B)
   n = size(A,1);
   
   for j = 1 : n-1
     for i = j+1 : n
       m(i,j) = A(i,j)/A(j,j);
       for k = 1 : n
         A(i,k) = -m(i,j)*A(j,k) + A(i,k);
       endfor
       B(i) = -m(i,j)*B(j) + B(i);
     endfor
   endfor
 endfunction
