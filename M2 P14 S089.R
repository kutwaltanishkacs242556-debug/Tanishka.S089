# Load library
library(ggplot2)

# Create small dataset
data <- data.frame(
  alcohol = c(9, 9.5, 10, 10.5, 11, 11.5),
  High_Quality = c(0, 0, 0, 1, 1, 1)
)

# Convert to factor
data$High_Quality <- as.factor(data$High_Quality)

# Logistic Regression Model
model <- glm(High_Quality ~ alcohol,
             data = data,
             family = binomial)

summary(model)

# Proper & clear graph
ggplot(data, aes(x = alcohol, y = as.numeric(High_Quality) - 1)) +
  geom_point(size = 3) +
  stat_smooth(
    method = "glm",
    method.args = list(family = "binomial"),
    se = FALSE
  ) +
  labs(
    title = "Alcohol vs Wine Quality (Small Data)",
    x = "Alcohol Content",
    y = "Probability of High Quality"
  ) +
  theme_minimal()
