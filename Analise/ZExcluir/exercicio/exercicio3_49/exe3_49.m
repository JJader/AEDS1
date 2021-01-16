x = [1 2 4 6 7];
y = [2 4 1 3 3];

[s2, info] = splines_extrapolados(x,y);

if info == 0
  s2
endif

a = [(1+2)*(1+2*2)/2 (2^2 - 1)/2 0; 2 2*(2+2) 2; 0 (2^2 - 1)/2 (1+2)*(1+2*2)/2];
b = 6*[-3.5, 2.5, -1];

[a,b] = eliminacao_gauss(a,b);
s2 = substituicao_retroativa(a,b);

h0 = x(2) - x(1);
h1 = x(3) - x(2);
s0 = ((h0 + h1)*s2(1) - h0*s2(2))/h1;

n = size(x,2);
hu = x(n) - x(n-1);
hp = x(n-1) - x(n-2);
sn = ((hu + hp)*s2(n-2) - hu*s2(n-3))/hp;

solucao_com_gauss = [s0, s2, sn]

