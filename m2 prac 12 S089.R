shopping_data <- read.csv("C:/Users/mvlui/Downloads/shopping behaviour.csv")

head(shopping_data)
str(shopping_data)

numeric_data <- shopping_data[sapply(shopping_data, is.numeric)]

head(numeric_data)

correlation_matrix <- cor(numeric_data, use = "complete.obs")

print(correlation_matrix)

rounded_correlation <- round(correlation_matrix, 2)

print(rounded_correlation)
