# Objetos ---------------------------------------------------------------------
# 1. Salve a informação do seu nome em um objeto chamado nome

# 2. Defina um objeto altura com sua altura em metros

# 3. Qual a classe dos objetos criados?

# Vetores ---------------------------------------------------------------------
# 1. Crie um objeto (nomes) que tenha o seu nome e o nome de um colega

# 2. Crie um objeto (alturas) que tenha a sua altura e a altura de um colega

# 3. Selecione apenas a maior altura. Faça o mesmo com a menor.

# 4. Qual a altura média das alturas? use "+" para soma e "/" para divisão

# 5. Selecione o seu nome no vetor "nomes" de duas formas diferentes


# Comparações lógicas e numéricas ---------------------------------------------
# Para os exercicios desta parte, use o vetor "valores"
set.seed(123)
valores <- rnorm(10, 1.75, 0.08)

# 1. Todos os valores são maiores do que 1.60?


# 2. Há algum valor maior do que 1.90?


# 3. Selecione apenas os valores maiores do que 1.7 metros.


# 4. Selecione apenas os valores maiores que 1.70 e menores do que 1.80  


# 5. Selecione apenas os valores menores que 1.70 ou maiores do que 1.80   

# Use o novo vetor valores para o próximo exercício
valores[c(3, 6, 8, 9)] <- NA
valores

# 6. Selecione apenas os valores que não são NA em "valores".
# salve o resultado em valores2



# Operações vetoriais ---------------------------------------------------------
# 1. Descubra a raiz de cada uma das alturas salvas em valores2. Veja ?sqrt


# 2. Dê mais 5 centímetros de altura a todos


# 3. Qual a proporção de casos de valores2 são maiores do que 1.75?
# Resolva usando sum() e mean(). Por que isso acontece?



# Funções ---------------------------------------------------------------------
# O IMC é um indicador de massa corporal, cuja fórmula 
# é "massa / (altura em metros ao quadrado)"
# Ex: 80 quilos e 2 metros de altura: 80 / 4 = 20
# 1. Crie uma função que, dado peso e altura, calcula o IMC. 



# Controle de fluxo -----------------------------------------------------------
# 1. Para cada valor em "valores2", imprima "alto" ou "baixo" caso o valor
# esteja abaixo ou acima de um valor a sua escolha. Use o loop.


# 2. Tente resolver o problema acima de forma vetorizada.


