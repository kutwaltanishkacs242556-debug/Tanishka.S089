library(ggplot2)
library(dplyr)


shades <- read.csv("shades (1).csv")

str(shades)
head(shades)

shades$brand <- as.factor(shades$brand)
shades$product <- as.factor(shades$product)
shades$group <- as.factor(shades$group)

ggplot(shades, aes(x = brand)) +
  geom_bar() +
  labs(
    title = "Number of Shades by Brand",
    x = "Brand",
    y = "Number of Shades"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(shades, aes(x = product)) +
  geom_bar() +
  labs(
    title = "Number of Shades by Product",
    x = "Product",
    y = "Number of Shades"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(shades, aes(x = brand, y = L)) +
  geom_boxplot() +
  labs(
    title = "Lightness (L) Distribution by Brand",
    x = "Brand",
    y = "Lightness (L)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(shades, aes(x = H, y = L)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Hue vs Lightness",
    x = "Hue (H)",
    y = "Lightness (L)"
  ) +
  theme_minimal()

ggplot(shades, aes(x = group)) +
  geom_bar() +
  labs(
    title = "Number of Shades by Group",
    x = "Shade Group",
    y = "Number of Shades"
  ) +
  theme_minimal()

ggplot(shades, aes(x = S)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of Saturation (S)",
    x = "Saturation",
    y = "Count"
  ) +
  theme_minimal()
