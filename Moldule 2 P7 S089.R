library(dplyr)

df <- read.csv("Mall_Customers.csv")

str(df)

df$Genre <- as.factor(df$Genre)

anova_model <- aov(Spending.Score..1.100. ~ Genre, data = df)

summary(anova_model)
