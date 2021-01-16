% Gauss-Legendre-absPes 
% Calcular abscissas e pesos para a quadratura de Gauss-Legendre
% Entrada: n numeros de pontos
% Saída: T abscissas (T(1): menor que zero, T(n) maior que zero)
%  W pesos,
%  info informação sobre consistência e convergência
%  info = 0, n>=1; info = k, k zeros não convergiram; info = -1 n<1

function [T,W,info] = gauss_legendre_absPes(n)
  
  if n < 1
    info = -1;
    return
  endif
  
  toler = 10^-15;
  iterMax = 30;
  info = 0;
  m = floor(n/2);
  pi8 = 3.141592653589793;
  
  for i = 1:m
    z = cos((i-0.25)/(n+0.5)*pi8);
    delta = 1 + toler;
    iter = 0;
    
    while(abs(delta)>toler && iter != iterMax)
      p1 = 1;
      pz = z;
      
      for k = 2:n
        p0 = p1;
        p1 = pz;
        pz = ((2*k-1)*z*p1 - (k-1)*p0)/k;
      endfor
      
      dpz = n*(p1-z*pz)/(1-z^2);
      
      delta = pz/dpz;
      z = z-delta;
      iter = iter+1;
    endwhile
    
    if abs(delta) <= toler
      T(i) = -z;
      T(n+1-i) = z;
      W(i) = 2/((1-z^2)*dpz^2);
      W(n+1-i) = W(i);
      
    else
      T(i) = 0;
      T(n+1-i) = 0;
      W(i) = 0;
      W(n+1-i) = 0;
      info = info + 1;
    endif
  endfor
  
  if rem(n,2) != 0
    T(m+1)=0;
    W(m+1) = pi8/2*exp(gammaln((n+1)/2) - gammaln(n/2 + 1))^2;
  endif  
endfunction
