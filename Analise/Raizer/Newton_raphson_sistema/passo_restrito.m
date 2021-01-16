% algoritmo Passo-restrito
% Determinar um passo restrito para o método de Newton-Raphson 
%
% Entrada: 
%  n --> Ordem do sistema, 
%  xk --> k-esimo vetor solução
%  fxk --> vetor função em xk
%  pk --> direção de descida de newton, 
%  gk --> vetor gradiente em xk, 
%  
%
%
% Saída: 
%  xk1 --> (k+1) esimo vetor solução
%  fxk1 --> vetor função em xk1
%  lambda --> restritor de passo
%  j --> numero de interações
%  info = 0 sucesso
%

function [n,xk,fxk,pk,gk] = passo_restrito(xk1,fxk1,lambda,j,info)
  
  fk = norm(fxk);
  comp = norm(pk);
  passoMax = 10^3*max([norm(xk),1]);
  
  if comp > passoMax
    escala = passoMax/comp;
    pk = pk*escala;
  endif
  
  passorel = 0;
  inclin = gk'*pk;
  
  for i = 1:n
    t = abs(pk(i))/max([abs(xk(i)),1]);
    
    if t > passorel
      passorel = t;
    endif
  endfor
  
  epsilon = precisao_maquina();
  lambdaMin = epsilon/passorel;
  j = 0;
  lambda = 1;
  
  while(true)
    xk1 = xk + lambda*pk;
    fxk1 = vetor_funcao(xk1);
    fk1 = norm(fxk1);
    j += 1;
    
    if lambda < lambdaMin
      xk1 = xk;
      info = 1;
      break
    else
      if fk1 <= fk + 10^-4*inclin*lambda;
        info = 0;
        break
      else
        if j == 1
          lambdat = -inclin/(2*(fk1-fk-inclin));
        else
          lambdat = lambda_cubico(fk1,fk,fb,inclin,lambda,lambdap);
        endif
      endif
      
      lambdap = lambda;
      fp = fk1;
      lambda = max([lambdat,0.1*lambda]);
    endwhile
endfunction

function [fx] = vetor_funcao(x)
  
  fx(1) = x(1)^2 + x(1)*x(2) - x(2)^2 + 1;
  fx(2) = log(x(1)) + sqrt(x(2)+2) - 2;
endfunction

function [lambdat]= lambda_cubico(fk1,fk,fb,inclin,lambda,lambdap)
  t1 = fk1-fk-lambda*inclin;
  t2 = fp-fk-lambdap*inclin;
  t3 = lambda-lambdap;
  a = (t1/lambda^2-t2/lambdap^2)/t3;
  b = (t2*lambda/lambdap^2-t1*lambdap/lambda^2)/t3;
  
  if a == 0
    lambdat = -inclin/(2*b);
  else
    discrim = b^2-3*a*inclin;
    if discrim < 0
      lambdat = 0.5*lambda;
    elseif b<=0
      lambdat = (-b+sqrt(discrim))/(3*a);
    else
      lambdat = -inclin/(b+sqrt(discrim));
    endif
  endif
  
  if lambdat > 0.5*lambda
    lambdat = 0.5*lambda;
  endif
endfunction
