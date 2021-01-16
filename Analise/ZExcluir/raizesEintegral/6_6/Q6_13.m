clc
clear 

addpath('./Teste');

c = [2 -3 -6 5];
n = 3;

L = limites_raizes(n,c);
raizes_positivas = fourier(n,c,L(1),L(2));
raizes_negativas = fourier(n,c,L(3),L(4));


for i = L(1):0.01:L(2)
  y = horner(n,c,i);
  
  if -0.04<y && y<0.04
    printf("\n\nA raiz positiva está em ")
    i
  endif 
endfor



for i = L(3):0.01:L(4)
  y = horner(n,c,i);
  
  if -0.05<y && y<0.05 
    printf("\n\nA raiz negativa está em ")
    i
  endif 
endfor

restoredefaultpath;