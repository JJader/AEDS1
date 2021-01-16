%% Exercicio 4.13
ano = [1940 1950 1960 1970 1980 1991 1996 2000 2010];
rural = [28356133 33161506 38767423 41054053 38566297 35834485 33993332 31845211 29830007];
matALCc = []

for i = 1:9
  [b, r2, s2, ALCc, info] = regressao_linear_dvs(1,ano',rural',i);
  matALCc(i) = ALCc;
endfor

menor = matALCc(1);
index = 0;

for i = 1:size(matALCc,2)-1
  
  if menor > matALCc(i);
    menor = matALCc(i);
    index = i;
  endif
endfor

clc
printf("O polinomio que mais se ajusta é o de grau %f\n\n", index -1)

