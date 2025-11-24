library(dplyr)
library(readr)

data_frame <- read_csv("Test.csv")

# Example 1: Sorting by a Single Variable (Age Ascending)
data_frame_sorted_age <- data_frame |>
  arrange(Age)

head(data_frame_sorted_age, 5)

# Example 2: Sorting by a Single Variable (Family_Size Descending)
data_frame_sorted_family_desc <- data_frame |>
  arrange(desc(Family_Size))

head(data_frame_sorted_family_desc, 5)

# Example 3: Sorting by Two Variables (Gender Ascending, Work_Experience Descending)
data_frame_multi_sort <- data_frame |>
  arrange(Gender, desc(Work_Experience))

head(data_frame_multi_sort, 10)

# Example 4: Combined Filter and Sort (Filter Profession='Doctor', Sort by Age Ascending)
doctors_by_age <- data_frame |>
  filter(Profession == 'Doctor') |>
  arrange(Age)

print(doctors_by_age |> select(Profession, Age, Work_Experience) |> head(5))