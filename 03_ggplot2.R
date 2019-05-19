# estéticas -------------------------------------------------------------------

# Exercício: será que filmes mais caros tendem a receber uma nota maior?
  
# 1. Crie um gráfico de dispersão da nota do imdb pelo orçamento.


# 2. Pinte todos os pontos do gráfico de verde


# 3. Refaça o gráfico do item 1 apenas para filmes com classificação etária livre. 


# 4. Também refaça para os filmes com classificação etária "a partir de 13 anos".


# 5. Refaça o gráfico de dispersão (orçamento x nota) mapeando uma variável 
# contínua nas estéticas cor, tamanho e forma.

# 6. Faça o mesmo para variáveis categóricas (e com poucas categorias).


# geometrias ------------------------------------------------------------------

# 1. Faça um gráfico de linha, um boxplot, um histograma e um gráfico de área (?).

# 2. Faça um gráfico de barras com a nota média dos seis diretores com mais filmes.
# 2.a. Ordene as baras pelas notas médias.
# 2. Faça um gráfico de barras para mostrar as diretoras com mais filmes.

# 3. Faça um gráfico de dispersão entre duração do filme e nota com um regressão.

# 4. Refaça o gráfico anterior, mas com uma reta de regressão para cada gênero.

# 5. Analise a distribuição da duração dos filmes com um histograma e com 
# a curva de densidade.

# 6. Analise a distribuição da duração dos filmes após 2010 com um diagrama de
# caixa e com um gráfico de violino.

# 7. Como os orçamentos dos filmes evoluem ao longo dos anos após 1990?
# Responda com um gráfico de dispersão e uma regressão
# Responda com um gráfico de linhas com o orçamento médio de cada ano
# Responda com um gráfico de linhas com o orçamento mediano de cada ano

# X. Analise a distribuição da duração dos filmes com um histograma e com 
# a curva de densidade para cada década. (com facetas)

# X. Analise a distribuição do lucro dos filmes com um diagrama de caixa e com 
# um gráfico de violino para cada década. (com facetas)

# X. Selecione os 20 atores (ator_1) com mais filmes. Visualize quem são os 
# atores e o número de filmes que eles fizeram.

# X. Estude a distribuição do orçamento e do lucro dos filmes  desses atores.

# X. Selecione um dos atores e estude a nota de seus filmes no IMDB ao longo do tempo.

# imdb_tidy <- imdb %>% 
#   gather(posicao, ator, ator_1, ator_2, ator_3)

# X. Repita a análise anterior, utilizando agora todas as colunas de atores, e veja 
# se você mudaria de opinião sobre o ator a ser escolhido.

