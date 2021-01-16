function [natural, extrapolados, z, info] = splines(x,y,z)
  
  n = size(x,2);
  
  if nargin == 2
    z = linspace(x(1),x(n),50);
  endif
  
  [natural, info] = splines_avaliar(x,y,z,0);
  [extrapolados, info] = splines_avaliar(x,y,z,1);
  
  plot(x,y, 'ro')
  hold on 
  
  plot(z,natural, 'gd')
  hold on 
  
  plot(z,extrapolados, 'b+')
  hold on 
endfunction
