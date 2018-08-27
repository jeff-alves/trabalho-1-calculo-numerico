addpath ("main_func")
#format rat;

param = parse_args(argv, nargin); #converte os parametros em variaveis nomeadas

funcao = fileread(param.f);
tolerancia = param.t;
intervalo = param.i;
max_it = param.max;

for ajuste = param.a
    printf("#############################\n");
    tmp_func = strrep(funcao, 'a', num2str(ajuste));
    ajuste
    y = falsa_posicao(tmp_func, tolerancia, intervalo, max_it)
endfor
printf("#############################\n");
