function [y, k] = falsa_posicao(funcao, ajuste, tolerancia, intervalo, max_it)
  
  a = intervalo(1);
  b = intervalo(2);
  k = 1;

  if b-a <= tolerancia
    y = [a, b];
    return
  elseif abs(calcular(funcao, a, ajuste)) < tolerancia
    y = [a];
    return
  elseif abs(calcular(funcao, b, ajuste)) < tolerancia
    y = [b];
    return
  endif

  while (k <= max_it)
    x = (a*calcular(funcao, b, ajuste) - b*calcular(funcao, a, ajuste)) / (calcular(funcao, b, ajuste)-calcular(funcao, a, ajuste));
    
    if abs(calcular(funcao, x, ajuste)) < tolerancia
      y = [x];
      return
    endif

    if calcular(funcao, a, ajuste) * calcular(funcao, x, ajuste) > 0
      a = x;
    else
      b = x;
    endif

    if b-a <= tolerancia
      y = [a, b];
      return
    endif
    
    k+=1;
  endwhile
  k-=1;
  y = 'Limite de iterações atingido, sem resultados.';

endfunction