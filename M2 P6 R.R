library(dplyr)

df <- read.csv("winequality-white new.csv")

head(df)
str(df)
summary(df)

df$fixed.acidity <- as.numeric(df$fixed.acidity)
df$volatile.acidity <- as.numeric(df$volatile.acidity)

sum(is.na(df$fixed.acidity))
sum(is.na(df$volatile.acidity))

df <- df %>% filter(!is.na(fixed.acidity), !is.na(volatile.acidity))

summary(df$fixed.acidity)
summary(df$volatile.acidity)

fixed_freq <- table(df$fixed.acidity)
print(fixed_freq)

volatile_freq <- table(df$volatile.acidity)
print(volatile_freq)

acid_crosstab <- table(df$fixed.acidity > median(df$fixed.acidity),
                       df$volatile.acidity > median(df$volatile.acidity))
print(acid_crosstab)

t.test(df$fixed.acidity, mu = mean(df$fixed.acidity))

t.test(df$volatile.acidity, mu = mean(df$volatile.acidity))

t.test(df$fixed.acidity, df$volatile.acidity)

t.test(df$fixed.acidity, df$volatile.acidity, paired = TRUE)
