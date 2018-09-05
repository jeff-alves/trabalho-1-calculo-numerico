addpath ("main_func")
#format rat;

param = parse_args(argv, nargin); #converte os parametros em variaveis nomeadas

funcao = fileread(param.f);
tolerancia = param.t;
intervalo = param.i;
max_it = param.max;

for ajuste = param.a
    printf("#############################\n");
    a = ajuste;
    [y, k] = falsa_posicao(funcao, ajuste, tolerancia, intervalo, max_it)
endfor
printf("#############################\n");
