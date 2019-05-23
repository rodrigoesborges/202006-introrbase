# Objetos ---------------------------------------------------------------------
# 1. Salve a informação do seu nome em um objeto chamado nome
nome <- "fulana"

# 2. Defina um objeto altura com sua altura em metros
altura <- 1.80

# 3. Qual a classe dos objetos criados?
class(nome)
class(altura)

# Vetores ---------------------------------------------------------------------
# 1. Crie um objeto (nomes) que tenha o seu nome e o nome de um colega
nomes <- c("tomas", "allan")

# 2. Crie um objeto (alturas) que tenha a sua altura e a altura de um colega
alturas <- c(1.75, 1.80)

# 3. Selecione apenas a maior altura. Faça o mesmo com a menor.
# Maior
alturas[2]
alturas[-1]

# menor
alturas[c(1)]
alturas[c(TRUE, FALSE)]
maior <- c(FALSE, TRUE)
alturas[!maior]


# 4. Qual a altura média das alturas? use "+" para soma e "/" para divisão
mean(alturas)
sum(alturas) / 2
(alturas[1] + alturas[2]) / 2
sum(alturas/2)

# 5. Selecione o seu nome no vetor "nomes" de duas formas diferentes
nomes[1]
nomes[c(1)]
nomes[c(TRUE, FALSE)]
nomes[-2]

# Comparações lógicas e numéricas ---------------------------------------------
# Para os exercicios desta parte, use o vetor "valores"
set.seed(123)
valores <- rnorm(10, 1.75, 0.08)

# 1. Todos os valores são maiores do que 1.60?
valores_maior <- c(valores > 1.60)
valores_maior
all(valores > 1.60)
sum(valores > 1.60)
mean(valores > 1.60)

# 2. Há algum valor maior do que 1.90?
maiores <- valores > 1.90
maiores
any(maiores)

any(valores > 1.90)

# 3. Selecione apenas os valores maiores do que 1.7 metros.
indice <- valores > 1.7
valores[indice]

valores[valores > 1.7]

# 4. Selecione apenas os valores maiores que 1.70 e menores do que 1.80  
valores[valores > 1.70 & valores < 1.80]

# 5. Selecione apenas os valores menores que 1.70 ou maiores do que 1.80   
valores[valores < 1.70 | valores > 1.80]
valores[!(valores > 1.70 & valores < 1.80)]

# Use o novo vetor valores para o próximo exercício
valores[c(3, 6, 8, 9)] <- NA
valores

# 6. Selecione apenas os valores que não são NA em "valores".
# salve o resultado em valores2
valores2 <- valores[!is.na(valores)]
valores2

# Operações vetoriais ---------------------------------------------------------
# 1. Descubra a raiz de cada uma das alturas salvas
# em valores2. Veja ?sqrt
sqrt(valores2)

# 2. Dê mais 5 centímetros de altura a todos
valores2 <- valores2 + 0.05

# 3. Qual a proporção de casos de valores2 são 
# maiores do que 1.80?
# Resolva usando sum() e mean().
# Por que isso acontece?
sum(valores2 > 1.80) / 6
maiores <- valores2 > 1.80
maiores
mean(maiores)

# Funções ---------------------------------------------------------------------
# O IMC é um indicador de massa corporal, cuja fórmula 
# é "massa / (altura em metros ao quadrado)"
# Ex: 80 quilos e 2 metros de altura: 80 / 4 = 20
# 1. Crie uma função que, dado peso e altura, calcula o IMC. 
IMC <- function(peso, altura) {
  peso / (altura ^ 2)
}
IMC(80, 2)

IMC2 <- function(peso, altura) {
  peso / (altura ^ 3)
}
IMC2(80, 2)

80 / (1.75 ^ 2)
75 / (1.73 ^ 3)
60 / (1.65 ^ 3)

IMC2(80, 1.75)
IMC2(75, 1.73)
IMC2(60, 1.65)

# Controle de fluxo -----------------------------------------------------------
# 1. Para cada valor em "valores2", imprima "alto" ou "baixo" caso o valor
# esteja abaixo ou acima de um valor a sua escolha. Use o loop.
for (i in valores2) {
  if (i > 1.73) print("alto") else print("baixo")
}

if (valores2[1] > 1.73) print("alto") else print("baixo")
if (valores2[2] > 1.73) print("alto") else print("baixo")
...
if (valores2[6] > 1.73) print("alto") else print("baixo")


ifelse(valores2 > 1.73, "alto", "baixo")

# 2. Tente resolver o problema acima de forma vetorizada.
resposta <- c("baixo", "alto")
altos_lgl <- valores2 > 1.80
altos_int <- altos_lgl + 1
resposta[altos_int]

getwd()
library(tidyverse)

imdb <- read_csv("dados/imdb.csv")
imdb

write_csv2(imdb, "dados.csv")
write_delim(head(imdb), "delim.txt", "|")

library(writexl)
write_xlsx(imdb, "imdb.xlsx")

imdb <- read_csv("dados/imdb.csv")

filmes <- read_csv("dados/imdb.csv")

rm(imdb)


