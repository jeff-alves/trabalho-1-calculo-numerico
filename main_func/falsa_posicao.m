function y = falsa_posicao(funcao, tolerancia, intervalo, max_it)
  
  a = intervalo(1);
  b = intervalo(2);

  if b-a <= tolerancia
    y = [a, b];
    return
  elseif abs(calcular(funcao, a)) < tolerancia
    y = [a];
    return
  elseif abs(calcular(funcao, b)) < tolerancia
    y = [b];
    return
  endif

  k = 0;
  while (k < max_it)

    x = (a*calcular(funcao, b) - b*calcular(funcao, a)) / (calcular(funcao, b)-calcular(funcao, a));
    
    if abs(calcular(funcao, x)) < tolerancia
      y = [x];
      return
    endif

    if calcular(funcao, a) * calcular(funcao, x) > 0
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
  y = 'Limite de iterações atingido, sem resultados.';

endfunction