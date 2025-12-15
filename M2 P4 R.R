library(dplyr)
library(psych)

df <- read.csv("Message Group - Product.csv")

summary(df$SellPrice)

describe(df$SellPrice)

category_counts <- table(df$Category)
print(category_counts)

category_df <- df %>% count(Category)
print(category_df)

cross_tab <- table(df$Category, df$BrandName)
print(cross_tab)

t_test_one <- t.test(df$SellPrice, mu = 1000)
print(t_test_one)

df$Price_Group <- ifelse(df$SellPrice >= median(df$SellPrice), "High", "Low")

t_test_two <- t.test(SellPrice ~ Price_Group, data = df)
print(t_test_two)

df$Old_Price <- df$SellPrice + runif(nrow(df), 100, 500)

t_test_paired <- t.test(df$SellPrice, df$Old_Price, paired = TRUE)
print(t_test_paired)
