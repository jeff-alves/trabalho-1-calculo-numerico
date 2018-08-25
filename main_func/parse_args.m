function lista = parse_args (args, nargs)

  if nargs == 0
    param = input ('Entre uma lista no formato k1,k2,...,kn ou o nome do arquivo: ', 's');
  else
    param = args{1};
    for i = 2:nargs
      param = strcat(param, ', ', args{i});
    endfor
  endif;

  try
    lista = dlmread(param);
  catch
    lista = eval(strcat('[',param,']'));
  end_try_catch

endfunction