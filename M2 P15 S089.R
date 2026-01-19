course_data <- read.csv("online_learning_course_consumption_dataset.csv")


head(course_data)
str(course_data)


summary_data <- summary(course_data)


summary_df <- as.data.frame(summary_data)


write.csv(summary_df, "Course_Data_Summary.csv", row.names = TRUE)


install.packages("writexl")   
library(writexl)

write_xlsx(summary_df, "Course_Data_Summary.xlsx")


pdf("Course_Data_Plot.pdf")
plot(course_data[,1],
     main = "First Column Data Plot",
     xlab = "Records",
     ylab = "Values")
dev.off()