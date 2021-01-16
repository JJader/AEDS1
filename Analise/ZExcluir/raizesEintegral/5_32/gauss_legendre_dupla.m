% Gauss-Legendre-dupla
% Cálculo de integram dupla pela fórmulas de gauss legendre
% Entrada: ax,bx,nx,ay,by,ny
% Saída: integral e info

function [integral,info] = gauss_legendre_dupla(ax,bx,nx,ay,by,ny,f)
  
  integral = 0;
  info = 0;
  
  [T,alfa,info] = gauss_legendre_absPes(nx,f);
  
  if info != 0
    return
  endif
  
  if ny == nx
    for j = 1:ny
      beta(j) = alfa(j);
      u(j) = T(j);
    endfor
    
  else
    [U,beta,info] = gauss_legendre_absPes(ny);
    if info != 0
      return
    endif
  endif
  
  bax = (bx-ax)/2;
  bay = (by-ay)/2;
  
  for i = 1:nx
    x = ax + bax*(T(i) + 1);
    soma = 0;
    
    for j = 1:ny
      y = ay + bay*(U(j)+1);
      fxy = f(x,y);
      soma = soma + beta(j)*fxy;
    endfor
    
    integral = integral + alfa(i)*soma;
  endfor
  
  integral = bax*bay*integral;
endfunction
