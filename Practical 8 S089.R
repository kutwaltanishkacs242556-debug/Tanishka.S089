library(dplyr)

data <- read.csv("winequality-white new.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(data, 3))

selected_cols <- data %>%
  select(fixed.acidity, alcohol, quality)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

range_cols <- data %>%
  select(fixed.acidity:chlorides)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

starts_with_p <- data %>%
  select(starts_with("p"))

print("--- Selected columns starting with 'p' ---")
print(head(starts_with_p, 3))

dropped_one <- data %>%
  select(-quality)

print("--- Dataset with 'quality' dropped ---")
print(names(dropped_one))

dropped_multiple <- data %>%
  select(-density, -pH)

print("--- Dataset with 'density' and 'pH' dropped ---")
print(names(dropped_multiple))

dropped_range <- data %>%
  select(-(residual.sugar:total.sulfur.dioxide))

print("--- Dataset with range 'residual.sugar' to 'total.sulfur.dioxide' dropped ---")
print(names(dropped_range))
