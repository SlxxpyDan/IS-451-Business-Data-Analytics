##LINEAR REGRESSION##

#DATASET: ToyotaCorolla.csv

#load the dataset
toyota.df <- read.csv("ToyotaCorolla.csv", stringsAsFactors = TRUE)
#strings as factors
#strings to factors not characters
#model usually expects factors as categorical variables
#accept electric and gas (categories) as dummies (0,1)
#CONCLUSION: SET IT AS TRUE if we want to do regression

#Overview
View(toyota.df)
summary(toyota.df)
str(toyota.df) #structure
dim(toyota.df) #dimension
names(toyota.df) #names of the columns

#start regression
#price is linearly dependent on some of the factors in the dataset
cor(toyota.df$Price, toyota.df$KM) #correlation between Price column and KM column, strong
cor(toyota.df$Price, toyota.df$CC) #not strong bc absolute value is less than .2

#select some predictors
#check: run correlation -> large absolute value correlation is good
select.var <- c(3,4,7,8,9,10,12,13,14,17,28) #the variables we chose

car.df <- toyota.df[ , select.var]
#check the new data frame
View(car.df)
dim(car.df)
names(car.df)
str(car.df)

#partition dataset
#70% as train and 30% as evaluate
#random sample
set.seed(1) #random sample is reproducible
#select rows
train.index <- sample(1:nrow(car.df), nrow(car.df) * 0.7)
#above: sample(1:nrow(car.df) where do we want the sample from. 1 is the whole dataset
#nrow(car.df) * 0.7 is the portion (of training/evaluation)
train.df <- car.df[train.index, ]
valid.df <- car.df[-train.index, ]

#set up our regression model
#core function lm()
#stands for linear model

#Price = beta_0 + beta_1 * predictor1 + beta_2 * predictor2... + error
#our model will give us the beta values
#model formula
car.lm <- lm(Price~. , data = train.df)

#explanation of lm formula
# '~' is like an equal mark in this formula
# ~. means Price predicted using all other columns
names(train.df)
# ~KM means Price = \beta_0 + \beta_1 * KM + error
# ~KM + HP means Price = a + b * KM + c * HP + error
# ~KM : HP means Price = a + b * (KM * HP) + error the TA doesn't think this is very useful and deleted it

option(scipen =999, digits = 3)
#displays numbers in original form, not scientific
#scientific: a times 10^b

#check results of linear model
summary(car.lm)

#interpretation
#residuals
# 3Q-1Q means 50% of residuals are in its range
#median means median of all residuals
#median close to 0 means well centered (line goes thru all the dots???)

#coefficients
#estimates: value of "beta"
#std_errors: standard errors of beta estimates
#std_errors not very large  -> good
#Pr(>|t|): no star -> not relevant; * to ***: strong relvance to very strong
#low p value -> important predictor

#make precition on unknown data
car.lm.pred <- predict(car.lm, valid.df) #use validation data set
#evaluate our prediction
#add a new package "forecast"
install.packages("forecast")
library(forecast) #need to do this always before running code based on a package
accuracy(car.lm.pred, valid.df$Price)

#explain accuracy
#ME = mean error = avg of (predicted - true)
#MAE = mean absolute error = avg of |predicted - true|
#RMSE = mean squared error = avg of (predicted - true)^2
#MPE = mean percentage error = avg of (predicted - true)/true
#MAPE = mean absolute percentage error = average of |(predicted-true)/true|

#Q: when does MPE and MAPE blow up?

# exercise: Tayko.csv
#we want 80% training, 20% validation
#seed = 123
#run multiple linear regression
#predict, evaluate accuracy

tayko.df <- read.csv("Tayko.csv", stringsAsFactors = TRUE)

#Overview
View(tayko.df)
summary(tayko.df)
str(tayko.df) #structure
dim(tayko.df) #dimension
names(tayko.df) #names of the columns

