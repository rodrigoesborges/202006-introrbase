# estéticas -------------------------------------------------------------------
library(tidyverse)
imdb <- read_rds("dados/imdb.rds") %>% 
  mutate(lucro = receita - orcamento)
filmes_recentes <- imdb %>% 
  filter(ano >= 2015)

# Use a tabela filmes_recentes
# Filmes mais caros tendem a receber uma nota maior?
# 1. Crie um gráfico de dispersão da nota do imdb pelo orçamento.
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point()

# 2. Pinte todos os pontos do gráfico de verde
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(col = "forestgreen")


# 3. Refaça o gráfico do item 1 apenas para filmes com classificação etária livre. 
filmes_recentes %>% 
  filter(classificacao == "Livre") %>% 
  ggplot(aes(orcamento, nota_imdb)) +
  geom_point() +
  ggtitle("Filmes de indicação livre")


# 4. Também refaça para os filmes com classificação etária "a partir de 13 anos".
filmes_recentes %>% 
  filter(classificacao == "A partir de 13 anos") %>% 
  ggplot(aes(orcamento, nota_imdb)) +
  geom_point() +
  ggtitle("Filmes indicados para maiores de 13 anos")



# Mapear variáveis em estéticas
# 5. Refaça o gráfico de dispersão (orçamento x nota) mapeando uma variável 
# contínua nas estéticas cor, tamanho e forma.

# cor
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(col = duracao))

# tamanho
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(size = duracao), alpha = 0.6)

# forma

# O comando abaixo dá um erro.
# O ggplot nos impede de fazer uma má-prática
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(shape = duracao))


# 6. Faça o mesmo para variáveis categóricas (e com poucas categorias).

# cor
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(col = genero))

# tamanho

# O comando abaixo dá um erro.
# O ggplot nos impede de fazer uma má-prática
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(size = genero))

# forma
ggplot(filmes_recentes, aes(orcamento, nota_imdb)) +
  geom_point(aes(shape = genero), size = 3, alpha = 0.6)


# geometrias ------------------------------------------------------------------

## barras
# 1. Faça um gráfico de barras com a nota média dos seis diretores com mais filmes.
notas_medias <- imdb %>% 
  filter(!is.na(diretor)) %>% 
  group_by(genero, diretor) %>% 
  summarise(quantidade = n(),
            media = mean(nota_imdb, na.rm = TRUE))

top_6_diretores <- notas_medias %>% 
  arrange(desc(quantidade)) %>% 
  head(6)

ggplot(top_6_diretores, aes(diretor, media)) +
  geom_col()

# 2 Ordene as barras pelas notas médias.
## Podemos fazer direto no aes()
ggplot(top_6_diretores, aes(fct_reorder(diretor, media), media)) +
  geom_col()

## Ou podemos alterar o data.frame
top6_ordenado <- top_6_diretores %>% 
  mutate(diretor = fct_reorder(diretor, media))

ggplot(top6_ordenado, aes(diretor, media)) +
  geom_col()

# 3. Faça um gráfico de barras para mostrar as diretoras com mais filmes.
top_10_diretoras <- notas_medias %>% 
  filter(genero == "mulher") %>% 
  mutate(diretor = fct_reorder(diretor, media)) %>% 
  top_n(10, quantidade) # podemos usar top_n no lugar de arrange + head

ggplot(top_10_diretoras, aes(diretor, media)) +
  geom_col()

# Inverte os eixos para facilitar a leitura do nome das diretoras
ggplot(top_10_diretoras, aes(diretor, media)) +
  geom_col() +
  coord_flip()

## regressão
# 4. Faça um gráfico de dispersão entre duração do filme e nota com uma regressão.
ggplot(filmes_recentes, aes(duracao, nota_imdb)) +
  geom_point() +
  geom_smooth()

# Mudando método para modelo linear (method = "lm")
ggplot(filmes_recentes, aes(duracao, nota_imdb)) +
  geom_point() +
  geom_smooth(method = "lm")

# Removendo a faixa que indica o erro padrão (se = FALSE)
ggplot(filmes_recentes, aes(duracao, nota_imdb)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# 5. Refaça o gráfico anterior, mas com uma reta de regressão para cada gênero.
ggplot(filmes_recentes, aes(duracao, nota_imdb)) +
  geom_point() +
  geom_smooth(aes(col = genero), method = "lm", se = FALSE)



## Linhas
# 6. Como os orçamentos dos filmes evoluem ao longo dos anos após 1990?
pos_90 <- imdb %>% 
  filter(ano >= 1990)

# Responda com um gráfico de dispersão e uma regressão
ggplot(pos_90, aes(ano, orcamento)) +
  geom_point()

# Ou podemos usar o geom_jitter para remover um pouco da sobreposição dos pontos
ggplot(pos_90, aes(ano, orcamento)) +
  geom_jitter()


# Responda com um gráfico de linhas com o orçamento médio de cada ano
pos_90 %>% 
  group_by(ano) %>% 
  summarise(orcamento = mean(orcamento, na.rm = TRUE)) %>% 
  ggplot(aes(ano, orcamento)) +
  geom_line(size = 2)


# Responda com um gráfico de linhas com o orçamento mediano de cada ano
## Basta trocar a função na terceira linha: de mean para median
pos_90 %>% 
  group_by(ano) %>% 
  summarise(orcamento = median(orcamento, na.rm = TRUE)) %>% 
  ggplot(aes(ano, orcamento)) +
  geom_line(size = 2)


## densidade
# 7. Analise a distribuição da duração dos filmes com um histograma e com 
# a curva de densidade.

## histograma
ggplot(imdb, aes(duracao)) +
  geom_histogram(binwidth = 20) # Uma barra a cada 20 minutos

## densidade
ggplot(imdb, aes(duracao)) +
  geom_density()

## Diagrama de caixa
# 8. Analise a distribuição da duração dos filmes após 2010 com um diagrama de
# caixa e com um gráfico de violino.

pos_2010 <- imdb %>% 
  filter(ano >= 2010)

## Diagrama de caixa
ggplot(pos_2010, aes(y = duracao)) + # não precisamos indicar um x
  geom_boxplot()

ggplot(pos_2010, aes(genero, duracao)) + # mas podemos indicar um x
  geom_boxplot()

## Violino
ggplot(pos_2010, aes(genero, duracao)) + 
  geom_violin(draw_quantiles = 0.5)


# facetas ---------------------------------------------------------------------
# 1. Analise a distribuição da duração dos filmes com um histograma e com 
# a curva de densidade para cada década. (com facetas)
decadas <- imdb %>% 
  # %/% é a parte inteira da divisão
  mutate(decada = (ano %/% 10) * 10) # 1993 %/% 10 é 199. Que vezes 10 é 1990

## Com histograma
ggplot(decadas, aes(duracao)) +
  geom_histogram(binwidth = 20) +
  facet_wrap(~ decada)

## Com densidade
ggplot(decadas, aes(duracao)) +
  geom_density() + 
  facet_wrap(~ decada)


# 2. Analise a distribuição do lucro dos filmes entre as décadas de 1980 e 2000
# com um diagrama de caixa e com um gráfico de violino para cada década. (com facetas)

decadas %>% 
  filter(decada > 1970) %>% 
  ggplot(aes(y = lucro)) +
  geom_boxplot() +
  facet_wrap(~decada, nrow = 1) # facetas em só uma linha

decadas %>% 
  filter(decada > 1970) %>%
  ggplot(aes(decada, lucro)) +
  geom_violin() +
  facet_wrap(~decada, nrow = 1, scales = "free_x")


# extras ---------------------------------------------------------------------

# 1. Selecione os 20 atores (ator_1) com mais filmes. Visualize quem são os 
# atores e o número de filmes que eles fizeram.

# 2. Estude a distribuição do orçamento e do lucro dos filmes  desses atores.

# 3. Selecione um dos atores e estude a nota de seus filmes no IMDB ao longo do tempo.


