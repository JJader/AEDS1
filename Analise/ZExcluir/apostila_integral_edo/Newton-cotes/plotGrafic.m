function [] = plotGrafic(n,a,b,m,f)
  
  [x,y] = pontos_da_funcao(a,b,f);
  [x_espacado,y_espacado] = pontos_espacados(a,b,m,f);
  [y_interpolado] = interpolar_funcao(n,x_espacado,y_espacado);

  plot(x,y);
  hold on;
  plot(x_espacado,y_interpolado,'r+');
  
endfunction



function [x,y] = pontos_da_funcao(a,b,f)
  
  x = linspace(a,b,30);
  
  for i = 1:length(x)
    y(i) = f(x(i));
  endfor
  
endfunction


function [x,y] = pontos_espacados(a,b,m,f)
  
  x = a:((b-a)/m):b;
  
  for i = 1:length(x)
    y(i) = f(x(i));
  endfor
  
endfunction



function [y] = interpolar_funcao(n,x,y)
  
  c = coeficientes_polinomio(n,x,y);
  y = zeros(size(x));
  
  for i = 0:length(c)-1
    y += c(i+1)*x.^i;
  endfor
  
endfunction
