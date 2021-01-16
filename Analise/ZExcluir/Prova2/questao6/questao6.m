  
x = [500 1000 1500 2000 2500 3000 3500 4000];
y = [2.74 5.48 7.90 11.00 13.93 16.43 20.24 23.52];

[b, r2, s2, ALCc, info] = regressao_linear_dvs(1,x',y',3);

val = 100;
while(val > 0)
  val = input("Digite o comprimento positivo: ");
  z = b(1) + b(2)*val + b(3)*val^2
endwhile