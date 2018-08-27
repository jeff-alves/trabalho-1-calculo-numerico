# Cálculo Numérico - Trabalho 1

Desenvolva um sistema para calcular esse deslocamento x da extremidade de um foguete espacial.

## Equipe

- Antônio Victor Figueiredo Porto (líder)
- Iago Braga
- Jefferson Alves Costa
- Lucas da Silva Soares
- Renan Da Silveira Teles

## Como rodar

Rodar o arquivo com o nome do metodo escolhido, passando os parametros nescessários:

    - f = Arquivo contendo a função (usar "x" para variavel desejada);
    - a = Lista contendo ajustes para a função (usar "a" para variavel de ajuste);
    - t = Tolerancia permitida de erro para considerar como raiz;
    - i = Intervalo para busca;
    - max = numero maximo de iterações;

**Exemplo:**

    octave run_falsa_posicao.m f='func.txt' a='[-50, -1, 0, 0.69311, 1, 2, 3]' t='10^-5' i='[2,3]' max='50'
