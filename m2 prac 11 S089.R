library(ggplot2)

shopping_data <- read.csv("C:/Users/mvlui/Downloads/shopping behaviour.csv")

head(shopping_data)
str(shopping_data)

ggplot(shopping_data, aes(x = Purchase.Amount..USD.)) +
  geom_histogram(binwidth = 10) +
  labs(
    title = "Histogram of Purchase Amount",
    x = "Purchase Amount (USD)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(shopping_data, aes(x = Purchase.Amount..USD.)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ Category) +
  labs(
    title = "Histogram of Purchase Amount by Category",
    x = "Purchase Amount (USD)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(shopping_data, aes(y = Purchase.Amount..USD.)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Purchase Amount",
    y = "Purchase Amount (USD)"
  ) +
  theme_minimal()

ggplot(shopping_data, aes(x = Gender, y = Purchase.Amount..USD.)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Purchase Amount by Gender",
    x = "Gender",
    y = "Purchase Amount (USD)"
  ) +
  theme_minimal()
