%Objetivo: Estimar parâmetros de quadrados mínimos da equação de regressão linear múltipla
% via equações normais 
%Entrada:
% v = numero de variáveis explicativas
% p = número de parâmetros do modelo
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

function [b, r2, s2, ALCc, info] = regressao_linear_en(ii,x,y)
  n = size(x,1);
  v = size(x,2);
  p = v + ii;
  
  [matX,info] = matriz_explicativas(ii,x);
  
  if info != 0
    return
  endif
  
  for i = 1:p
    for j = 1:i
      soma = 0;
      
      for k = 1:n
        soma += matX(k,i)*matX(k,j);
      endfor
      
      sxx(i,j) = soma;
      
      if i != j
        sxx(j,i) = soma;
      endif
      
    endfor
    
    soma = 0;
    
    for k = 1:n
      soma += matX(k,i)*y(k);
    endfor
    
    sxy(i) = soma;
  endfor
  
  [L, det, info] = decomposicao_cholesky(sxx);
  
  if info != 0
    info = 4;
    return
  endif
  
  t = substituicao_sucessiva(L,sxy);
  U = L';
  b = substituicao_retroativa(U, t);
  
  info = 0;
  s = 0;
  sy2 = 0;
  
  for i = 1:n
    u = 0;
    
    for j = 1:p
      u += matX(i,j)*b(j);
    endfor
    
    s += (y(i) - u)^2;
    sy2 += y(i)^2;
  endfor
  
  if ii == 1
    r2 = 1 - s/(sy2 - sxy(1)^2/n);
  else
    r2 = 1 - s/sy2;
  endif
  
  s2 = s/(n-p);
  ALCc = n*log(s/n) + 2*p*n/(n-p-1); 
  
endfunction
