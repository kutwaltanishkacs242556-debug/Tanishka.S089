library(dplyr)

df <- read.csv("Mall_Customers.csv")

str(df)

df$Genre <- as.factor(df$Genre)

df$Income_Group <- cut(
  df$Annual.Income..k..,
  breaks = c(0, 30, 60, 100, 200),
  labels = c("Low", "Medium", "High", "Very_High")
)

anova_model <- aov(Spending.Score..1.100. ~ Genre * Income_Group, data = df)

summary(anova_model)
