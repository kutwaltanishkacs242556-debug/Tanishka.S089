# ================================
# StudentsPerformance Export Script
# ================================

# 1. Load dataset
students <- read.csv("C:/Users/mvlui/Downloads/StudentsPerformance - StudentsPerformance.csv")

# 2. Inspect structure
head(students)
str(students)

# 3. Create summary statistics
summary_df <- as.data.frame(summary(students))

# -------------------------------
# Export Results
# -------------------------------

# Export to CSV
write.csv(summary_df, "StudentsPerformance_Summary.csv", row.names = TRUE)

# Export to Excel
if (!require(writexl)) install.packages("writexl")
library(writexl)
write_xlsx(summary_df, "StudentsPerformance_Summary.xlsx")

# Export to PDF (tables + plots)
if (!require(gridExtra)) install.packages("gridExtra")
library(gridExtra)

pdf("StudentsPerformance_Report.pdf")

# Add summary table
grid.table(summary_df)

# Add plots
par(mfrow = c(2,2))  # 2x2 layout

# Histogram of Math Scores
hist(students$math.score,
     main = "Distribution of Math Scores",
     xlab = "Math Score",
     col = "skyblue", border = "white")

# Boxplot of Math Scores by Gender
boxplot(math.score ~ gender, data = students,
        main = "Math Scores by Gender",
        xlab = "Gender", ylab = "Math Score",
        col = c("pink", "lightblue"))

# Scatterplot: Reading vs Writing
plot(students$reading.score, students$writing.score,
     main = "Reading vs Writing Scores",
     xlab = "Reading Score", ylab = "Writing Score",
     pch = 19, col = "darkgreen")
abline(lm(writing.score ~ reading.score, data = students), col = "red")

# Boxplot of Writing Scores by Lunch Type
boxplot(writing.score ~ lunch, data = students,
        main = "Writing Scores by Lunch Type",
        xlab = "Lunch Type", ylab = "Writing Score",
        col = c("lightgreen", "orange"))

dev.off()