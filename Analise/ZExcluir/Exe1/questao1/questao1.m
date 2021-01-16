for i = 0:1000
  
  tamanho_matriz = randi(10);
  
  A = randi(100,tamanho_matriz);
  B = randi(100,tamanho_matriz);
  
  AB = A*B;
  BA = B*A;
  
  if func_traco(AB) != func_traco(BA)
    AB
    BA
    printf("Propriedade falsa \n");
    break
  endif
  
endfor

printf("Propriedade válida \n")