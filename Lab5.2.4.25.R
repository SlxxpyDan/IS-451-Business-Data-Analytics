#UNIVERSAL BANK

#STEP 1 load data
bank.df <- read.csv("UniversalBank.csv", stringsAsFactors = TRUE)

#Step 2: Partition the records into 60% training vs. 40% validation with the seed set to 11.
set.seed(11)  # set seed for reproducing the partition
# Random sample indexes
train.index <- sample(1:nrow(bank.df), nrow(bank.df)*0.6)
train.index

# Build training and validation set by indexing
train.df <- bank.df[train.index, ]
valid.df <- bank.df[-train.index, ]

#Step 3: Build classification tree from training data.
# if not installed, run:
#install.packages("rpart")
library(rpart)
# if not installed, run:
#install.packages("rpart.plot") to visualize tree after model fitting
library(rpart.plot)

#Default classification tree
#We first generate the default tree using rpart() function if you do not specify any controllable values.
#Personal.Loan ~ . is a formula, meaning that Personal.Loan is our target, and all the other variables 
#in the data frame (train.df) are predictors.
default.ct <- rpart(Personal.Loan ~ ., data = train.df, method = "class")

#default.ct holds the fitted classification tree. We can visualize the tree structure by calling the rpart.plot 
#function. You can control plotting parameters such as type, color, shape, and information displayed 
#(which and where). See more information using ?rpart.plot.
#We can change different plotting styles and add different information in the display.

#Displaying extra information at the nodes (possible values 1 - 11).
rpart.plot(default.ct, type = 1, extra = 1)

#Generate other trees
#We can control some of the parameters to vary the rpart fit. For example,

#minbucket: the minimum number of observations in any terminal leaf node
#maxdepth: the maximum depth of any node of the final tree, with the root node counted as depth 0.

my.ct <- rpart(Personal.Loan ~ ., data = train.df, method = "class", control = rpart.control(maxdepth =  3, minbucket =  30))
rpart.plot(my.ct,  type=1, extra = 1)

#Make predictions for the validation data
# classify records in the validation data.
# set argument type = "class" in predict() to generate predicted class membership.
# Otherwise, a probability of belonging to each class
default.ct.point.pred <- predict(default.ct, valid.df, type = "class")

#Find classification accuracy
#install.packages("caret", dependencies = TRUE)
library(caret)

## Loading required package: ggplot2
## Loading required package: lattice
library(ggplot2)
library(lattice)

# generate confusion matrix for validation data
confusionMatrix(default.ct.point.pred, factor(valid.df$Personal.Loan))

#In the output confusion matrix, Reference means actual labels, Prediction means 
#predicted labels. The validation accuracy for the default tree is 0.9775.

