#2
library(ggplot2)
wine.df <- read.csv("wine.csv", stringsAsFactors = TRUE)
ggplot(data = wine.df) + geom_point(aes(x = alcohol, y = density)) +
  labs(
    title = "Alcohol Content vs. Wine Density",
    x = "Alcohol Content",
    y = "Density"
  )

#3
#partition (75% training, 25% validation)
set.seed(555)
train.index <- sample(1:nrow(wine.df), nrow(wine.df) * 0.75)
train.df <- wine.df[train.index, ]
valid.df <- wine.df[-train.index, ]

#linear regression
wine.lm <- lm(quality ~ ., data = train.df)
summary(wine.lm)

#5
options(scipen=999, digits = 3)
library(forecast)
wine.lm.pred.train <- predict(wine.lm, train.df)
accuracy(wine.lm.pred.train, train.df$quality)

#6
wine.lm.pred.valid <- predict(wine.lm, valid.df)
accuracy(wine.lm.pred.valid, valid.df$quality)