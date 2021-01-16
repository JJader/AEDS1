x = [1 2 4 6 7];
y = [2 4 1 3 3];

[s2, info] = splines_natural(x,y);

if info == 0
  s2
endif

a = [2*(1+2) 2 0; 2 2*(2+2) 2; 0 2 2*(2+1)];
b = 6*[-3.5, 2.5, -1];

[a,b] = eliminacao_gauss(a,b);
soluacao_gauss = substituicao_retroativa(a,b)