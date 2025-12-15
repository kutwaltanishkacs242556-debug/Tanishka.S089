df <- read.csv("shopping behaviour.csv")

print("Displaying first few rows of the dataset:")
head(df)

print("Displaying structure of the dataset:")
str(df)

print("Displaying column names of the dataset:")
colnames(df)

if ("Age" %in% colnames(df)) {
  
  print("Converting Age column to numeric")
  df$Age <- as.numeric(as.character(df$Age))
  
} else {
  
  print("Age column not found in the dataset")
}

if ("Age" %in% colnames(df)) {
  
  print("Creating Age_Group variable using ifelse condition")
  df$Age_Group <- ifelse(df$Age >= 30, "Senior", "Junior")
  
} else {
  
  print("Age_Group could not be created because Age column is missing")
}

if ("Gender" %in% colnames(df) && "Age_Group" %in% colnames(df)) {
  
  print("Creating cross-tabulation using table() function")
  cross_table <- table(df$Gender, df$Age_Group)
  print(cross_table)
  
} else {
  
  print("Required columns for cross-tabulation not found")
}

print("Cross-tabulation program executed successfully")
