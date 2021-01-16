%Objetivo: Estimar parâmetros de quadrados mínimos da equação de regressão
% linear múltipla via decomposição em valores singulares reduzida
%Entrada:
% ii = indicação de interseção
% x = submatriz com variáveis explicativas originais
% y = variáveis respostas
%Saída'
% b = estimadores dos parâmetros
% r2 = coef. determinação
% s2 = quad médio residual
% ALCc = cr. inf. akaike
% info = informação sobre erro. 
%  info = 0 sem erro; info = 1 p < v; 
%  info = 2 ii != 1 != 0; info = 3 modelo não permitido 

function [b, r2, s2, ALCc, info] = regressao_linear_dvs(ii,x,y)
  n = size(x,1);
  v = size(x,2);
  p = v + ii;
  
  [matX, info] = matriz_explicativas(ii,x);
  
  if info != 0
    return
  endif
  
  epsilon = precisao_maquina();
  [U,sigma,V] = svd(matX);
  
  if (sigma(p,p) < n*epsilon)
    info = 4;
    return
  endif
  
  for i = 1:p
    soma = 0;
    for j = 1:n
      soma += U(j,i)*y(j);
    endfor
    c(i) = soma/sigma(i,i);
  endfor
  
  for i = 1:p
    soma = 0;
    for j = 1:p
      soma += V(i,j)*c(j);
    endfor
    b(i) = soma;
  endfor
  
  info = 0;
  s = 0;
  sy = 0;
  sy2 = 0;
  
  for i = 1:n
    u = 0;
    for j = 1:p 
      u += matX(i,j)*b(j);
    endfor
    s += (y(i) - u)^2;
    sy += y(i);
    sy2 += y(i)^2;
  endfor
  
  if ii == 1
    r2 = 1 - s/(sy2 - sy^2/n);
  else
    r2 = 1 - s/sy2;
  endif
  
  s2 = s/(n-p);
  ALCc = n*log(s/n) + 2*p*n/(n-p-1); 
endfunction
