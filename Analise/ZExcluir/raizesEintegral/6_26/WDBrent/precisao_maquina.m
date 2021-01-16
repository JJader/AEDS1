%objetivo: determinar a precisão da máquina

function [epsilon] = precisao_maquina()
  eps1 = 1;
  
  while(1 + eps1 > 1)
    epsilon = eps1;
    eps1 = eps1/2;
  endwhile
endfunction
