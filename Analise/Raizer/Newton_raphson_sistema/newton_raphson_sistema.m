% algoritmo Newton Raphson sistema
% Calcular raiz de equação pelo método da Newton Raphson sistema 
%
% Entrada: 
%  tp --> tipo de passo, 
%  n --> ordem do sistema
%  x --> vetor inicial
%  Toler, 
%  iterMax, 
%  f = inline('f(x)')
%
%
% Saída: x (solucao), iter, info
%  info = -1 função não muda de sinal nos extremos do intervalo
%  info = 1 raiz não convergiu com os parâmetros dados

function [x,iter,info] = newton_raphson_sistema(tp,n,x,toler,iterMax,f)
  addpath('./LU')
  
  normaDeltaX = 1+toler;
  lambda = 1;
  infoPR = 0;
  iter = 0;
  
  fx = vetor_funcao(x,f);
  normaFx = norm(fx);
  
  while(true)
    jx = matriz_jacobiana(x);
    
    if (normaDeltaX<=toler && normaFx<=toler) || infoPR!=0 || iter>=iterMax
      break
    endif
    
    deltaX =  resolucao_LU(jx,-fx);
    jx = decomposicao_LU(jx)
    
    if tp == 1
      x = x + deltaX
      fx = vetor_funcao(x);
    else
      gx = 2*jx'*fx;
      [x,fx,lambda,infoPR] = passo_restrito(n,x,fx,deltaX,gx);
    endif
    
    normaFx = norm(fx);
    normaDeltaX = lambda*norm(deltaX)/norm(x);
    iter +=1;
  endwhile
  
  if (normaDeltaX<=toler && normaFx<=toler)
    info = 0;
  else
    if infoPR == 0
      info = 1;
    else
      info = 2;
    endif
  endif
  
restoredefaultpath
endfunction


function [fx] = vetor_funcao(x)
  
  fx(1) = x(1)^2 + x(1)*x(2) - x(2)^2 + 1
  fx(2) = log(x(1)) + sqrt(x(2)+2) - 2
endfunction

function [j] = matriz_jacobiana(x)
  
  j(1,1) = 2*x(1) + x(2)
  j(1,2) = x(1) -2*x(2)
  j(2,1) = 1/x(1)
  j(2,2) = 1/(2*sqrt(x(2) + 2))
  
endfunction



