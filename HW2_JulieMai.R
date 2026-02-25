#1
delays.df <- read.csv("FlightDelay.csv", stringsAsFactors = TRUE)

load("TrainIndex2.rda")
train.df <- delays.df[train.index, ]
valid.df <- delays.df[-train.index, ]

#2
library(rpart)
library(rpart.plot)

flight.ct <- rpart(Flight.Status ~ CRS_DEP_TIME + CARRIER + DEST + 
                     DISTANCE + ORIGIN + Weather + DAY_WEEK, 
                   data = train.df, method = "class")

rpart.plot(flight.ct, type = 1, extra = 1)

#3
# prediction
library(caret)
flight.ct.pred <- predict(flight.ct, valid.df, type = "class")

#confusion matrix
confusionMatrix(flight.ct.pred, factor(valid.df$Flight.Status))

#6
#New tree excluding both DEP_TIME and Weather with diff parameters
flight.ct2 <- rpart(Flight.Status ~ CRS_DEP_TIME + CARRIER + DEST + 
                      DISTANCE + ORIGIN + DAY_WEEK, 
                    data = train.df, 
                    method = "class",
                    control = rpart.control(cp = 0.001, minsplit = 20, minbucket = 10))

rpart.plot(flight.ct2, type = 1, extra = 1)


