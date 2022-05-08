
# Correlações -------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data do script: 07/05/22 -----------------------------------------------------------------------------------------------------------------
# Referência: Curso Udemy ------------------------------------------------------------------------------------------------------------------

# Correlação simples  ----------------------------------------------------------------------------------------------------------------------

### Medida da relação entre duas variáveis.

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

data() # Visualização de todos os dados disponíveis e suas descrições
data("Orange")
View(Orange)

# Checar dados com gráfico de pontos -------------------------------------------------------------------------------------------------------

plot(Orange$age, Orange$circumference)

# Correlação de Pearson --------------------------------------------------------------------------------------------------------------------

cor(Orange$age, Orange$circumference) # Correlação geral

# Teste estatístico da correlação ----------------------------------------------------------------------------------------------------------

cor.test(Orange$age, Orange$circumference) # Padrão = Pearson

# Outros tipos de correlação ---------------------------------------------------------------------------------------------------------------

cor(Orange$age, Orange$circumference, method = "pearson")
cor.test(Orange$age, Orange$circumference, method = "kendall")
cor.test(Orange$age, Orange$circumference, method = "spearman")

# Correlações com múltiplas variáveis ------------------------------------------------------------------------------------------------------

### Matriz de correlação: correlações entre múltiplas variáveis

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

data("mtcars")
View(mtcars)

# Matriz de correlação ---------------------------------------------------------------------------------------------------------------------

cor(mtcars)

### Carregar pacote

library(corrplot)
?corrplot

### Dados para matriz

m <- cor(mtcars)
View(m)

### Tipos de matrizes

corrplot(m) # Padrão com circulos
corrplot(m, method = "color") # Cores
corrplot(m, method = "ellipse") # Elipses
corrplot(m, method = "shade") # Tons
corrplot(m, method = "number") # Números dos valores das correlações

### Posições

corrplot(m, type = "upper") 
corrplot(m, type = "lower") 
corrplot(m, type = "lower", method = "number")

# Matriz e gráficos mais complexos ---------------------------------------------------------------------------------------------------------

### Carregar pacote

library(Hmisc)

### Matriz

m <- rcorr(as.matrix(mtcars)) # Retorna matriz com valores de correlação, n e valores de p
m

m$r # Valores de correlação
m$P # Valores de p

### Gráfico

corrplot(m$r, p.mat = m$p, sig.level = 0.005)
corrplot(m$r, p.mat = m$p, sig.level = 0.001,
         method = "number", type = "upper")

# Alternativa para matriz ------------------------------------------------------------------------------------------------------------------

### Carregar pacote

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

md <- mtcars[ , c(1, 3, 4, 5, 6, 7)] # Filtra algumas colunas e seleciona todas as linhas
md

chart.Correlation(md, histogram = TRUE)

### A distribuição de cada grupo está na diagonal
### Metade inferior: gráficos de pontos com linhas de aproximação
### Metade superior: Valores das correlações
### Cada nível de significância está associada aos símbolos dos asteriscos