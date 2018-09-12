function [d, k] = falsa_posicao(f, ajuste, tolerancia, intervalo, max_it)
  
  tolerancia = abs(sym(tolerancia, 'f'));
  ajuste = sym(ajuste, 'f');
  a = sym(intervalo(1), 'f');
  b = sym(intervalo(2), 'f');
  k = 1;

  if abs(b-a) <= tolerancia
    d = [a, b];
    return
  elseif abs(f(a, ajuste)) < tolerancia
    d = [a];
    return
  elseif abs(f(b, ajuste)) < tolerancia
    d = [b];
    return
  endif

  while (k <= max_it)
    fa = vpa(f(a, ajuste));
    fb = vpa(f(b, ajuste));
    x = vpa((a*fb - b*fa) / (fb-fa));
    fx = vpa(f(x, ajuste));


    if abs(fx) < tolerancia
      d = [x];
      return
    endif

    if imag(fx)
      d = 'Não é possivel obter o sinal de um número imaginário em f(x).';
      return
    endif
    #if sign(fa * fx) > 0
    if sign(fx) > 0
      a = x;
    else
      b = x;
    endif

    if abs(b-a) <= tolerancia
      d = [a, b];
      return
    endif
    
    k+=1;
  endwhile
  k-=1;
  d = 'Limite de iterações atingido, sem resultados.';

endfunction