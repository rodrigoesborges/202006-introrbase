# filter ----------------------------------------------------------------------
# exercício 1
# Quais filmes tiveram nota no imdb menor do que 5?
filmes_ruins <- imdb %>% 
  filter(nota_imdb < 5)

imdb %>% 
  filter(nota_imdb < 5)

# exercício 2
# Há filmes com nota menor do que 5 e um orcamento maior que 1 milhão de dólares? 
imdb %>% 
  filter(nota_imdb < 5) %>% 
  filter(orcamento > 1000000)

imdb %>% 
  filter(nota_imdb < 5 & orcamento > 1000000)

imdb %>% 
  filter(nota_imdb < 5, orcamento > 1000000)

imdb %>% 
  filter(nota_imdb < 5 | (nota_imdb > 10 & nota_imdb < 50))

imdb %>% 
  filter(nota_imdb > 10)

# exercício 3
# E filmes com orçamento menor que 1 milhão de dólares e nota maior que 8?
imdb %>% 
  filter(nota_imdb > 8, orcamento < 1000000)

# exercício 4
# Quais filmes usaram mais de um milhão de dólares para criar menos de 1h de telona?
imdb %>% 
  filter(orcamento > 1000000, duracao < 60)


# exercício 5
# Existiam filmes coloridos antes de 1940?
imdb %>% 
  filter(cor == "Color", ano < 1940)

# exercício 6
# Quantos filmes de antes de 1940 eram em preto e branco?
imdb %>% 
  filter(cor != "Color", ano < 1940)

# exercício 7
# Filtre apenas os filmes dirigidos por Walter Salles ou José Padilha
imdb %>% 
  filter(diretor == "Walter Salles" | diretor == "José Padilha")

imdb <- read_rds("dados/imdb.rds")

# exercicio 8
# Refaça o exercício 7 usando o operador '%in%'.
imdb %>% 
  filter(diretor %in% c("Walter Salles", "José Padilha"))


# exercício 9
# Quais filmes que não possuem informação tanto de receita quanto de orcamento.
imdb %>% 
  filter(is.na(receita), is.na(orcamento))

# exercício 10
# Filtre apenas os filmes de Ação e Comédia com nota maior do que 8.
imdb %>% 
  filter(generos %in% c("Action", "Commedy"), nota_imdb > 8)

# exercício 11
# Pesquise sobre a função between. Quais filmes são da década de 1990?
?between
imdb %>% 
  filter(between(ano, 1990, 1999))

imdb %>% 
  filter(ano >= 1990, ano <= 1999)


imdb %>%
  arrange(nota_imdb) %>% 
  View()

# arrange ---------------------------------------------------------------------

# exercício 1
# Ordene os filmes em ordem crescente de ano e decrescente de orçamento
imdb %>% 
  arrange(ano, desc(orcamento))

# exercício 2 
# Ordene por ordem decrescente do orçamento os filmes de um diretor a sua escolha
imdb %>% 
  filter(diretor == "Wes Anderson") %>% 
  arrange(desc(orcamento)) %>% 
  View()

imdb %>% 
  select(titulo, ano, diretor, duracao)

imdb_menor <- imdb %>% 
  select(titulo, ano, diretor, duracao)

imdb_menor

library(writexl)
write_xlsx(imdb_menor, "C")

# select ----------------------------------------------------------------------
imdb %>% 
  print(n = 30)
# exercício 1
# Crie uma tabela com apenas as colunas titulo, diretor, e orcamento.
imdb %>%
  select(titulo, diretor, orcamento)


# exercício 2
# Remova as colunas ator_1, ator_2 e ator_3 de três formas diferentes
imdb %>% 
  select(-ator_1, -ator_2, -ator_3)

imdb %>% 
  select(- c(ator_1, ator_2, ator_3))

imdb %>% 
  select(-contains("ator"))

imdb %>% 
  select(-starts_with("ator"))

imdb %>% 
  select(titulo:likes_facebook, genero)

imdb %>% 
  select(-13, -14, -15)

imdb %>% 
  select(-matches("ator_[1-3]"))

# exercício 3
# Crie uma tabela apenas com filmes do Spike Lee e as colunas titulo e ano
# ordenada por ano.
imdb %>% 
  filter(diretor == "Spike Lee") %>% 
  select(titulo, ano) %>% 
  arrange(ano)

# exercício 4
# Crie uma tabela com título, ano, nome do diretor e genero do diretor dos 
# filmes desta década. Organize as observações pelo genero e salve o 
# resultado no objeto "filmes_recentes"

filmes_recentes <- imdb %>% 
  filter(between(ano, 2010, 2019)) %>% 
  arrange(genero) %>% 
  select(titulo, ano, diretor, genero)

filmes_recentes <- imdb %>% 
  filter(between(ano, 2010, 2019)) %>% 
  select(titulo, ano, diretor, genero) %>%
  arrange(genero)
  

filmes_recentes <- imdb %>% 
  filter(ano > 2010) %>% 
  select(titulo, ano, diretor, genero) %>%
  arrange(genero)

# mutate ----------------------------------------------------------------------
texto <- c("Tomás", "tomas", "tomás", "TOMAS")

str_to_lower(texto) %>% 
  str_replace_all("á", "a")

texto %>% 
  str_detect("T")

texto2 <- "Curso de R da enap"
str_replace(texto2, "a", "o")
str_replace_all(texto2, "a", "o")
# exercício 1
# Crie uma variável chamada lucro. Salve em um objeto chamado imdb_lucro.
imdb_lucro <- imdb %>% 
    mutate(lucro = receita - orcamento)

imdb_lucro <- imdb %>% 
  mutate(lucro = receita - orcamento)

View(imdb_lucro)

# exercicio 2
# Modifique a variável lucro para ficar na escala de milhões de dólares.
imdb_lucro <- imdb_lucro %>% 
  mutate(lucro = lucro / 1e6)

imdb_lucro2 <- imdb %>% 
  mutate(orcamento = orcamento / 1e6,
         receita = receita / 1e6,
         lucro = receita - orcamento)

# exercício 3
# Filtre apenas os filmes com prejuízo maior do que 3 milhões de dólares. 
# Os filmes com o maior prejuízo devem aparecer primeiro.
imdb_lucro %>% 
  filter(lucro < -3) %>% 
  arrange(lucro)

imdb_lucro %>% 
  filter(lucro < -3) %>% 
  arrange(lucro) %>% 
  select(titulo, ano, orcamento, receita ,lucro)


# exercício 4
# Estude a documentação das funções str_to_upper() e 
# str_to_lower()
# Crie a variável titulo_maisculo e titulo_minusculo e
# salve o resultado em imdb2
?str_to_lower
imdb2 <- imdb %>% 
  mutate(titulo_maiusculo = str_to_upper(titulo),
         titulo_minusculo = str_to_lower(titulo))
View(imdb2)

# exercício 5
# Use o data.frame imdb2 para selecionar apenas os filmes
# com "alien" do titulo. Qual o melhor (maior nota) deles?
imdb2 %>% 
  filter(str_detect(titulo_minusculo, "alien")) %>% 
  arrange(desc(nota_imdb)) %>% 
  select(titulo, ano, diretor, nota_imdb)

vetor <- c(1, 2, NA)
max(vetor, na.rm = TRUE)

imdb %>% 
  filter(nota_imdb == max(nota_imdb, na.rm = TRUE))

imdb %>% 
  group_by(diretor) %>% 
  filter(nota_imdb == max(nota_imdb, na.rm = TRUE))


# summarise -------------------------------------------------------------------
# exercício 1
# Use o `summarise` para calcular a proporção de filmes com diretoras.
imdb %>% 
  group_by(genero) %>% 
  summarise(conta = n()) %>% 
  mutate(prop = conta / sum(conta))

imdb %>% 
  mutate(eh_mulher = genero == "mulher") %>%
  select(eh_mulher, genero) %>% 
  summarise(prop = mean(eh_mulher, na.rm = TRUE))

v <- c(1, 0, 1, 0)
sum(v)
mean(v)


# exercício 2
# Calcule a duração média e mediana dos filmes da base.
imdb %>% 
  summarise(mediana = median(duracao, na.rm = TRUE),
            media = mean(duracao, na.rm = TRUE))


# exercício 3
# Calcule o lucro médio dos filmes com duracao < 60 minutos. E o lucro médio dos filmes com
# mais de 2 horas.
imdb_lucro %>% 
  filter(duracao < 60) %>% 
  summarise(media = mean(lucro, na.rm = TRUE))

imdb_lucro %>% 
  filter(duracao > 120) %>% 
  summarise(media = mean(lucro, na.rm = TRUE))

imdb_lucro %>% 
  mutate(cat_duracao = ifelse(duracao < 60, "curto", ifelse(duracao > 120, "longo", "normal"))) %>% 
  group_by(cat_duracao) %>% 
  summarise(media = mean(lucro, na.rm = TRUE))


# exercício 4
# E as medianas para os mesmos grupos, aprentam comportamento similar?
imdb_lucro %>% 
  mutate(cat_duracao = ifelse(duracao < 60, "curto", ifelse(duracao > 120, "longo", "normal"))) %>% 
  group_by(cat_duracao) %>% 
  summarise(mediana = median(lucro, na.rm = TRUE))

# group_by + summarise --------------------------------------------------------

# exercício 1
# Crie uma tabela com apenas o nome dos diretores com mais de 10 filmes.


# exercício 2
# Crie uma tabela com a receita média e mediana dos filmes por ano.


# exercício 3
# Crie uma tabela com a maior e a menor nota dos filmes por tipo de classificação.

# exercicio 4
# Quantos filmes foram dirigidos por homem e
# quantos foram dirigidos por mulheres?


# exercício 5
# Crie uma tabela com o desvio padrão dos lucros dos filmes
# para cada genero (masculino / feminio)
# e para cada ano


# uniao -----------------------------------------------------------------------
# exercicio 1

atores <- imdb %>% 
  mutate(id = seq_along(titulo)) %>% 
  select(id, titulo, ator_1:ator_3)
atores

atores_tidy <- gather(atores, key = papel, value = ator,
                      ator_1:ator_3)
atores_tidy

atores_tidy %>% 
  group_by(ator) %>% 
  summarise(n = n())

atores_tidy %>% 
  count(ator)

atores_tidy %>% 
  group_by(ator) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

atores_tidy %>% 
  count(ator, sort = TRUE)

atores_tidy %>% 
  count(papel, ator, sort = TRUE)

atores_tidy %>% 
  count(papel, ator, sort = TRUE) %>% 
  filter(papel == "ator_3")

atores_tidy %>% 
  count(papel, ator, sort = TRUE) %>% 
  spread(papel, n, fill = 0) %>% 
  arrange(desc(ator_2))
