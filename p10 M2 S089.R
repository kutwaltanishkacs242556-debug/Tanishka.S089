library(ggplot2)
library(dplyr)

team_records <- read.csv("C:/Users/mvlui/Downloads/team_records.csv")

str(team_records)
head(team_records)

team_records$Team <- as.factor(team_records$Team)

ggplot(team_records, aes(x = Team)) +
  geom_bar() +
  labs(title = "Number of Teams", x = "Team", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(team_records, aes(x = Team, y = Matches_won)) +
  geom_bar(stat = "identity") +
  labs(title = "Matches Won by Each Team", x = "Team", y = "Matches Won") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(team_records, aes(x = Team, y = Total_pts)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Points by Team", x = "Team", y = "Total Points") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(team_records, aes(x = Team, y = Avg_pts)) +
  geom_boxplot() +
  labs(title = "Average Points Distribution", x = "Team", y = "Average Points") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(team_records, aes(x = Successful_raids, y = Successful_tackles)) +
  geom_point(alpha = 0.7) +
  labs(title = "Successful Raids vs Successful Tackles",
       x = "Successful Raids",
       y = "Successful Tackles") +
  theme_minimal()

ggplot(team_records, aes(x = Super_tackles)) +
  geom_histogram(bins = 10) +
  labs(title = "Distribution of Super Tackles",
       x = "Super Tackles",
       y = "Frequency") +
  theme_minimal()
