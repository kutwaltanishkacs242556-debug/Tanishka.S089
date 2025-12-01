library(dplyr)
data_jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie"),
  Jan_Sales = c(100, 150, 200)
  
  data_feb <- data.frame(
    ID = c(1, 2, 3),
    Name = c("Alice", "Bob", "Charlie"),
    Feb_Sales = c(120, 160, 210)
  )
  data_new_hires <- data.frame(
    ID = c(4, 5),
    Name = c("David", "Eva"),
    Jan_Sales = c(50, 60)
    merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))
    
    print("--- Merged Data (Columns Added) ---")
    print(merged_data)
    
    final_list <- bind_rows(data_jan, data_new_hires)
    
    print("--- Appended Data (Rows Added) ---")
    print(final_list)
    