x = [2.1 2.2 2.3 2.4];
y = [0.3693 0.5137 0.6732 0.8424];
exato = 0.4393;

p1 = gregory_newton(x(1:2),y(1:2),2.15)
erroP1 = abs(exato - p1)
p2 = gregory_newton(x(1:3),y(1:3),2.15)
erroP2 = abs(exato - p2)
p3 = gregory_newton(x(1:4),y(1:4),2.15)
erroP3 = abs(exato - p3)