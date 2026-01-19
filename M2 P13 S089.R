# Create small dataset
data <- data.frame(
  Age = c(20, 25, 30, 35, 40),
  Purchase_Amount = c(200, 300, 400, 500, 600)
)

# Linear Regression
model <- lm(Purchase_Amount ~ Age, data = data)

# Show summary
summary(model)

# Simple Graph
plot(
  data$Age,
  data$Purchase_Amount,
  main = "Age vs Purchase Amount",
  xlab = "Age",
  ylab = "Purchase Amount",
  pch = 19
)

abline(model, col = "red")
