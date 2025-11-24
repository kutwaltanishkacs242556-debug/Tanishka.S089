library(dplyr)
library(readr)

customers <- read_csv("Mall_Customers.csv")

print(head(customers))

# Method 1: Using subset() (Base R)

# Example 1: Single Condition
high_spenders_subset <- subset(customers, `Spending Score (1-100)` > 70)
print(head(high_spenders_subset))

# Example 2: Multiple Conditions (AND)
high_income_high_spend_subset <- subset(customers, `Annual Income (k$)` > 80 & `Spending Score (1-100)` > 70)
print(head(high_income_high_spend_subset))

# Example 3: Multiple Conditions (OR)
young_or_male_subset <- subset(customers, Genre == 'Male' | Age < 20)
print(head(young_or_male_subset))


# Method 2: Using filter() (Tidyverse/dplyr)

# Example 1: Single Condition
high_income_filter <- customers |>
  filter(`Annual Income (k$)` > 80)
summary(high_income_filter$`Annual Income (k$)`)

# Example 2: Multiple Conditions (Comma-Separated/AND)
low_spend_female_filter <- customers |>
  filter(Genre == 'Female', `Spending Score (1-100)` < 30)
print(head(low_spend_female_filter))

# Example 3: Checking for Values in a Set (%in%)
target_age_filter <- customers |>
  filter(Age %in% c(25, 30, 35))
print(table(target_age_filter$Age))