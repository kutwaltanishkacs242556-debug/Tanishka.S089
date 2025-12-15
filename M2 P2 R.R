library(dplyr)

df <- read.csv("team_records.csv")

print("Displaying first few rows of the dataset:")
head(df)

print("Displaying structure of the dataset:")
str(df)

print("Displaying column names of the dataset:")
colnames(df)

if ("Team" %in% colnames(df)) {
  
  print("Generating frequency table using table() function:")
  team_table <- table(df$Team)
  print(team_table)
  
  print("Generating frequency table using count() function from dplyr:")
  team_count <- df %>% count(Team)
  print(team_count)
  
} else {
  
  print("Team column not found in the dataset")
}

print("Program execution completed successfully")
