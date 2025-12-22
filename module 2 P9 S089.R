library(dplyr)

df <- read.csv("Mall_Customers.csv")

str(df)

df$Genre <- as.factor(df$Genre)

df$Age_Group <- cut(df$Age,
                    breaks = c(0, 25, 40, 60, 100),
                    labels = c("Young", "Adult", "Middle", "Senior"))

table_genre_age <- table(df$Genre, df$Age_Group)

table_genre_age

chi_result <- chisq.test(table_genre_age)

chi_result
