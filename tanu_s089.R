library(dplyr)

data_jan <- data.frame(
  ID = c(01, 02, 03),
  Name = c("Aayu", "Sruuu", "Tanu"),
  Jan_Sales = c(1000, 1590, 2080)
)

data_feb <- data.frame(
  ID = c(04, 05, 06),
  Name = c("Aayu", "Sruuu", "Tanu"),
  Feb_Sales = c(1220, 1260, 1210)
)

data_new_hires <- data.frame(
  ID = c(4, 5),
  Name = c("Tinu", "honney"),
  Jan_Sales = c(50, 60)
)

merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))
print("--- Merged Data (Columns Added) ---")
print(merged_data)

final_list <- bind_rows(data_jan, data_new_hires)
print("--- Appended Data (Rows Added) ---")
print(final_list)
