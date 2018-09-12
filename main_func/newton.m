function [d, k, ea] = newton(f, fd, ajuste, tolerancia, inicio, max_it)

  tolerancia = vpa(tolerancia);
  ajuste = vpa(ajuste);
  inicio = vpa(inicio);

  k = 1;

  if abs(vpa(f(inicio, ajuste))) < tolerancia
    d = inicio;
    return
  endif

  old = inicio;
  while (k <= max_it)

    fo =  vpa(f (old, ajuste));
    fdo = vpa(fd(old, ajuste));

    new = old - ( fo / fdo );
    
    fn =  vpa(f (new, ajuste));

    #if (abs(fn) < tolerancia) || (abs(new - old) <= tolerancia)
    ea = abs(new - old);
    if (ea <= tolerancia)
      d = simplify(new);
      return
    endif

    old = new;
    k+=1;
  endwhile
  k-=1;
  d = 'Limite de iterações atingido, sem resultados.';

endfunction