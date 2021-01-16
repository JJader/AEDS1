function [dfx] = return_derivative_fx(a,b,f,grau)
  % Return derivative of f(x)
  %
  % input 
  %  a,b --> is iterval for avaliation
  %  f   --> is a function inline('f(x)') 
  %  grau--> is degree of derivative
  %
  %
  % output
  %  dfx --> derivative of f(x)
  
  if (nargin == 3)
    grau = 1;
  endif
  
  values_x = linspace(a,b,20);
  
  for i = 1:length(values_x)
    values_y(i) = f(values_x(i));
  endfor
  
  polinomio_fx = polyfit(values_x, values_y, 4);
  derivateCoef_fx = polyder(polinomio_fx);
  
  dfx_string = polyout(derivateCoef_fx);
  dfx = inline(dfx_string);
  
  if grau > 1 
    grau -=1;
    dfx = return_derivative_fx(a,b,dfx,grau);
  endif
endfunction