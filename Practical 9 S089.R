install.packages("stringr")
install.packages("tidyr")
library(stringr)
library(tidyr)
library(dplyr)

data <- read.csv("team_records.csv")

col1 <- names(data)[1]
col2 <- names(data)[2]

data$Part1 <- str_sub(data[[col1]], 1, 4)
data$Part2 <- str_sub(data[[col1]], 1, 5)

split_matrix <- str_split(data[[col2]], " ", simplify = TRUE)

if(ncol(split_matrix) < 2){
  split_matrix <- cbind(split_matrix, "")
}

data$Split1 <- split_matrix[, 1]
data$Split2 <- split_matrix[, 2]

tidy_data <- data %>%
  separate(col1, into = c("S1", "S2", "S3"), sep = "-", fill = "right")

print(data)
print(tidy_data)
