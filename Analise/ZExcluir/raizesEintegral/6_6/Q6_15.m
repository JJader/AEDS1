clc
clear 

addpath('./Teste');

c = [2 -5 7 19 -98 -115];
n = 5;

L = limites_raizes(n,c)
numero_raizes_positivas = fourier(n,c,L(1),L(2))
numero_raizes_negativas = fourier(n,c,L(3),L(4))

printf("\n\nA raiz positiva está em ")
i = 0

for i = L(1):0.001:L(2)
  y = horner(n,c,i);
  
  if -0.006<y && y<0.006
    printf("\n\nA raiz positiva está em ")
    i
  endif 
  
endfor



for i = L(3):0.001:L(4)
  y = horner(n,c,i);
  
  if -0.04<y && y<0.04 
    printf("\n\nA raiz negativa está em ")
    i
  endif 
endfor

restoredefaultpath;