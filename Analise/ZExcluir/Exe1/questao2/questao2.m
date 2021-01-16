
figure(1)

for i = 1:4
  
  t = linspace(-2.98,-0.98,4);
  x = linspace(-0.19, 0.06, 50);
  y = 10.*sin(x.^6)*5.*cos(x.^5)*8*(t(i)^1)*2.*e.^(x.^10);
  plot(x,y, 'go');
  hold on
  
endfor