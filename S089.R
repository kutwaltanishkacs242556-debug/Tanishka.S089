library(dplyr)

data <- read.csv("Message Group - Product.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(data, 3))

selected_cols <- data %>%
  select(BrandName, Product.ID, Category)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

range_cols <- data %>%
  select(BrandName:Brand.Desc)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

starts_with_p <- data %>%
  select(starts_with("P"))

print("--- Selected columns starting with 'P' ---")
print(head(starts_with_p, 3))

dropped_one <- data %>%
  select(-Discount)

print("--- Dataset with 'Discount' dropped ---")
print(names(dropped_one))

dropped_multiple <- data %>%
  select(-Currancy, -MRP)

print("--- Dataset with 'Currancy' and 'MRP' dropped ---")
print(names(dropped_multiple))

dropped_range <- data %>%
  select(-(Product.Size:SellPrice))

print("--- Dataset with range 'Product.Size' to 'SellPrice' dropped ---")
print(names(dropped_range))
