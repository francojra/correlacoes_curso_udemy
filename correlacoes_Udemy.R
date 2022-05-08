
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
