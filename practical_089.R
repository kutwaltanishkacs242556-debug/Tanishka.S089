install.packages("stringr")
install.packages("tidyr")
library(stringr)
library(tidyr)
library(dplyr)

data <- read.csv("team_records.csv", stringsAsFactors = FALSE)

print("--- Original Dataset ---")
print(head(data))

team_col <- if ("Team" %in% names(data)) "Team" else names(data)[1]
season_col <- if ("Season" %in% names(data)) "Season" else NA
record_col <- if ("Record" %in% names(data)) "Record" else NA

data[[team_col]] <- as.character(data[[team_col]])
data$Team_Code <- str_sub(data[[team_col]], 1, 3)

if (!is.na(season_col)) {
  data[[season_col]] <- as.character(data[[season_col]])
  data$Season_Year <- str_sub(data[[season_col]], -2, -1)
} else {
  data$Season_Year <- NA_character_
}

print("--- Data after str_sub() ---")
print(data %>% select(all_of(c(team_col, "Team_Code", "Season_Year"))))

if (!is.na(record_col)) {
  data[[record_col]] <- as.character(data[[record_col]])
  split_list <- str_split(data[[record_col]], "-", simplify = FALSE)
  print("--- Basic Split Output (List format) ---")
  if (length(split_list) > 0) print(split_list[[1]])
  split_matrix <- str_split(data[[record_col]], "-", simplify = TRUE)
  if (ncol(split_matrix) < 2) split_matrix <- cbind(split_matrix, rep("", nrow(split_matrix)))
  data$Wins <- split_matrix[, 1]
  data$Losses <- split_matrix[, 2]
  print("--- Data after str_split() (Manual Assignment) ---")
  print(data %>% select(all_of(c(record_col, "Wins", "Losses"))))
} else {
  data$Wins <- NA_character_
  data$Losses <- NA_character_
  print("Column 'Record' not found; Wins and Losses set to NA")
}

if (!is.na(season_col)) {
  data$.season_temp <- as.character(data[[season_col]])
  tidy_data <- data %>% separate(.season_temp, into = c("Start", "End"), sep = "-", fill = "right", extra = "merge")
  print("--- Bonus: The 'separate' function (easier splitting) ---")
  print(tidy_data %>% select(Start, End))
} else {
  print("Column 'Season' not found; cannot separate")
}
